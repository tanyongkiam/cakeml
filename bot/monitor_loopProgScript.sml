open preamble ml_progLib ml_translatorLib
     basisFunctionsLib basis_ffiLib
     cfTacticsLib cfLetAutoLib
     monitorProgTheory ctrl_monitor_1shotProgTheory ctrl_monitor_loopProgTheory
open cfHeapsBaseTheory

(*
  Defines and verifies a looping controller + plant monitor + wrapper
*)
val _ = new_theory "monitor_loopProg";

val _ = translation_extends "ctrl_monitor_loopProg";

(* Pure plant monitor wrapper
   Just returns whether the monitor passed
*)

val plant_monitor_def = Define`
  plant_monitor plant_phi const_names sensor_pre_names sensor_names ctrl_names
                            const_ls sensor_pre_ls sensor_ls ctrl_ls =
  let st_ls = FLAT [const_ls; sensor_pre_ls; sensor_ls; ctrl_ls] in
  let names_ls = FLAT [const_names; sensor_pre_names; sensor_names; ctrl_names] in
    wfsem_bi_val plant_phi (vars_to_state names_ls st_ls)`

val res = translate plant_monitor_def;

val monitor_loop_body = process_topdecs`
  fun monitor_loop_body plant_phi ctrl_phi
                        const_names sensor_pre_names sensor_names ctrl_names default
                        const_ls sensor_ls =
  (* First, we we will check if there is a next iteration *)
  if has_next()
  then
  let val ctrl_ls = get_ctrl ctrl_names const_ls sensor_ls in
  (* Run the controller monitor *)
  case ctrl_monitor ctrl_phi const_names sensor_names ctrl_names
                      const_ls sensor_ls ctrl_ls default
  of
    (flg,ctrl_ls) =>
    let
    val u = actuate flg ctrl_ls
    val sensor_new_ls = get_sensor sensor_names
    in
    if plant_monitor plant_phi const_names sensor_pre_names sensor_names ctrl_names
                               const_ls sensor_ls sensor_new_ls ctrl_ls
    then
      let val u = Runtime.fullGC()
      in
        monitor_loop_body plant_phi ctrl_phi
                          const_names sensor_pre_names sensor_names ctrl_names default
                          const_ls sensor_new_ls
      end
    else
      violation "Plant Violation"
    end
  end
  else
    ()`

val _ = append_prog monitor_loop_body;

val monitor_loop = process_topdecs`
  fun monitor_loop init_phi plant_phi ctrl_phi
              const_names sensor_pre_names sensor_names ctrl_names default =
  (* First read the constants and initial state *)
  let val const_ls = get_const const_names
      val sensor_ls = get_sensor sensor_names
      val names_ls = List.append const_names sensor_names
      val st_ls = List.append const_ls sensor_ls
  in
    if
      wfsem_bi_val init_phi (vars_to_state names_ls st_ls)
    then
      monitor_loop_body plant_phi ctrl_phi
              const_names sensor_pre_names sensor_names ctrl_names default
              const_ls sensor_ls
    else
      violation "Init Violation"
  end`

val _ = append_prog monitor_loop;

val bot_st = get_ml_prog_state();

val plant_sat_def = Define`
  plant_sat wc (wspre,ctrlpre) ws ⇔
  wfsem wc.plant_monitor
    (vars_to_state
    (wc.const_names ++ wc.sensor_pre_names ++ wc.sensor_names ++ wc.ctrl_names)
    (ws.const_vals  ++ wspre.sensor_vals ++ ws.sensor_vals  ++ ctrlpre)) = SOME T`

(* We now need an additional check that the plant states along
   the trace makes sense
*)

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

val comp_eq = [world_component_equality,
               world_config_component_equality,
               world_state_component_equality,
               world_oracle_component_equality];

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
    app (p:'ffi ffi_proj) ^(fetch_v "monitor_loop_body" bot_st)
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
  fs[eventually_def,PULL_EXISTS,good_world_ext_def]>>
  completeInduct_on`n`>>rw[]>>
  xcf"monitor_loop_body" bot_st>>
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
  disch_then(qspecl_then[`w'`,`p`,`n`] mp_tac)>>
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
    rw[]>> TRY(metis_tac comp_eq)>>
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
  rw[]>>TRY(metis_tac comp_eq)>>
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
  good_trace w.wc w.tr ∧
  good_plant_trace T w.wc w.tr w.ws
  ⇒
  app (p:'ffi ffi_proj) ^(fetch_v "monitor_loop" bot_st)
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
  xcf"monitor_loop" bot_st>>
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
    simp[good_trace_def,good_plant_trace_def]>>
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
