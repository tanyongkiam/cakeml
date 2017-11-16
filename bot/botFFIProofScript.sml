open preamble
open ml_progLib ml_translatorLib cfMainTheory
open basisFunctionsLib cfTacticsLib cfLetAutoLib cfLib
open set_sepTheory semanticsLib
open botFFITheory MonitorProofTheory

(* Here, we prove a generic theorem that will let us turn
   CF-verified App theorems about the bot_ffi world model
   into a theorem about CakeML's semantics *)

val _ = new_theory "botFFIProof"

val bot_proj1_def = Define `
  bot_proj1 = λw. FEMPTY |++ (mk_proj1 bot_ffi_part w)`

val bot_proj2_def = Define `
  bot_proj2 = [mk_proj2 bot_ffi_part]`

val bot_ffi_oracle_def = Define `
  bot_ffi_oracle =
    \name w conf bytes.
     if name = "get_const" then
       case ffi_get_const conf bytes w of
       | SOME (bytes,w) => Oracle_return w bytes
       | _ => Oracle_fail else
     if name = "get_sensor" then
       case ffi_get_sensor conf bytes w of
       | SOME (bytes,w) => Oracle_return w bytes
       | _ => Oracle_fail else
     if name = "get_ctrl" then
       case ffi_get_control conf bytes w of
       | SOME (bytes,w) => Oracle_return w bytes
       | _ => Oracle_fail else
     if name = "actuate" then
       case ffi_actuate conf bytes w of
       | SOME (bytes,w) => Oracle_return w bytes
       | _ => Oracle_fail else
     if name = "has_next" then
       case ffi_has_next conf bytes w of
       | SOME (bytes,w) => Oracle_return w bytes
       | _ => Oracle_fail else
     if name = "violation" then
       case ffi_violation conf bytes w of
       | SOME (bytes,w) => Oracle_return w bytes
       | _ => Oracle_fail
      else
        Oracle_fail`

val bot_ffi_def = Define `
  bot_ffi w =
    <| oracle := bot_ffi_oracle
     ; ffi_state := w
     ; final_event := NONE
     ; io_events := [] |>`;

(* Rebuild the world from a trace *)
val extract_world_def = Define `
  (extract_world init_world [] = SOME init_world) ∧
  (extract_world init_world ((IO_event name conf bytes)::xs) =
  (* monadic style doesn't work here *)
    case (ALOOKUP [("get_const",ffi_get_const); ("get_sensor",ffi_get_sensor);
                   ("get_ctrl",ffi_get_control); ("actuate",ffi_actuate);
                   ("has_next",ffi_has_next); ("violation",ffi_violation)] name) of
    | SOME ffi_fun => (case ffi_fun conf (MAP FST bytes) init_world of
                       | SOME (bytes',world') => extract_world world' xs
                       | NONE => NONE)
    | NONE => NONE)`

val IOBOT_FFI_part_hprop = Q.store_thm("IOBOT_FFI_part_hprop",
  `FFI_part_hprop (IOBOT fs)`,
  rw [IOBOT_def,
      cfHeapsBaseTheory.IO_def, cfHeapsBaseTheory.IOx_def,
      bot_ffi_part_def, cfMainTheory.FFI_part_hprop_def,
    set_sepTheory.SEP_CLAUSES,set_sepTheory.SEP_EXISTS_THM,
    cfHeapsBaseTheory.W8ARRAY_def,
    cfHeapsBaseTheory.cell_def]
  \\ fs[set_sepTheory.one_STAR]
  \\ metis_tac[]);

val call_FFI_rel_IMP = Q.prove(`
  ∀st st'.
  call_FFI_rel^* st st' ==>
  st.oracle = bot_ffi_oracle ⇒
  ∃ls.
    st'.io_events = st.io_events ++ ls ∧
    extract_world st.ffi_state ls = SOME st'.ffi_state`,
  HO_MATCH_MP_TAC RTC_INDUCT \\ rw [] \\ fs [extract_world_def]
  \\ fs [evaluatePropsTheory.call_FFI_rel_def]
  \\ fs [ffiTheory.call_FFI_def]
  \\ EVERY_CASE_TAC \\ rw[]
  \\ fs[extract_world_def,bot_ffi_oracle_def]
  \\ qpat_x_assum`_ = Oracle_return f l` mp_tac
  \\ fs[MAP_ZIP]
  \\ rpt(IF_CASES_TAC \\fs[] >- ntac 2 (TOP_CASE_TAC\\simp[])));

val main_call = ``Tdec (Dlet unknown_loc (Pcon NONE []) (App Opapp [Var (Short fname); Con NONE []]))``

val SPLIT_EMPTY = store_thm("SPLIT_EMPTY",
  ``(SPLIT EMPTY (s1,s2) <=> s1 = EMPTY /\ s2 = EMPTY) /\
    (SPLIT s (EMPTY,s2) <=> s2 = s) /\
    (SPLIT s (s1,EMPTY) <=> s1 = s)``,
  fs [SPLIT_def,EXTENSION,IN_DISJOINT] \\ metis_tac []);

val SPIT3_SING_IMP = prove(
  ``SPLIT3 x ({a},b,c) ==> a IN x``,
  fs [SPLIT3_def,EXTENSION,IN_DISJOINT] \\ metis_tac [])

val call_main_thm_bot = Q.store_thm("call_main_thm_bot",
  `!fname fv.
  ML_code env1 (init_state (bot_ffi w)) prog NONE env2 st2 ==>
  lookup_var fname env2 = SOME fv ==>
  app (bot_proj1, bot_proj2) fv [Conv NONE []] (IOBOT w)
    (POSTv uv. &UNIT_TYPE () uv *
               SEP_EXISTS w'. IOBOT w' * &R w w') ==>
  no_dup_mods (SNOC ^main_call prog) (init_state (bot_ffi w)).defined_mods /\
  no_dup_top_types (SNOC ^main_call prog) (init_state (bot_ffi w)).defined_types ==>
  (?h1 h2. SPLIT (st2heap (bot_proj1, bot_proj2) st2) (h1,h2) /\ (IOBOT w) h1)
  ==>
    ∃io_events w'.
    semantics_prog (init_state (bot_ffi w)) env1
      (SNOC ^main_call prog) (Terminate Success io_events) /\
    extract_world w io_events = SOME w' ∧ R w w'`,
  rw[]>>
  drule (GEN_ALL call_main_thm2)>>
  rpt (disch_then drule)>>
  qmatch_goalsub_abbrev_tac`FFI_part_hprop X`>>
  `FFI_part_hprop X` by
    (simp[Abbr`X`]
    \\ ho_match_mp_tac FFI_part_hprop_SEP_EXISTS \\ rw[]
    \\ metis_tac[IOBOT_FFI_part_hprop,FFI_part_hprop_STAR])
  \\ rpt(disch_then drule)
  \\ rw[]
  \\ asm_exists_tac \\ simp[]
  \\ fs[FFI_part_hprop_def,Abbr`X`]
  \\ first_x_assum drule\\ strip_tac
  \\ fs[SEP_EXISTS_THM,SEP_CLAUSES]
  \\ qexists_tac`w'` \\ fs[Once STAR_def,cond_def]
  \\ drule call_FFI_rel_IMP
  \\ EVAL_TAC \\ strip_tac
  \\ rw[]
  \\ fs [IOBOT_def,cond_STAR]
  \\ fs [IOx_def,IO_def,bot_ffi_part_def,SEP_EXISTS_THM]
  \\ qpat_x_assum `one _ _` mp_tac
  \\ once_rewrite_tac [one_def] \\ fs [SPLIT_EMPTY] \\ rveq
  \\ strip_tac \\ rveq
  \\ drule SPIT3_SING_IMP
  \\ rewrite_tac [cfStoreTheory.st2heap_def,IN_UNION]
  \\ fs [cfAppTheory.FFI_part_NOT_IN_store2heap]
  \\ rw [cfStoreTheory.ffi2heap_def]
  \\ pop_assum (qspec_then `"get_const"` mp_tac) \\ fs []
  \\ fs [bot_proj1_def,mk_proj1_def,bot_ffi_part_def,FUPDATE_LIST,
         FAPPLY_FUPDATE_THM,FLOOKUP_UPDATE,botFFITheory.encode_11]);

val parts_ok_bot_ffi = Q.store_thm("parts_ok_bot_ffi",`
  parts_ok (bot_ffi w) (bot_proj1,bot_proj2)`,
  rw[cfStoreTheory.parts_ok_def,bot_ffi_def]>>
  fs[bot_proj2_def,bot_ffi_part_def,mk_proj2_def,mk_proj1_def,bot_proj1_def]
  >-
    (rw[]>>
    qexists_tac`encode w`>>rw[]>>
    simp[flookup_fupdate_list])
  >-
    (rw[]>>fs[mk_ffi_next_def]>>rw[]>>fs[flookup_fupdate_list]>>
    pairarg_tac>>fs[]>>
    rw[]>>
    metis_tac[bot_ffi_LENGTH])
  >>
    rw[]>>fs[mk_ffi_next_def]>>rw[]>>
    fs[FAPPLY_FUPDATE_THM, FUPDATE_LIST_THM]>>
    fs[bot_ffi_oracle_def]>>
    TOP_CASE_TAC>>simp[]>>
    pairarg_tac>>fs[]>>rw[]>>
    fs[fmap_eq_flookup]>>
    rw[FLOOKUP_UPDATE]);

val _ = export_theory();