open preamble ml_progLib ml_translatorLib
     basisFunctionsLib
     cfTacticsLib cfLetAutoLib
     MonitorProgTheory botFFITheory
     Word8ArrayProofTheory
open cfHeapsBaseTheory blastLib ml_translatorTheory
(*
val _ = new_theory"MonitorProof";

val _ = translation_extends "MonitorProg";
(* We now prove specs for each function in the Monitor module *)

val bot_st = get_ml_prog_state();
val _ = overload_on ("WORD32",``WORD:word32 -> v -> bool``);
*)
(* Helper lemmas *)
val MAP4_empty = Q.prove(`
  LENGTH ls < 4 ⇒
  MAP4 f ls = []`,
  Cases_on`ls`>>fs[MAP4_def]>>
  Cases_on`t`>>fs[MAP4_def]>>
  Cases_on`t'`>>fs[MAP4_def]>>
  Cases_on`t`>>fs[MAP4_def]);

val w8_to_w32_w32_to_w8 = Q.store_thm("w8_to_w32_w32_to_w8",`
  ∀l. w8_to_w32 (w32_to_w8 l) = l`,
  Induct>>EVAL_TAC>>
  pop_assum mp_tac>>EVAL_TAC>>rw[]>>
  blastLib.FULL_BBLAST_TAC);

val w32_to_w8_APPEND = Q.store_thm("w32_to_w8_APPEND",`
  ∀a b. w32_to_w8 (a ++ b) = w32_to_w8 a ++ w32_to_w8 b`,
  EVAL_TAC>>
  Induct_on`a`>>fs[FLAT_TUP_def,w32_to_le_bytes_def]);

val pack_w32_list_spec = Q.store_thm("pack_w32_list_spec",`
    ∀l lv.
    LIST_TYPE WORD32 l lv
    ==>
    app (p:'ffi ffi_proj) ^(fetch_v "Monitor.pack_w32_list" bot_st) [lv]
      emp (POSTv av.
      W8ARRAY av (w32_to_w8 l))`,
  xcf "Monitor.pack_w32_list" bot_st>>
  xfun_spec `f`
   `∀ls lsv i iv l_pre rest ar.
     NUM i iv /\
     LENGTH l_pre = i ∧
     LENGTH rest = 4 * LENGTH ls ∧
     LIST_TYPE WORD32 ls lsv
     ==>
     app p f [ar; lsv; iv]
      (W8ARRAY ar (l_pre ++ rest))
      (POSTv ar.
      W8ARRAY ar (l_pre ++ (FLAT_TUP (MAP w32_to_le_bytes ls))))`
  >-
    (Induct
    >- (
      rw[LIST_TYPE_def] \\
      first_x_assum match_mp_tac \\
      xmatch \\
      xret \\
      xsimpl \\ simp[FLAT_TUP_def])
    >>
      rw[LIST_TYPE_def] \\
      fs[terminationTheory.v_to_list_def] \\
      last_x_assum match_mp_tac \\
      xmatch \\
      xlet_auto >- xsimpl >>
      fs[w32_to_le_bytes_def]>>
      fs[PAIR_TYPE_def]>>
      ntac 3 xmatch \\
      rpt( xlet_auto >- xsimpl )>>
      xapp >> xsimpl>>
      simp[FLAT_TUP_def]>>
      fs[LUPDATE_APPEND2]>>
      `LENGTH rest = 4 + (4 * LENGTH ls)` by fs[ADD1]>>
      fs[quantHeuristicsTheory.LIST_LENGTH_4]>>
      simp[LUPDATE_compute])
  >>
    rpt(xlet_auto>- xsimpl)>>
    xlet_auto>>
    xapp >> xsimpl>>
    metis_tac[w32_to_w8_def]);

val unpack_w32_list_spec = Q.store_thm("unpack_w32_list_spec",`
    ∀l lv.
    app (p:'ffi ffi_proj) ^(fetch_v "Monitor.unpack_w32_list" bot_st) [av]
      (W8ARRAY av a)
      (POSTv lv.
      W8ARRAY av a *
      &LIST_TYPE WORD32 (w8_to_w32 a) lv)`,
  xcf "Monitor.unpack_w32_list" bot_st>>
  xfun_spec `f`
   `∀i iv l lv a av.
     NUM i iv /\
     NUM l lv /\
     l = LENGTH a
     ==>
     app p f [av; iv; lv]
      (W8ARRAY av a)
      (POSTv lv.
      W8ARRAY av a *
      &LIST_TYPE WORD32 (w8_to_w32 (DROP i a)) lv)`
  >- (
    ntac 3 strip_tac>>
    qid_spec_tac`iv`>>
    completeInduct_on`l-i`>>
    rw[]>> first_x_assum match_mp_tac>>
    xlet_auto >- xsimpl>>
    xlet_auto >- xsimpl>>
    reverse xif
    >-
      (xcon>>xsimpl>>simp[w8_to_w32_def,MAP4_empty,LIST_TYPE_def])
    >>
    xlet_auto>- xsimpl>>
    first_x_assum(qspec_then `LENGTH a - (i+4)` mp_tac)>>
    simp[]>>
    disch_then(qspecl_then [`LENGTH a`,`i+4`] mp_tac)>>simp[]>>
    rpt (disch_then drule)>>
    disch_then(qspecl_then[`a`,`av'`] assume_tac)>>fs[]>>
    (* xlet_auto fails... *)
    xlet `POSTv lv. W8ARRAY av' a * &LIST_TYPE WORD32 (w8_to_w32 (DROP (i + 4) a)) lv`
    >- (xapp>>xsimpl)>>
    rpt(xlet_auto >- xsimpl)>>
    xcon>>xsimpl>>
    fs[DROP_EL_CONS,MAP4_def,LIST_TYPE_def,w8_to_w32_def])
  >>
    xlet_auto >- xsimpl>>
    xapp>> xsimpl);

(* We can now specify each of the basis functions *)

(* Well-formed worlds obey their config's lengths *)
val wf_world_def = Define`
  wf_world w ⇔
  let constlen = LENGTH w.wc.const_names in
  let sensorlen = LENGTH w.wc.sensor_names in
  let ctrllen = LENGTH w.wc.ctrl_names in
  LENGTH w.ws.const_vals = constlen ∧
  LENGTH w.ws.sensor_vals = sensorlen ∧
  (∀n inp.
    (*LENGTH inp = clen + slen ⇒ -- we could restrict it more... *)
    LENGTH (w.wo.ctrl_oracle n inp) = ctrllen) ∧
  (∀n inp.
    (* See above on the length restriction *)
    LENGTH (w.wo.transition_oracle n inp) = sensorlen)`

val IOBOT_def = Define `
  IOBOT w = IOx bot_ffi_part w * &wf_world w`

val get_const_spec = Q.store_thm("get_const_spec",`
  ∀w vs.
  LIST_TYPE STRING_TYPE w.wc.const_names vs
  ⇒
  app (p:'ffi ffi_proj) ^(fetch_v "Monitor.get_const" bot_st) [vs]
    (IOBOT w)
    (POSTv lv.
    IOBOT w *
    &LIST_TYPE WORD32 w.ws.const_vals lv)`,
  rw[IOBOT_def]>>
  xpull>>
  xcf "Monitor.get_const" bot_st>>
  rpt(xlet_auto>- xsimpl)>>
  xlet `POSTv u.
         IOx bot_ffi_part w *
         W8ARRAY v' (w32_to_w8 w.ws.const_vals)`
  >-
    (xffi>>xsimpl>>
    simp[IOx_def,bot_ffi_part_def,mk_ffi_next_def]>>
    xsimpl >>
    qmatch_goalsub_abbrev_tac`IO s u ns` >>
    map_every qexists_tac [`&wf_world w`, `s`, `s`, `u`, `ns`] >>
    unabbrev_all_tac>>
    xsimpl >>
    fs[mk_ffi_next_def,ffi_get_const_def,wf_world_def])
  >>
  xapp>>xsimpl>>
  simp[w8_to_w32_w32_to_w8]);

val get_sensor_spec = Q.store_thm("get_sensor_spec",`
  ∀w vs.
  LIST_TYPE STRING_TYPE w.wc.sensor_names vs
  ⇒
  app (p:'ffi ffi_proj) ^(fetch_v "Monitor.get_sensor" bot_st) [vs]
    (IOBOT w)
    (POSTv lv.
    IOBOT w *
    &LIST_TYPE WORD32 w.ws.sensor_vals lv)`,
  rw[IOBOT_def]>>
  xpull>>
  xcf "Monitor.get_sensor" bot_st>>
  rpt(xlet_auto>- xsimpl)>>
  xlet `POSTv u.
         IOx bot_ffi_part w *
         W8ARRAY v' (w32_to_w8 w.ws.sensor_vals)`
  >-
    (xffi>>xsimpl>>
    simp[IOx_def,bot_ffi_part_def,mk_ffi_next_def]>>
    xsimpl >>
    qmatch_goalsub_abbrev_tac`IO s u ns` >>
    map_every qexists_tac [`&wf_world w`, `s`, `s`, `u`, `ns`] >>
    unabbrev_all_tac>>
    xsimpl >>
    fs[mk_ffi_next_def,ffi_get_sensor_def,wf_world_def])
  >>
  xapp>>xsimpl>>
  simp[w8_to_w32_w32_to_w8]);

val to_string_spec = Q.store_thm("to_string_spec",`
  app (p:'ffi ffi_proj) ^(fetch_v "Monitor.to_string" bot_st) [ar]
    (W8ARRAY ar av)
    (POSTv v.
    &(STRING_TYPE (strlit (MAP (CHR o w2n) av)) v) * W8ARRAY ar av)`,
  xcf "Monitor.to_string" bot_st>>
  xlet_auto >- xsimpl>>
  xapp>>
  xsimpl>>
  qexists_tac`LENGTH av`>>
  simp[]);

val get_ctrl_spec = Q.store_thm("get_ctrl_spec",`
  ∀w vs constv sensorv.
  LIST_TYPE STRING_TYPE w.wc.ctrl_names vs ∧
  LIST_TYPE WORD32 w.ws.const_vals constv ∧
  LIST_TYPE WORD32 w.ws.sensor_vals sensorv
  ⇒
  app (p:'ffi ffi_proj) ^(fetch_v "Monitor.get_ctrl" bot_st) [vs;constv;sensorv]
    (IOBOT w)
    (POSTv lv.
    IOBOT (w with
      wo := w.wo with ctrl_oracle := (λn. w.wo.ctrl_oracle (n + 1)))*
    SEP_EXISTS vv.
    & (LENGTH vv = LENGTH w.wc.ctrl_names ∧
      LIST_TYPE WORD32 vv lv))`,
  rw[IOBOT_def]>>
  xpull>>
  xcf "Monitor.get_ctrl" bot_st>>
  rpt(xlet_auto>- ((TRY xcon)>>xsimpl))>>
  qmatch_asmsub_abbrev_tac`STRING_TYPE confstr sv`>>
  xlet`
  (POSTv u.
   IOx bot_ffi_part (w with
      wo := w.wo with ctrl_oracle := (λn. w.wo.ctrl_oracle (n + 1))) *
   W8ARRAY av (w32_to_w8 (w.ws.const_vals ⧺ w.ws.sensor_vals)) *
   SEP_EXISTS vv.
    &(LENGTH vv = LENGTH w.wc.ctrl_names) *
    W8ARRAY v'' (w32_to_w8 vv))`
  >-
    (
    xffi>>xsimpl>>
    simp[IOx_def,bot_ffi_part_def,mk_ffi_next_def]>>
    qmatch_goalsub_abbrev_tac`IO s u ns` >>
    qabbrev_tac`ls = w32_to_w8 w.ws.const_vals ++ w32_to_w8 w.ws.sensor_vals`>>
    qexists_tac`ls` >>
    qexists_tac`W8ARRAY av (w32_to_w8 (w.ws.const_vals ⧺ w.ws.sensor_vals))`>> xsimpl>>
    qmatch_goalsub_abbrev_tac`IO (encode s') u ns` >>
    map_every qexists_tac[`s`,`encode s'`,`u`,`ns`]>>
    xsimpl>>
    unabbrev_all_tac>>
    simp[mk_ffi_next_def,ffi_get_control_def,get_oracle_def]>>
    qmatch_goalsub_abbrev_tac`w32_to_w8 ls = w32_to_w8 _`>>
    qexists_tac`ls`>>simp[]>>
    unabbrev_all_tac>>
    fs[mlstringTheory.concat_def,ml_translatorTheory.STRING_TYPE_def,
      LENGTH_w32_to_w8,wf_world_def,w32_to_w8_APPEND])
  >>
    xapp>>xsimpl>>
    rw[]>>
    fs[w8_to_w32_w32_to_w8,wf_world_def]>>
    metis_tac[]);

val string_ID = Q.store_thm("string_ID",`
  ∀s. MAP (CHR ∘ (w2n:word8->num)) (MAP (n2w ∘ ORD) s) = s`,
  fs[LIST_EQ_REWRITE,EL_MAP]>>rw[]>>
  `ORD (EL x s) MOD 256 = ORD (EL x s)` by
    fs[MOD_LESS,ORD_BOUND]>>
  metis_tac[CHR_ORD]);

(* The control choice is good w.r.t. to a world state *)
val ctrl_sat_def = Define`
  ctrl_sat wc ws ctrl ⇔
  wfsem wc.ctrl_monitor
    (vars_to_state
    (wc.const_names ++ wc.sensor_names ++ wc.ctrl_names)
    (ws.const_vals  ++ ws.sensor_vals  ++ ctrl)) = SOME T`

val actuate_spec = Q.store_thm("actuate_spec",`
  LIST_TYPE WORD32 ctrl_vals ctrlv ∧
  STRING_TYPE strng strngv ∧
  LENGTH ctrl_vals = LENGTH w.wc.ctrl_names ∧
  (*ctrl_sat w.wc w.ws ctrl_vals ∧*)
  w.wo.step_oracle 0
  (*∧
  ¬w.wo.step_oracle n ∧
  good_ctrl_trace w.wc w.tr*)
  ⇒
  app (p:'ffi ffi_proj) ^(fetch_v "Monitor.actuate" bot_st) [strngv;ctrlv]
   (IOBOT w )
   (* We could be more precise and also talk about the oracles
      but this characterization is all we need here *)
   (POSTv u. (SEP_EXISTS av. W8ARRAY av (w32_to_w8 ctrl_vals)) *
   SEP_EXISTS w'. IOBOT w'  *
   &(
    (*good_ctrl_trace w'.wc w'.tr ∧*)
    w'.tr = SNOC (w.ws,ctrl_vals) w.tr ∧
    w.wc = w'.wc ∧
    w.ws.const_vals = w'.ws.const_vals ∧
    w'.wo.step_oracle = λn. w.wo.step_oracle (n+1)))`,
  rw[]>>
  xcf"Monitor.actuate" bot_st>>
  xlet_auto >- xsimpl>>
  simp[IOBOT_def]>>xpull>>
  xffi >> xsimpl>>
  simp[IOx_def,bot_ffi_part_def,mk_ffi_next_def]>>
  qmatch_goalsub_abbrev_tac`IO s u ns` >>
  qexists_tac `MAP (n2w o ORD) (explode strng)`>>
  Cases_on`strng`>>fs[ml_translatorTheory.STRING_TYPE_def,string_ID]>>
  CONV_TAC (RESORT_EXISTS_CONV (sort_vars ["u'","ns'"]))>>
  map_every qexists_tac [`u`,`ns`]>>
  simp[Abbr`u`,Abbr`ns`,mk_ffi_next_def,ffi_actuate_def,LENGTH_w32_to_w8]>>
  xsimpl>>
  simp[LAMBDA_PROD,EXISTS_PROD,get_oracle_def,Abbr`s`]>>
  qmatch_goalsub_abbrev_tac`encode ww`>>
  qexists_tac`av`>>xsimpl>>
  qexists_tac`ww`>>xsimpl>>
  fs[Abbr`ww`,wf_world_def,w8_to_w32_w32_to_w8]>>
  rw[]);
(* >-
    (match_mp_tac good_ctrl_trace_SNOC>>simp[])>>
  Cases_on`n`>>fs[ADD1]);*)

(*
  At this point, we have enough to specify our 1-shot controller.
*)
val good_default_1shot_def = Define`
  good_default_1shot default w ⇔
  (* Any valuation satisfying the const and sensor lengths *)
  let def_ctrl = default w.ws.const_vals w.ws.sensor_vals in
  LENGTH def_ctrl = LENGTH w.wc.ctrl_names ∧
  ctrl_sat w.wc w.ws def_ctrl`

val good_default_1shot_IMP = Q.prove(`
  ∀ls w.
  good_default_1shot def w ∧
  LENGTH ls = LENGTH w.wc.ctrl_names ==>
  let r = SND (ctrl_monitor w.wc.ctrl_monitor
               w.wc.const_names w.wc.sensor_names w.wc.ctrl_names
               w.ws.const_vals w.ws.sensor_vals ls
               def) in
  ctrl_sat w.wc w.ws r ∧
  LENGTH r = LENGTH w.wc.ctrl_names`,
  rw[ctrl_monitor_def,ctrl_sat_def,wfsem_bi_val_def,good_default_1shot_def]>>
  EVERY_CASE_TAC>>fs[]);

val comp_eq = [world_component_equality,
               world_config_component_equality,
               world_state_component_equality,
               world_oracle_component_equality];

val ctrl_monitor_1shot_spec = Q.store_thm("ctrl_monitor_1shot_spec",`
  ∀w const_valsv sensor_valsv.
    (* These specify what the inputs should be *)
    MONITORPROG_FML_TYPE w.wc.ctrl_monitor fv ∧
    LIST_TYPE STRING_TYPE w.wc.const_names const_namesv ∧
    LIST_TYPE STRING_TYPE w.wc.sensor_names sensor_namesv ∧
    LIST_TYPE STRING_TYPE w.wc.ctrl_names ctrl_namesv ∧
    (LIST_TYPE WORD32 -->
    LIST_TYPE WORD32 -->
    LIST_TYPE WORD32) def defv ∧
    good_default_1shot def w ∧
    w.wo.step_oracle 0
    ⇒
    app (p:'ffi ffi_proj) ^(fetch_v "Monitor.ctrl_monitor_1shot" bot_st)
      [fv;const_namesv;sensor_namesv;ctrl_namesv;defv]
    (IOBOT w)
    (POSTv u.
      SEP_EXISTS w' ctrl_vals.
      (* We can be more specific here, but the key property is that
         we enter a new state which extends the old by a single actuation step
         Moreover, that step is guraanteed to be ctrl_sat *)
      IOBOT w' *
      &(
        w'.tr = SNOC (w.ws,ctrl_vals) w.tr ∧
        ctrl_sat w.wc w.ws ctrl_vals))`,
  rw[]>>
  xcf "Monitor.ctrl_monitor_1shot" bot_st>>
  drule get_const_spec >> strip_tac>>
  xlet_auto>- xsimpl>>
  drule get_sensor_spec >> strip_tac>>
  xlet_auto>- xsimpl>>
  drule get_ctrl_spec >> rpt(disch_then drule)>> strip_tac>>
  xlet_auto>- (xsimpl>>metis_tac[])>>
  xlet_auto>- xsimpl>>
  qmatch_goalsub_abbrev_tac`IOBOT w'`>>
  fs[]>>
  drule good_default_1shot_IMP>>
  disch_then (qspec_then`vv` assume_tac)>>
  rfs[]>>
  qmatch_asmsub_abbrev_tac`PAIR_TYPE _ _ fls _`>>
  Cases_on`fls`>> fs[ml_translatorTheory.PAIR_TYPE_def]>>
  xmatch>>
  drule (GEN_ALL actuate_spec)>>
  disch_then drule>>
  disch_then(qspecl_then[`w'`,`p`] mp_tac)>>
  impl_tac>-
    fs[Abbr`w'`]>>
  strip_tac>>
  xapp>>xsimpl>>
  rw[]>>
  qexists_tac`x'`>>simp[Abbr`w'`]>>
  xsimpl);

(* Now we specify the looping control monitor *)

(* The init state is good *)
val init_sat_def = Define`
  init_sat wc ws ⇔
  wfsem wc.init
      (vars_to_state
      (wc.const_names ++ wc.sensor_names)
      (ws.const_vals ++ ws.sensor_vals)) = SOME T`

(* First, we need assumptions about the world state *)
val const_ok_def = Define`
  const_ok w ⇔
  ∃svals.
    init_sat w.wc (w.ws with sensor_vals := svals)`

val good_default_def = Define`
  good_default default w ⇔
  (* If we know that the init monitor is satisfied for some state,
     Then the default must produce good states throughout
     This is awkward... it really just needs to know that the consts are ok...
   *)
  const_ok w ⇒
  ∀svals.
  LENGTH svals = LENGTH w.wc.sensor_names ⇒
  let def_ctrl = default w.ws.const_vals svals in
  LENGTH def_ctrl = LENGTH w.wc.ctrl_names ∧
  ctrl_sat w.wc (w.ws with sensor_vals := svals) def_ctrl`

val good_ctrl_trace_def = Define`
  (good_ctrl_trace wc [] <=> T) ∧
  (good_ctrl_trace wc ((ws,ctrl)::xs) <=>
    ctrl_sat wc ws ctrl)`

val good_ctrl_trace_SNOC = Q.store_thm("good_ctrl_trace_SNOC",`
  ∀tr.
  good_ctrl_trace wc tr ∧
  ctrl_sat wc ws vals
  ⇒
  good_ctrl_trace wc ( tr++[(ws,vals)])`,
  Induct>>fs[good_ctrl_trace_def]>>rw[]>>Cases_on`h`>>fs[good_ctrl_trace_def]);

(* The controller monitor's good world propositions *)
val good_world_def = Define`
  good_world def w ⇔
  good_default def w ∧
  good_ctrl_trace w.wc w.tr ∧
  const_ok w`

val good_default_IMP = Q.store_thm("good_defualt_IMP",`
  ∀ls.
  good_world def w ∧
  wf_world w ∧
  LENGTH ls = LENGTH w.wc.ctrl_names ==>
  let r = SND (ctrl_monitor w.wc.ctrl_monitor
               w.wc.const_names w.wc.sensor_names w.wc.ctrl_names
               w.ws.const_vals w.ws.sensor_vals ls
               def) in
  ctrl_sat w.wc w.ws r ∧
  LENGTH r = LENGTH w.wc.ctrl_names`,
  fs[good_world_def]>>rpt strip_tac>>fs[good_default_def]>>
  first_x_assum(qspec_then `w.ws.sensor_vals` assume_tac)>>
  rfs[ctrl_sat_def,wfsem_bi_val_def,ctrl_monitor_def,wf_world_def]>>
  fs[]>>
  EVERY_CASE_TAC>>fs[]);

val has_next_spec = Q.store_thm("has_next_spec",`
    UNIT_TYPE u uv
    ⇒
    app (p:'ffi ffi_proj) ^(fetch_v "Monitor.has_next" bot_st) [uv]
      (IOBOT w)
      (POSTv bv.
      IOBOT w *
      &BOOL (w.wo.step_oracle 0) bv)`,
  rw[]>>
  xcf "Monitor.has_next" bot_st>>
  fs[ml_translatorTheory.UNIT_TYPE_def]>>
  xmatch>>
  rpt(xlet_auto >- xsimpl)>>
  xlet `POSTv u.
         IOBOT w *
         W8ARRAY v' (if w.wo.step_oracle 0 then [1w:word8] else [0w])`
  >-
    (simp[IOBOT_def]>>xpull>>
    xffi>>xsimpl>>
    simp[IOx_def,bot_ffi_part_def,mk_ffi_next_def]>>
    xsimpl >>
    qmatch_goalsub_abbrev_tac`IO s u ns` >>
    map_every qexists_tac [`emp`, `s`, `s`, `u`, `ns`] >>
    unabbrev_all_tac>>
    xsimpl >>
    simp[mk_ffi_next_def,ffi_has_next_def]>>
    rw[])
  >>
  rpt(xlet_auto>- xsimpl)>>
  xlet_auto>-
    (xsimpl>>qexists_tac`w`>>rw[])>>
  xapp_spec (mlbasicsProgTheory.neq_v_thm |> INST_TYPE [alpha |-> ``:word8``])>>
  xsimpl>>
  qexists_tac`0w`>>
  qmatch_asmsub_abbrev_tac`WORD8 b v'''`>>
  qexists_tac`b`>>
  qexists_tac`WORD8`>>simp[Abbr`b`]>>rw[]>>
  simp[ml_translatorTheory.EqualityType_NUM_BOOL]);

(* eventually on oracle sequences *)
val eventually_def = Define`
  eventually P oracle ⇔
  ∃n.
    P(oracle n)`

val ctrl_monitor_loop_body_spec = Q.store_thm("ctrl_monitor_loop_body_spec",`
  ∀w const_valsv sensor_valsv.
    (* These specify what the inputs should be *)
    MONITORPROG_FML_TYPE w.wc.ctrl_monitor fv ∧
    LIST_TYPE STRING_TYPE w.wc.const_names const_namesv ∧
    LIST_TYPE STRING_TYPE w.wc.sensor_names sensor_namesv ∧
    LIST_TYPE STRING_TYPE w.wc.ctrl_names ctrl_namesv ∧
    (LIST_TYPE WORD32 -->
    LIST_TYPE WORD32 -->
    LIST_TYPE WORD32) def defv ∧
    LIST_TYPE WORD32 w.ws.const_vals const_valsv ∧
    LIST_TYPE WORD32 w.ws.sensor_vals sensor_valsv ∧
    eventually ($~) w.wo.step_oracle
    ⇒
    app (p:'ffi ffi_proj) ^(fetch_v "Monitor.ctrl_monitor_loop_body" bot_st)
      [fv;const_namesv;sensor_namesv;ctrl_namesv;defv;const_valsv;sensor_valsv]
    (IOBOT w * &good_world def w )
    (POSTv u. SEP_EXISTS w'. IOBOT w' *
      &(good_world def w' ∧
        (* We can state stronger properties here, but they aren't that important *)
        ¬w'.wo.step_oracle 0 ∧
        w.wc = w'.wc))`,
  fs[eventually_def,PULL_EXISTS]>>
  completeInduct_on`n`>>rw[]>>
  xcf"Monitor.ctrl_monitor_loop_body" bot_st>>
  xpull>>
  rpt(xlet_auto>- ((TRY xcon)>>xsimpl))>>
  drule has_next_spec>> strip_tac>>
  xlet_auto>> simp[]>>
  reverse xif
  >-
    (xcon>>xsimpl>>
    qexists_tac`w`>>simp[]>>
    xsimpl)
  >>
  reverse (Cases_on`wf_world w`) >- (simp[IOBOT_def]>>xpull)>>
  drule get_ctrl_spec >>
  rpt(disch_then drule)>>
  strip_tac>>
  xlet_auto>- (xsimpl>>metis_tac[])>>
  xlet_auto >- xsimpl>>
  qmatch_asmsub_abbrev_tac`PAIR_TYPE _ _ fls _`>>
  Cases_on`fls`>>   fs[ml_translatorTheory.PAIR_TYPE_def,markerTheory.Abbrev_def]>>
  xmatch>>
  drule good_default_IMP>>
  simp[]>>
  disch_then(qspec_then`vv` mp_tac)>>
  impl_tac>- fs[]>>
  strip_tac>>
  qpat_x_assum`(q,r) = _` (assume_tac o SYM)>>fs[]>>
  drule (GEN_ALL actuate_spec)>>simp[]>>
  rpt(disch_then drule)>>
  qmatch_goalsub_abbrev_tac`IOBOT w'`>>
  disch_then(qspecl_then[`w'`,`p`] mp_tac)>>
  impl_tac>-
    (fs[Abbr`w'`,good_world_def])>>
  strip_tac>>
  xlet_auto
  >-
    (xsimpl>>rw[]>>qexists_tac`x'`>>qexists_tac`x`>>xsimpl)>>
  fs comp_eq>>rw[]>>
  drule get_sensor_spec>>
  strip_tac>>
  rpt(xlet_auto>- ((TRY xcon)>>xsimpl))>>
  last_x_assum(qspec_then`n-1` mp_tac)>>simp[]>>
  impl_tac>-
    (Cases_on`n`>>fs[])>>
  disch_then drule >> simp[]>>
  disch_then drule>>
  disch_then drule>>
  Cases_on`n`>>rfs[ADD1]>>
  strip_tac>>
  xapp>> xsimpl>>
  fs[good_world_def,good_default_def,const_ok_def]>>
  `∀sv. w''.ws with sensor_vals := sv =
     w.ws with sensor_vals := sv` by fs comp_eq>>
  rw[]>>TRY(metis_tac comp_eq)>>
  match_mp_tac good_ctrl_trace_SNOC>>
  metis_tac comp_eq);

val violation_spec = Q.store_thm("violation_spec",`
  STRING_TYPE strng strngv
  ⇒
  app (p:'ffi ffi_proj) ^(fetch_v "Monitor.violation" bot_st) [strngv]
    (IOBOT w)
    (POSTv u. IOBOT w)`,
  rw[]>>
  xcf"Monitor.violation"bot_st>>
  rpt(xlet_auto >- xsimpl)>>
  xlet`POSTv u. IOBOT w * SEP_EXISTS v'. W8ARRAY v' []`
  >-
    (simp[IOBOT_def]>>xpull>>
    xffi>>xsimpl>>
    simp[IOx_def,bot_ffi_part_def,mk_ffi_next_def]>>
    qmatch_goalsub_abbrev_tac`IO s u ns` >>
    qexists_tac `MAP (n2w o ORD) (explode strng)`>>
    map_every qexists_tac [`emp`,`[]`,`s`, `s`, `u`, `ns`] >>
    unabbrev_all_tac>>
    xsimpl >>
    simp[mk_ffi_next_def,ffi_violation_def]>>
    qexists_tac`v'`>>
    xsimpl>>
    simp[string_ID]>>
    Cases_on`strng`>>fs[ml_translatorTheory.STRING_TYPE_def])
  >>
  xcon>>xsimpl);

(* Finally, we can specify the full control monitor loop *)
val ctrl_monitor_loop_spec = Q.store_thm("ctrl_monitor_loop_spec",`
  (* These specify what the inputs should be *)
  MONITORPROG_FML_TYPE w.wc.init iv ∧
  MONITORPROG_FML_TYPE w.wc.ctrl_monitor fv ∧
  LIST_TYPE STRING_TYPE w.wc.const_names const_namesv ∧
  LIST_TYPE STRING_TYPE w.wc.sensor_names sensor_namesv ∧
  LIST_TYPE STRING_TYPE w.wc.ctrl_names ctrl_namesv ∧
  (LIST_TYPE WORD32 -->
  LIST_TYPE WORD32 -->
  LIST_TYPE WORD32) def defv ∧
  eventually ($~) w.wo.step_oracle ∧
  good_default def w ∧
  good_ctrl_trace w.wc w.tr
  ⇒
  app (p:'ffi ffi_proj) ^(fetch_v "Monitor.ctrl_monitor_loop" bot_st)
    [iv;fv;const_namesv;sensor_namesv;ctrl_namesv;defv]
  (IOBOT w)
  (POSTv u. SEP_EXISTS w'. IOBOT w' *
    &(
      (* Either the initial world violates init immediately *)
      (w = w' ∧ ¬init_sat w.wc w.ws) ∨
      (* Or we transition to a final world,
         and good_world guarantees that the actuation trace all
         satisfy the control monitor *)
      good_world def w' ∧
      ¬w'.wo.step_oracle 0))`,
  rw[]>>
  xcf"Monitor.ctrl_monitor_loop" bot_st>>
  drule get_const_spec>> strip_tac>>
  xlet_auto >- xsimpl>>
  drule get_sensor_spec>> strip_tac>>
  xlet_auto >- xsimpl>>
  rpt (xlet_auto >- xsimpl)>>
  xif
  >-
    (xapp>>xsimpl>>
    asm_exists_tac>>simp[]>>
    asm_exists_tac>>simp[]>>
    xsimpl>>fs[good_world_def]>>rw[]
    >-
      (fs[const_ok_def,init_sat_def,wfsem_bi_val_def]>>
      EVERY_CASE_TAC>>fs[]>>
      metis_tac[])>>
    qexists_tac`x`>>simp[]>>xsimpl)
  >>
  reverse (Cases_on`wf_world w`)
  >-
    (simp[IOBOT_def]>>xpull)>>
  rpt (xlet_auto >- (TRY(xcon)>>xsimpl))>>
  xapp >> xsimpl>>
  qexists_tac`emp`>>qexists_tac`w`>>xsimpl>>
  qexists_tac`w`>>fs[init_sat_def]>>
  fs[wfsem_bi_val_def]>>
  xsimpl>>every_case_tac>>fs[]);

(* Finally, we add the plant monitor to get the full sandboxing monitor program *)
(*
  We now need an additional check that the plant states along
   the trace makes sense
*)
val plant_sat_def = Define`
  plant_sat wc (wspre,ctrlpre) ws ⇔
  wfsem wc.plant_monitor
    (vars_to_state
    (wc.const_names ++ wc.sensor_pre_names ++ wc.sensor_names ++ wc.ctrl_names)
    (ws.const_vals  ++ wspre.sensor_vals ++ ws.sensor_vals  ++ ctrlpre)) = SOME T`

(* The trace of plant steps up to the current one
   check_last says what happens in the final state
*)
val good_plant_trace_def = Define`
  (good_plant_trace check_last wc (pre :: (ws,_) ::xs) cur_ws ⇔
    plant_sat wc pre ws ∧
    good_plant_trace check_last wc xs cur_ws) ∧
  (good_plant_trace check_last wc [pre] cur_ws ⇔
   ( plant_sat wc pre cur_ws = check_last)) ∧
  (good_plant_trace check_last wc [] cur_ws ⇔ T)`

val good_plant_trace_SNOC = Q.store_thm("good_plant_trace_SNOC",`
  ∀b wc tr ws.
  good_plant_trace T wc tr ws ∧
  b = (plant_sat wc (ws,ctrl) new_ws)
  ==>
  good_plant_trace b wc (tr ++ [(ws,ctrl)]) new_ws`,
  ho_match_mp_tac (fetch "-" "good_plant_trace_ind")>>
  rw[good_plant_trace_def]);

val monitor_loop_body_spec = Q.store_thm("monitor_loop_body_spec",`
  ∀w const_valsv sensor_valsv.
    (* These specify what the inputs should be *)
    MONITORPROG_FML_TYPE w.wc.plant_monitor plantfv ∧
    MONITORPROG_FML_TYPE w.wc.ctrl_monitor ctrlfv ∧
    LIST_TYPE STRING_TYPE w.wc.const_names const_namesv ∧
    LIST_TYPE STRING_TYPE w.wc.sensor_pre_names sensor_pre_namesv ∧
    LIST_TYPE STRING_TYPE w.wc.sensor_names sensor_namesv ∧
    LIST_TYPE STRING_TYPE w.wc.ctrl_names ctrl_namesv ∧
    (LIST_TYPE WORD32 -->
    LIST_TYPE WORD32 -->
    LIST_TYPE WORD32) def defv ∧
    LIST_TYPE WORD32 w.ws.const_vals const_valsv ∧
    LIST_TYPE WORD32 w.ws.sensor_vals sensor_valsv ∧
    eventually ($~) w.wo.step_oracle
    ⇒
    app (p:'ffi ffi_proj) ^(fetch_v "Monitor.monitor_loop_body" bot_st)
      [plantfv;ctrlfv;
      const_namesv;sensor_pre_namesv;sensor_namesv;ctrl_namesv;defv;
      const_valsv;sensor_valsv]
    (IOBOT w * &(good_world def w ∧ good_plant_trace T w.wc w.tr w.ws) )
    (POSTv u. SEP_EXISTS w'. IOBOT w' *
      &(good_world def w' ∧
        (* Either we step to the end, or we reach the first plant violation *)
         (¬w'.wo.step_oracle 0 ∨
         good_plant_trace F w'.wc w'.tr w'.ws) ∧
        w.wc = w'.wc))`,
  fs[eventually_def,PULL_EXISTS]>>
  completeInduct_on`n`>>rw[]>>
  xcf"Monitor.monitor_loop_body" bot_st>>
  xpull>>
  rpt(xlet_auto>- ((TRY xcon)>>xsimpl))>>
  drule has_next_spec>> strip_tac>>
  xlet_auto>> simp[]>>
  reverse xif
  >-
    (xcon>>xsimpl>>
    qexists_tac`w`>>simp[]>>
    xsimpl)
  >>
  reverse (Cases_on`wf_world w`) >- (simp[IOBOT_def]>>xpull)>>
  drule get_ctrl_spec >>
  rpt(disch_then drule)>>
  strip_tac>>
  xlet_auto>- (xsimpl>>metis_tac[])>>
  xlet_auto >- xsimpl>>
  qmatch_asmsub_abbrev_tac`PAIR_TYPE _ _ fls _`>>
  Cases_on`fls`>>   fs[ml_translatorTheory.PAIR_TYPE_def,markerTheory.Abbrev_def]>>
  xmatch>>
  drule good_default_IMP>>
  simp[]>>
  disch_then(qspec_then`vv` mp_tac)>>
  impl_tac>- fs[]>>
  strip_tac>>
  qpat_x_assum`(q,r) = _` (assume_tac o SYM)>>fs[]>>
  drule (GEN_ALL actuate_spec)>>simp[]>>
  rpt(disch_then drule)>>
  qmatch_goalsub_abbrev_tac`IOBOT w'`>>
  disch_then(qspecl_then[`w'`,`p`] mp_tac)>>
  impl_tac>-
    (fs[Abbr`w'`,good_world_def])>>
  strip_tac>>
  xlet_auto
  >-
    (xsimpl>>rw[]>>qexists_tac`x'`>>qexists_tac`x`>>xsimpl)>>
  fs comp_eq>>rw[]>>
  drule get_sensor_spec>>
  strip_tac>>
  xlet_auto>- xsimpl>>
  rpt(xlet_auto>- ((TRY xcon)>>xsimpl))>>
  reverse xif
  >-
    (xapp>>xsimpl>>
    qexists_tac`GC`>>qexists_tac`w''`>>xsimpl>>
    qexists_tac`w''`>>xsimpl>>
    fs[good_world_def,good_default_def,const_ok_def]>>
    `∀sv. w''.ws with sensor_vals := sv =
       w.ws with sensor_vals := sv` by fs comp_eq>>
    rw[]>> TRY(metis_tac comp_eq)
    >-
      (match_mp_tac good_ctrl_trace_SNOC>>fs[]>>
      metis_tac comp_eq)>>
    DISJ2_TAC>>
    match_mp_tac (good_plant_trace_SNOC)>>
    fs[plant_sat_def,plant_monitor_def,wfsem_bi_val_def]>>
    EVERY_CASE_TAC>>fs[]>>
    metis_tac comp_eq)>>
  last_x_assum(qspec_then`n-1` mp_tac)>>simp[]>>
  impl_tac>-
    (Cases_on`n`>>fs[])>>
  disch_then drule >> simp[]>>
  disch_then drule>>
  disch_then drule>>
  strip_tac>>
  xlet_auto>- (xcon>>xsimpl)>>
  xlet_auto>- xsimpl>>
  xapp>>
  xsimpl>>
  fs[good_world_def,good_default_def,const_ok_def]>>
  `∀sv. w''.ws with sensor_vals := sv =
     w.ws with sensor_vals := sv` by fs comp_eq>>
  rw[]>>TRY(metis_tac comp_eq)
  >-
    (Cases_on`n`>>fs[ADD1])
  >-
    (match_mp_tac (good_ctrl_trace_SNOC)>>
    metis_tac comp_eq)>>
  match_mp_tac (good_plant_trace_SNOC)>>
  fs[plant_sat_def,plant_monitor_def,wfsem_bi_val_def]>>
  EVERY_CASE_TAC>>fs[]>>
  metis_tac comp_eq);

(* specify the full monitor *)
val monitor_loop_spec = Q.store_thm("monitor_loop_spec",`
  (* These specify what the inputs should be *)
  MONITORPROG_FML_TYPE w.wc.init iv ∧
  MONITORPROG_FML_TYPE w.wc.plant_monitor plantfv ∧
  MONITORPROG_FML_TYPE w.wc.ctrl_monitor ctrlfv ∧
  LIST_TYPE STRING_TYPE w.wc.const_names const_namesv ∧
  LIST_TYPE STRING_TYPE w.wc.sensor_pre_names sensor_pre_namesv ∧
  LIST_TYPE STRING_TYPE w.wc.sensor_names sensor_namesv ∧
  LIST_TYPE STRING_TYPE w.wc.ctrl_names ctrl_namesv ∧
  (LIST_TYPE WORD32 -->
  LIST_TYPE WORD32 -->
  LIST_TYPE WORD32) def defv ∧
  eventually ($~) w.wo.step_oracle ∧
  good_default def w ∧
  (* Alternatively, if w.tr = [] then these two are true *)
  good_ctrl_trace w.wc w.tr ∧
  good_plant_trace T w.wc w.tr w.ws
  ⇒
  app (p:'ffi ffi_proj) ^(fetch_v "Monitor.monitor_loop" bot_st)
    [iv;plantfv;ctrlfv;const_namesv;sensor_pre_namesv;sensor_namesv;ctrl_namesv;defv]
  (IOBOT w)
  (POSTv u. SEP_EXISTS w'. IOBOT w' *
    &(
      (* Either the initial world violates init immediately *)
      (w = w' ∧ ¬init_sat w.wc w.ws) ∨
      (* Or we transition to a final world,
         and good_world guarantees that the actuation trace all
         satisfy the control monitor *)
      good_world def w' ∧
      (¬w'.wo.step_oracle 0 ∨
         good_plant_trace F w'.wc w'.tr w'.ws)))`,
  rw[]>>
  xcf"Monitor.monitor_loop" bot_st>>
  drule get_const_spec>> strip_tac>>
  xlet_auto >- xsimpl>>
  drule get_sensor_spec>> strip_tac>>
  xlet_auto >- xsimpl>>
  rpt (xlet_auto >- xsimpl)>>
  xif
  >-
    (xapp>>xsimpl>>
    asm_exists_tac>>simp[]>>
    asm_exists_tac>>simp[]>>
    xsimpl>>fs[good_world_def]>>
    simp[good_ctrl_trace_def,good_plant_trace_def]>>
    rw[]
    >-
      (fs[const_ok_def,init_sat_def,wfsem_bi_val_def]>>
      EVERY_CASE_TAC>>fs[]>>
      metis_tac[])>>
    qexists_tac`x`>>simp[]>>xsimpl)
  >>
  reverse (Cases_on`wf_world w`)
  >-
    (simp[IOBOT_def]>>xpull)>>
  rpt (xlet_auto >- (TRY(xcon)>>xsimpl))>>
  xapp >> xsimpl>>
  qexists_tac`emp`>>qexists_tac`w`>>xsimpl>>
  qexists_tac`w`>>fs[init_sat_def]>>
  fs[wfsem_bi_val_def]>>
  xsimpl>>every_case_tac>>fs[]);

val _ = export_theory();
