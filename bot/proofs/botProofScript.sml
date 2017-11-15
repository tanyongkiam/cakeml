open preamble botProgTheory
open ml_progLib ml_translatorLib
open cfMainTheory
open basisFunctionsLib
open cfTacticsLib cfLetAutoLib cfLib
open botFFITheory
open MonitorProofTheory
open set_sepTheory semanticsLib
(* Here, we turn the App theorem for botProg into theorem about
   CakeML's semantics *)

val _ = new_theory "botProof"

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

(* Rebuild the world*)
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
  (* Separation logic stuff? *)
  \\ cheat);

val (ML_code (ss,envs,vs,th)) = get_ml_prog_state ();

val name = "bot_main"
val spec =  bot_main_spec |>
  Q.GEN`p` |> Q.ISPEC`(bot_proj1,bot_proj2)` |>
  Q.GEN`u` |> Q.ISPEC `Conv NONE []` |> UNDISCH

val th =
  call_main_thm_bot
    |> C MATCH_MP (th |> GEN_ALL |> ISPEC ``bot_ffi w``)
    |> SPEC(stringSyntax.fromMLstring name)
    |> CONV_RULE(QUANT_CONV(LAND_CONV(LAND_CONV EVAL THENC SIMP_CONV std_ss [])))
    |> CONV_RULE(HO_REWR_CONV UNWIND_FORALL_THM1)
    |> C HO_MATCH_MP spec;

val prog_with_snoc = th |> concl |> find_term listSyntax.is_snoc
val prog_rewrite = EVAL prog_with_snoc

val th = PURE_REWRITE_RULE[prog_rewrite] th
val (mods_tm,types_tm) = th |> concl |> dest_imp |> #1 |> dest_conj
val mods_thm =
  mods_tm |> (RAND_CONV EVAL THENC no_dup_mods_conv)
  |> EQT_ELIM

val types_thm =
  types_tm |> (RAND_CONV EVAL THENC no_dup_top_types_conv)
  |> EQT_ELIM
val th = MATCH_MP th (CONJ mods_thm types_thm)

val (split,precondh1) = th |> concl |> dest_imp |> #1 |> strip_exists |> #2 |> dest_conj
val precond = rator precondh1
val st = split |> rator |> rand

val SPLIT_exists = Q.store_thm ("SPLIT_exists",
  `∀s. A s /\ s ⊆ C
    ==> (?h1 h2. SPLIT C (h1, h2) /\ A h1)`,
  rw[]
  \\ qexists_tac `s` \\ qexists_tac `C DIFF s`
  \\ SPLIT_TAC
);

val parts_ok_bot_ffi = Q.prove(`
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

val SPLIT_th = Q.prove(`
  wf_world w ⇒
  (∃h1 h2.
      SPLIT (st2heap (bot_proj1,bot_proj2) (auto_state_7 (bot_ffi w)))
        (h1,h2) ∧ IOBOT w h1)`,
  rw[]>>simp[auto_state_7_def,cfStoreTheory.st2heap_def]>>
  match_mp_tac SPLIT_exists>>fs[IOBOT_def,STAR_def,cond_def]>>
  qmatch_goalsub_abbrev_tac` _ ∪ s`>>
  qexists_tac`s`>>simp[Abbr`s`]>>
  fs[cfStoreTheory.ffi2heap_def,IOx_def,bot_ffi_part_def,IO_def]>>
  simp[parts_ok_bot_ffi,SEP_EXISTS_THM,PULL_EXISTS,one_def]>>
  qexists_tac`[]`>>simp[SPLIT_def]>>
  simp[EXTENSION,bot_ffi_def]>>rw[]>>
  simp[mk_ffi_next_def]>>rw[]>>
  (* what to do with FFI_split? *)
  cheat)

val semantics_thm = MATCH_MP th (UNDISCH SPLIT_th) |> DISCH_ALL
val prog_tm = rhs(concl prog_rewrite)

val bot_prog_def = Define`bot_prog = ^prog_tm`;

val bot_semantics_thm =
  semantics_thm
  |> ONCE_REWRITE_RULE[GSYM bot_prog_def]
  |> DISCH_ALL
  |> SIMP_RULE std_ss [AND_IMP_INTRO]
  |> curry save_thm "bot_semantics_thm";

val _ = export_theory();
