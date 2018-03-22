open preamble ml_progLib ml_translatorLib
     basisFunctionsLib
     cfTacticsLib cfLetAutoLib
     intervalArithTheory MonitorProgTheory botFFITheory
     Word8ArrayProofTheory
open cfHeapsBaseTheory blastLib ml_translatorTheory

val _ = new_theory"MonitorProof";

(*"*)
(*
  A functional spec for successful sandbox loop body transition
  with respect to a given list of default arguments
  (The ctrl monitor decides between the two, and the plant monitor succeeds)
*)

(* prevent automatic rewrite *)
val hide_def = Define`
  hide f p r <=> if f then p else r`

val body_step_def = Define`
  body_step flg defaults w w' <=>
  ∃ctrlplus_ls.
  LENGTH ctrlplus_ls = LENGTH w.wc.ctrlplus_names ∧
  let ctrl = SND
     (ctrl_monitor w.wc.ctrl_monitor
     w.wc.const_names w.wc.sensor_names w.wc.ctrlplus_names
     w.ws.const_vals w.ws.sensor_vals ctrlplus_ls
     w.wc.ctrlfixed_names w.wc.ctrlfixed_rhs defaults) in
  let plant =
     (plant_monitor w.wc.plant_monitor
     w.wc.const_names w.wc.sensor_names w.wc.ctrl_names w.wc.sensorplus_names
     w.ws.const_vals w.ws.sensor_vals ctrl w'.ws.sensor_vals) in
 hide flg plant ~plant ∧
 ffi_actuate [] (w32_to_w8 ctrl) w = SOME(w32_to_w8 ctrl, w')`

val body_sandbox_def = Define`
  body_sandbox flg wc =
   Seq (AssignAnyPar wc.ctrlplus_names)
  (Seq (AssignVarPar wc.ctrlfixed_names wc.ctrlfixed_rhs)
  (Seq (Choice (Test wc.ctrl_monitor) (AssignPar wc.ctrlplus_names wc.default))
  (Seq (AssignVarPar wc.ctrl_names wc.ctrlplus_names)
  (
    Seq (AssignAnyPar wc.sensorplus_names)
    (hide flg
      (Seq (Test wc.plant_monitor)
           (AssignVarPar wc.sensor_names wc.sensorplus_names))
      Skip)
  ))))`

(*
  The state relation between an FFI state and a HP state
  - maps point FFI state to a point interval
*)
val state_agree_def = Define`
  state_agree hp_w n v ⇔ ALOOKUP hp_w n = SOME (v,v)`

val state_rel_def = Define`
  state_rel w (hp_w:wstate) ⇔
  let names =  w.wc.sensor_names ++ w.wc.const_names in
  let vals  =  w.ws.sensor_vals  ++ w.ws.const_vals  in
    LIST_REL (state_agree hp_w) names vals`

val state_agree_append = Q.store_thm("state_agree_append",`
  ALL_DISTINCT names ∧
  no_overlap names (MAP FST y) ∧
  LIST_REL (state_agree x) names vals
  ⇒
  LIST_REL
    (state_agree (y++x)) names vals`,
  fs[state_agree_def,LIST_REL_EL_EQN,no_overlap_def]>>
  rw[]>>
  simp[ALOOKUP_APPEND]>>
  imp_res_tac ALOOKUP_ALL_DISTINCT_EL>>
  TOP_CASE_TAC>>fs[]>>
  imp_res_tac ALOOKUP_MEM>>fs[MEM_EL]>>
  pop_assum (assume_tac o SYM)>>
  fs[PULL_EXISTS]>>
  last_x_assum drule>>fs[]>>
  disch_then(qspec_then`n'` assume_tac)>>
  rfs[EL_MAP]);

val state_agree_append2 = Q.store_thm("state_agree_append2",`
  ALL_DISTINCT names ∧
  LENGTH names = LENGTH vals ∧
  MAP FST y = names ∧
  MAP SND y = ZIP(vals,vals)
  ⇒
  LIST_REL
    (state_agree (REVERSE y++x)) names vals`,
  rw[]>>
  fs[state_agree_def,LIST_REL_EL_EQN]>>rw[]>>
  simp[ALOOKUP_APPEND,EL_MAP]>>
  simp[alookup_distinct_reverse]>>
  imp_res_tac ALOOKUP_ALL_DISTINCT_EL>>
  pop_assum(qspec_then`n` assume_tac)>>rfs[]>>
  rfs[LIST_EQ_REWRITE,EL_ZIP]>>
  metis_tac[EL_MAP]);

(*
  These are syntactic well-formedness condition on mach_config

*)
val wf_config_def = Define`
  wf_config wc ⇔
  LENGTH wc.sensor_names = LENGTH wc.sensorplus_names ∧
  LENGTH wc.ctrl_names = LENGTH wc.ctrlplus_names ∧
  LENGTH wc.ctrl_names = LENGTH wc.default ∧
  LENGTH wc.ctrlfixed_names = LENGTH wc.ctrlfixed_rhs ∧
  ALL_DISTINCT wc.const_names ∧
  ALL_DISTINCT wc.sensor_names ∧
  ALL_DISTINCT wc.ctrlplus_names ∧
  ALL_DISTINCT wc.sensorplus_names ∧
  ALL_DISTINCT wc.ctrlfixed_names ∧
  ALL_DISTINCT wc.ctrl_names ∧
  no_overlap wc.ctrlfixed_names wc.ctrlfixed_rhs ∧
  no_overlap wc.ctrl_names wc.ctrlplus_names ∧
  no_overlap wc.sensor_names (wc.sensorplus_names ++ wc.ctrl_names ++ wc.ctrlplus_names ++ wc.ctrlfixed_names) ∧
  no_overlap wc.const_names
    (wc.sensor_names ++ wc.sensorplus_names ++ wc.ctrl_names ++ wc.ctrlplus_names ++
     wc.ctrlfixed_names) ∧
  no_overlap wc.ctrl_names wc.sensorplus_names ∧
  no_overlap wc.ctrlplus_names (FLAT (MAP fv_trm wc.default)) ∧
  no_overlap wc.ctrlplus_names wc.ctrlfixed_names ∧
  let fixed_deps = wc.const_names ++ wc.sensor_names in
  EVERY (λx. MEM x fixed_deps) wc.ctrlfixed_rhs ∧
  let plant_deps = wc.const_names ++ wc.sensor_names ++ wc.ctrl_names ++ wc.sensorplus_names in
  EVERY (λx. MEM x plant_deps) (fv_fml wc.plant_monitor) ∧
  let ctrl_deps = wc.const_names ++ wc.sensor_names ++ wc.ctrlplus_names ++ wc.ctrlfixed_names in
  EVERY (λx. MEM x ctrl_deps) (fv_fml wc.ctrl_monitor)`

(* Well-formed machs obey their config's lengths *)
val wf_mach_def = Define`
  wf_mach w ⇔
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

val MAP_ZIP2 = Q.prove(`
  LENGTH xs = LENGTH ys ⇒
  MAP (λ(x,t). (x,f t)) (ZIP (xs,ys)) =
  ZIP (xs, MAP f ys)`,
  fs[LIST_EQ_REWRITE] >>rw[EL_MAP,EL_ZIP]);

val ZIP_ID = Q.prove(`
  ZIP(ls,ls) = MAP (λx. x,x) ls`,
  fs[LIST_EQ_REWRITE,EL_ZIP,EL_MAP]);

val MEM_ALOOKUP_APPEND = Q.prove(`
  MEM x (MAP FST ls) ⇒
  ALOOKUP (ls++xs) x = ALOOKUP (ls++ys) x`,
  rw[ALOOKUP_APPEND]>>
  TOP_CASE_TAC>>fs[ALOOKUP_NONE]);

val MEM_ALOOKUP_APPEND_REV = Q.prove(`
  ALL_DISTINCT (MAP FST ls) ∧
  MEM x (MAP FST ls) ⇒
  ALOOKUP (ls++xs) x = ALOOKUP (REVERSE ls++ys) x`,
  rw[ALOOKUP_APPEND]>>
  TOP_CASE_TAC>>fs[ALOOKUP_NONE]>>
  simp[alookup_distinct_reverse]);

val NOT_MEM_ALOOKUP_APPEND = Q.prove(`
  ¬MEM x (MAP FST ls) ⇒
  ALOOKUP (ls++xs) x = ALOOKUP xs x`,
  rw[ALOOKUP_APPEND]>>
  TOP_CASE_TAC>>fs[]>>
  imp_res_tac ALOOKUP_MEM>>fs[MEM_MAP,FORALL_PROD]>>
  metis_tac[]);

val APPEND_ASSOC4 = Q.prove(`
  (a ++ b ++ c ++ d):'a list =
  (a++b) ++ (c++d)`,
  fs[]);

val no_overlap_APPEND = Q.prove(`
  no_overlap ls (xs++ys) ⇔
  no_overlap ls xs ∧ no_overlap ls ys`,
  fs[no_overlap_def]>>
  metis_tac[]);

val state_rel_lookup_const = Q.prove(`
  wf_config w.wc ∧
  wf_mach w /\
  MEM x w.wc.const_names ∧
  state_rel w st ⇒
  ALOOKUP
  (ZIP (w.wc.sensor_names,MAP (λx. (x,x)) w.ws.sensor_vals) ++
   ZIP (w.wc.const_names,MAP (λx. (x,x)) w.ws.const_vals)) x =
  ALOOKUP st x`,
  rw[]>>fs[state_rel_def,wf_config_def,wf_mach_def]>>
  rfs[LIST_REL_APPEND_EQ]>>
  fs[LIST_REL_EL_EQN,state_agree_def]>>
  fs[MEM_EL]>>
  pop_assum kall_tac>>
  first_x_assum(qspec_then`n` assume_tac)>>rfs[]>>
  dep_rewrite.DEP_ONCE_REWRITE_TAC [NOT_MEM_ALOOKUP_APPEND]>>
  CONJ_TAC>-
    (fs[MAP_ZIP,no_overlap_def]>>
    metis_tac[EL_MEM])>>
  qmatch_goalsub_abbrev_tac`ALOOKUP ls`>>
  Q.ISPECL_THEN [`ls`,`n`] assume_tac ALOOKUP_ALL_DISTINCT_EL>>
  rfs[Abbr`ls`,MAP_ZIP,EL_ZIP]>>
  fs[EL_MAP]);

val state_rel_lookup_sensor = Q.prove(`
  wf_config w.wc ∧
  wf_mach w /\
  MEM x w.wc.sensor_names ∧
  state_rel w st ⇒
  ALOOKUP
  (ZIP (w.wc.sensor_names,MAP (λx. (x,x)) w.ws.sensor_vals) ++
   ZIP (w.wc.const_names,MAP (λx. (x,x)) w.ws.const_vals)) x =
  ALOOKUP st x`,
  rw[]>>fs[state_rel_def,wf_config_def,wf_mach_def]>>
  rfs[LIST_REL_APPEND_EQ]>>
  fs[LIST_REL_EL_EQN,state_agree_def]>>
  fs[MEM_EL]>>
  first_x_assum(qspec_then`n` assume_tac)>>rfs[]>>
  dep_rewrite.DEP_ONCE_REWRITE_TAC [Q.SPEC `[]` (GEN_ALL MEM_ALOOKUP_APPEND)]>>
  simp[MAP_ZIP]>>fs[EL_MEM]>>
  qmatch_goalsub_abbrev_tac`ALOOKUP ls`>>
  Q.ISPECL_THEN [`ls`,`n`] assume_tac ALOOKUP_ALL_DISTINCT_EL>>
  rfs[Abbr`ls`,MAP_ZIP,EL_ZIP]>>
  fs[EL_MAP]);

(* Relate body step to transitions of a particular HP *)
val body_step_state_rel = Q.store_thm("body_step_state_rel",`
  wf_config w.wc ∧
  wf_mach w ∧
  state_rel w st ∧
  evaluate_default w.wc.const_names w.ws.const_vals w.wc.default = SOME defaults ∧
  body_step flg defaults w w' ⇒
  ∃st'.
  hide flg (state_rel w' st') T ∧
  wpsem (body_sandbox flg w.wc) st st'`,
  rw[body_step_def,body_sandbox_def]>>
  fs[wf_config_def]>>
  simp[Once wpsem_cases]>>
  simp[AssignAnyPar_sem]>>
  simp[PULL_EXISTS]>>
  CONV_TAC (RESORT_EXISTS_CONV (sort_vars ["ws"]))>>
  qexists_tac`MAP (λx. (x,x)) ctrlplus_ls`>>
  simp[EVERY_MAP]>>
  simp[Once wpsem_cases]>>
  qmatch_goalsub_abbrev_tac`wpsem _ st1 _`>>
  simp[PULL_EXISTS]>>
  simp[AssignVarPar_sem]>>
  simp[Once wpsem_cases]>>
  simp[Once wpsem_cases]>>
  simp[PULL_EXISTS]>>
  simp[METIS_PROVE [] ``(A ∧ B ∧ (C ∨ D) ∧ E) ⇔ (A ∧ B ∧ C ∧ E) ∨ (A ∧ B ∧ D ∧ E)``]>>
  simp[EXISTS_OR_THM]>>
  (* Now we case split on the control choice made by the sandbox *)
  qpat_x_assum`ffi_actuate _ _ _ = _` mp_tac>>
  simp[ctrl_monitor_def,wfsem_bi_val_def]>>
  reverse IF_CASES_TAC
  >- (
    (* Fallback to the defauls *)
    rw[]>>DISJ2_TAC>>
    simp[AssignPar_sem]>>
    simp[Once wpsem_cases]>>
    simp[AssignVarPar_sem]>>
    simp[Once wpsem_cases]>>
    simp[AssignAnyPar_sem,PULL_EXISTS]>>
    fs[ffi_actuate_def]>>
    rpt (pairarg_tac>>fs[])>>
    rw[]>>fs[]>>
    qmatch_goalsub_abbrev_tac`w.ws with sensor_vals := ls`>>
    CONV_TAC (RESORT_EXISTS_CONV (sort_vars ["ws"]))>>
    qexists_tac`MAP (\x. (x,x)) ls`>>simp[]>>
    `LENGTH ls = LENGTH w.wc.sensorplus_names` by
      (fs[wf_mach_def,get_oracle_def,Abbr`ls`]>>
      rpt(pairarg_tac>>fs[])>>
      metis_tac[])>>
    simp[EVERY_MEM,EVERY_MAP,WORD_LESS_EQ_REFL]>>
    reverse (Cases_on`flg`)>>
    simp[hide_def]
    >-
      (* plant monitor fails *)
      simp[Once wpsem_cases]
    >>
    simp[Once wpsem_cases]>>
    simp[Once wpsem_cases]>>
    fs[no_overlap_APPEND]>>
    simp[AssignVarPar_sem]>>
    simp[state_rel_def]>>
    simp[LIST_REL_APPEND_EQ]>>rw[]
    >-
      (PURE_REWRITE_TAC [GSYM APPEND_ASSOC]>>
      match_mp_tac state_agree_append2>>
      fs[MAP_REVERSE,MAP_ZIP]>>
      rw[LIST_EQ_REWRITE,EL_MAP,lookup_var_def]>>
      qmatch_goalsub_abbrev_tac`sensorplus ++ ctrl ++ ctrlplus++ctrlfixed++st1`>>
      `EL x w.wc.sensorplus_names = FST (EL x (REVERSE sensorplus))` by
        fs[Abbr`sensorplus`,EL_ZIP]>>
      `ALOOKUP (REVERSE sensorplus) (EL x w.wc.sensorplus_names) = SOME (SND (EL x (REVERSE sensorplus)))` by
        (fs[]>>
        match_mp_tac ALOOKUP_ALL_DISTINCT_EL>>
        fs[Abbr`sensorplus`,MAP_ZIP])>>
      simp[ALOOKUP_APPEND,Abbr`sensorplus`,alookup_distinct_reverse]>>
      rfs[EL_ZIP,EL_MAP,MAP_ZIP,alookup_distinct_reverse])
    >-
      (* constants unchanged *)
      (simp[Abbr`st1`]>>
      match_mp_tac state_agree_append>>
      simp[MAP_MAP_o,o_DEF,UNCURRY,ETA_AX,MAP_ZIP,MAP_REVERSE]>>
      rfs[LIST_REL_APPEND_EQ,state_rel_def]>>
      fs[no_overlap_def]>>
      fs[wf_mach_def]>>
      metis_tac[LIST_REL_APPEND_EQ])
    >>
    fs[hide_def]>>
    qpat_x_assum`plant_monitor _ _ _ _ _ _ _ _ _` mp_tac>>
    simp[plant_monitor_def,wfsem_bi_val_def]>>
    TOP_CASE_TAC>>rw[]>>
    pop_assum sym_sub_tac>>
    match_mp_tac fv_fml_coincide>>
    fs[]>>
    match_mp_tac EVERY_MEM_MONO>>
    HINT_EXISTS_TAC>>fs[]>>
    simp[ZIP_ID]>>
    fs[ctrl_monitor_def,wfsem_bi_val_def]>>
    qmatch_goalsub_abbrev_tac`sensorplus++ ctrl ++ ctrlplus++ ctrlfixed ++ st1`>>
    fs[wf_mach_def]>>
    fs[evaluate_default_def]>>rw[]
    >- (
      (* consts *)
      simp[GSYM REVERSE_APPEND,Abbr`st1`]>>
      qmatch_goalsub_abbrev_tac`ALOOKUP (ss ++ st)`>>
      `ALOOKUP ss x = NONE` by
        (simp[ALOOKUP_NONE]>>unabbrev_all_tac>>
        fs[MAP_ZIP,no_overlap_def,MAP_REVERSE])>>
      simp[ALOOKUP_APPEND]>>
      rfs[GSYM ZIP_APPEND]>>
      PURE_REWRITE_TAC [APPEND_ASSOC4]>>
      simp[Once ALOOKUP_APPEND]>>
      simp[option_case_eq]>> DISJ1_TAC>>rw[]
      >-
        (simp[ALOOKUP_NONE]>>unabbrev_all_tac>>
        fs[MAP_ZIP,no_overlap_def,MAP_REVERSE])
      >>
        match_mp_tac state_rel_lookup_const>>
        fs[wf_config_def,wf_mach_def,no_overlap_def])
    >- (
      (* sensors *)
      simp[GSYM REVERSE_APPEND,Abbr`st1`]>>
      qmatch_goalsub_abbrev_tac`ALOOKUP (ss ++ st)`>>
      `ALOOKUP ss x = NONE` by
        (simp[ALOOKUP_NONE]>>unabbrev_all_tac>>
        fs[MAP_ZIP,no_overlap_def,MAP_REVERSE])>>
      simp[ALOOKUP_APPEND]>>
      rfs[GSYM ZIP_APPEND]>>
      PURE_REWRITE_TAC [APPEND_ASSOC4]>>
      simp[Once ALOOKUP_APPEND]>>
      simp[option_case_eq]>> DISJ1_TAC>>rw[]
      >-
        (simp[ALOOKUP_NONE]>>unabbrev_all_tac>>
        fs[MAP_ZIP,no_overlap_def,MAP_REVERSE])
      >>
        match_mp_tac state_rel_lookup_sensor>>
        fs[wf_config_def,wf_mach_def,no_overlap_def])
    >-
      (rfs[GSYM ZIP_APPEND]>>
      PURE_REWRITE_TAC[GSYM APPEND_ASSOC]>>
      dep_rewrite.DEP_ONCE_REWRITE_TAC [NOT_MEM_ALOOKUP_APPEND]>>
      CONJ_TAC>- fs[MAP_ZIP,no_overlap_def,Abbr`sensorplus`,MAP_REVERSE]>>
      qmatch_goalsub_abbrev_tac`(w.wc.ctrl_names, default2)`>>
      match_mp_tac EQ_SYM>>
      dep_rewrite.DEP_ONCE_REWRITE_TAC [NOT_MEM_ALOOKUP_APPEND]>>
      CONJ_TAC>- fs[MAP_ZIP,no_overlap_def]>>
      simp[Abbr`ctrl`]>>
      qmatch_goalsub_abbrev_tac`REVERSE(ZIP(w.wc.ctrl_names,default))`>>
      (* need to prove that default = default2 *)
      cheat)
    >-
      (fs[GSYM ZIP_APPEND,Abbr`sensorplus`]>>
      PURE_REWRITE_TAC[GSYM APPEND_ASSOC]>>
      match_mp_tac EQ_SYM>>
      match_mp_tac MEM_ALOOKUP_APPEND_REV>>
      fs[MAP_ZIP]))
  >>
    (* Normal control*)
    rw[]>>DISJ1_TAC>>
    simp[Once wpsem_cases]>>
    simp[Once wpsem_cases]>>
    simp[AssignVarPar_sem]>>
    simp[Once wpsem_cases]>>
    simp[AssignAnyPar_sem,PULL_EXISTS]>>
    fs[ffi_actuate_def]>>
    rpt (pairarg_tac>>fs[])>>
    rw[]>>fs[]>>
    qmatch_goalsub_abbrev_tac`w.ws with sensor_vals := ls`>>
    CONV_TAC (RESORT_EXISTS_CONV (sort_vars ["ws"]))>>
    qexists_tac`MAP (\x. (x,x)) ls`>>simp[]>>
    `LENGTH ls = LENGTH w.wc.sensorplus_names` by
      (fs[wf_mach_def,get_oracle_def,Abbr`ls`]>>
      rpt(pairarg_tac>>fs[])>>
      metis_tac[])>>
    simp[EVERY_MEM,EVERY_MAP,WORD_LESS_EQ_REFL]>>
    qmatch_goalsub_abbrev_tac`wfsem w.wc.ctrl_monitor lss`>>
    `wfsem w.wc.ctrl_monitor lss = SOME T` by
      (fs[Abbr`lss`,wf_mach_def]>>
      EVERY_CASE_TAC>>fs[]>>
      qpat_x_assum`_ = SOME T` (sym_sub_tac)>>
      match_mp_tac fv_fml_coincide>>
      fs[]>>
      match_mp_tac EVERY_MEM_MONO>>
      HINT_EXISTS_TAC>>fs[]>>
      simp[ZIP_ID]>>
      fs[evaluate_default_def,lookup_fixed_def]>>rw[]
      >- (
        (* consts *)
        simp[GSYM REVERSE_APPEND,Abbr`st1`]>>
        qmatch_goalsub_abbrev_tac`ALOOKUP (ss ++ st)`>>
        `ALOOKUP ss x' = NONE` by
          (simp[ALOOKUP_NONE]>>unabbrev_all_tac>>
          rfs[MAP_ZIP,no_overlap_def,MAP_REVERSE])>>
        simp[ALOOKUP_APPEND,MAP_MAP_o]>>
        rfs[GSYM ZIP_APPEND]>>
        PURE_REWRITE_TAC [APPEND_ASSOC4]>>
        simp[Once ALOOKUP_APPEND]>>
        simp[option_case_eq]>> DISJ1_TAC>>rw[]
        >-
          (simp[ALOOKUP_NONE]>>unabbrev_all_tac>>
          fs[MAP_ZIP,no_overlap_def,MAP_REVERSE])
        >>
          match_mp_tac state_rel_lookup_const>>
          fs[wf_config_def,wf_mach_def,no_overlap_def])
      >- (
        (* sensors *)
        simp[GSYM REVERSE_APPEND,Abbr`st1`]>>
        qmatch_goalsub_abbrev_tac`ALOOKUP (ss ++ st)`>>
        `ALOOKUP ss x' = NONE` by
          (simp[ALOOKUP_NONE]>>unabbrev_all_tac>>
          fs[MAP_ZIP,no_overlap_def,MAP_REVERSE])>>
        simp[ALOOKUP_APPEND]>>
        rfs[GSYM ZIP_APPEND]>>
        PURE_REWRITE_TAC [APPEND_ASSOC4]>>
        simp[Once ALOOKUP_APPEND]>>
        simp[option_case_eq]>> DISJ1_TAC>>rw[]
        >-
          (simp[ALOOKUP_NONE]>>unabbrev_all_tac>>
          fs[MAP_ZIP,no_overlap_def,MAP_REVERSE])
        >>
          match_mp_tac state_rel_lookup_sensor>>
          fs[wf_config_def,wf_mach_def,no_overlap_def])
      >- (
        (* ctrlplus *)
        rfs[GSYM ZIP_APPEND]>>
        dep_rewrite.DEP_ONCE_REWRITE_TAC [NOT_MEM_ALOOKUP_APPEND]>>
        CONJ_TAC>-
          (fs[MAP_REVERSE,MAP_ZIP,no_overlap_def])>>
        PURE_REWRITE_TAC [GSYM APPEND_ASSOC]>>
        dep_rewrite.DEP_ONCE_REWRITE_TAC [NOT_MEM_ALOOKUP_APPEND]>>
        CONJ_TAC>-
          (fs[MAP_REVERSE,MAP_ZIP,no_overlap_def])>>
        match_mp_tac EQ_SYM>>
        simp[Abbr`st1`]>>
        PURE_REWRITE_TAC [GSYM APPEND_ASSOC]>>
        match_mp_tac MEM_ALOOKUP_APPEND_REV>>
        fs[MAP_ZIP])
      >>
        (* ctrlfixed *)
        simp[GSYM ZIP_APPEND]>>
        PURE_REWRITE_TAC [GSYM APPEND_ASSOC]>>
        dep_rewrite.DEP_ONCE_REWRITE_TAC [Q.SPEC `[]` (GEN_ALL MEM_ALOOKUP_APPEND)]>>
        simp[MAP_ZIP,MAP_REVERSE]>>
        PURE_REWRITE_TAC [GSYM APPEND_ASSOC]>>
        dep_rewrite.DEP_ONCE_REWRITE_TAC [Q.SPEC `[]` (GEN_ALL MEM_ALOOKUP_APPEND)]>>
        simp[MAP_ZIP,MAP_REVERSE]>>
        dep_rewrite.DEP_REWRITE_TAC [alookup_distinct_reverse]>>
        simp[MAP_ZIP,MAP_MAP_o,o_DEF]>>
        AP_THM_TAC>>
        rpt(AP_TERM_TAC)>>
        simp[MAP_EQ_f,Abbr`st1`]>>rw[lookup_var_def]>>
        dep_rewrite.DEP_ONCE_REWRITE_TAC [NOT_MEM_ALOOKUP_APPEND]>>
        simp[MAP_REVERSE,MAP_ZIP]>>
        CONJ_TAC>-
           cheat>>
        cheat)>>
    reverse (Cases_on`flg`)>>
    simp[hide_def]
    >-
      (* plant monitor fails *)
      simp[Once wpsem_cases]
    >>
    simp[Once wpsem_cases]>>
    simp[Once wpsem_cases]>>
    fs[no_overlap_APPEND]>>
    simp[AssignVarPar_sem]>>
    simp[state_rel_def]>>
    simp[LIST_REL_APPEND_EQ]>>rw[]
    >-
      (PURE_REWRITE_TAC [GSYM APPEND_ASSOC]>>
      match_mp_tac state_agree_append2>>
      fs[MAP_REVERSE,MAP_ZIP]>>
      rw[LIST_EQ_REWRITE,EL_MAP,lookup_var_def]>>
      qmatch_goalsub_abbrev_tac`sensorplus ++ ctrl ++ ctrlfixed++st1`>>
      `EL x w.wc.sensorplus_names = FST (EL x (REVERSE sensorplus))` by
        fs[Abbr`sensorplus`,EL_ZIP]>>
      `ALOOKUP (REVERSE sensorplus) (EL x w.wc.sensorplus_names) = SOME (SND (EL x (REVERSE sensorplus)))` by
        (fs[]>>
        match_mp_tac ALOOKUP_ALL_DISTINCT_EL>>
        fs[Abbr`sensorplus`,MAP_ZIP])>>
      simp[ALOOKUP_APPEND,Abbr`sensorplus`,alookup_distinct_reverse]>>
      rfs[EL_ZIP,EL_MAP,MAP_ZIP,alookup_distinct_reverse])
    >-
      (* constants unchanged *)
      (simp[Abbr`st1`]>>
      match_mp_tac state_agree_append>>
      simp[MAP_MAP_o,o_DEF,UNCURRY,ETA_AX,MAP_ZIP,MAP_REVERSE]>>
      rfs[LIST_REL_APPEND_EQ,state_rel_def]>>
      fs[no_overlap_def]>>
      fs[wf_mach_def]>>
      metis_tac[LIST_REL_APPEND_EQ])
    >>
    fs[hide_def]>>
    qpat_x_assum`plant_monitor _ _ _ _ _ _ _ _ _` mp_tac>>
    simp[plant_monitor_def,wfsem_bi_val_def]>>
    TOP_CASE_TAC>>rw[]>>
    pop_assum sym_sub_tac>>
    match_mp_tac fv_fml_coincide>>
    fs[]>>
    match_mp_tac EVERY_MEM_MONO>>
    HINT_EXISTS_TAC>>fs[]>>
    simp[ZIP_ID]>>
    fs[ctrl_monitor_def,wfsem_bi_val_def]>>
    qmatch_goalsub_abbrev_tac`sensorplus++ ctrl ++ ctrlfixed ++ st1`>>
    fs[wf_mach_def]>>
    fs[evaluate_default_def]>>rw[]
    >- (
      (* consts *)
      simp[GSYM REVERSE_APPEND,Abbr`st1`]>>
      qmatch_goalsub_abbrev_tac`ALOOKUP (ss ++ st)`>>
      `ALOOKUP ss x = NONE` by
        (simp[ALOOKUP_NONE]>>unabbrev_all_tac>>
        fs[MAP_ZIP,no_overlap_def,MAP_REVERSE])>>
      simp[ALOOKUP_APPEND]>>
      rfs[GSYM ZIP_APPEND]>>
      PURE_REWRITE_TAC [APPEND_ASSOC4]>>
      simp[Once ALOOKUP_APPEND]>>
      simp[option_case_eq]>> DISJ1_TAC>>rw[]
      >-
        (simp[ALOOKUP_NONE]>>unabbrev_all_tac>>
        fs[MAP_ZIP,no_overlap_def,MAP_REVERSE])
      >>
        match_mp_tac state_rel_lookup_const>>
        fs[wf_config_def,wf_mach_def,no_overlap_def])
    >- (
      (* sensors *)
      simp[GSYM REVERSE_APPEND,Abbr`st1`]>>
      qmatch_goalsub_abbrev_tac`ALOOKUP (ss ++ st)`>>
      `ALOOKUP ss x = NONE` by
        (simp[ALOOKUP_NONE]>>unabbrev_all_tac>>
        fs[MAP_ZIP,no_overlap_def,MAP_REVERSE])>>
      simp[ALOOKUP_APPEND]>>
      rfs[GSYM ZIP_APPEND]>>
      PURE_REWRITE_TAC [APPEND_ASSOC4]>>
      simp[Once ALOOKUP_APPEND]>>
      simp[option_case_eq]>> DISJ1_TAC>>rw[]
      >-
        (simp[ALOOKUP_NONE]>>unabbrev_all_tac>>
        fs[MAP_ZIP,no_overlap_def,MAP_REVERSE])
      >>
        match_mp_tac state_rel_lookup_sensor>>
        fs[wf_config_def,wf_mach_def,no_overlap_def])
    >-
      (rfs[GSYM ZIP_APPEND]>>
      PURE_REWRITE_TAC[GSYM APPEND_ASSOC]>>
      dep_rewrite.DEP_ONCE_REWRITE_TAC [NOT_MEM_ALOOKUP_APPEND]>>
      CONJ_TAC>- fs[MAP_ZIP,no_overlap_def,Abbr`sensorplus`,MAP_REVERSE]>>
      match_mp_tac EQ_SYM>>
      dep_rewrite.DEP_ONCE_REWRITE_TAC [NOT_MEM_ALOOKUP_APPEND]>>
      CONJ_TAC>- fs[MAP_ZIP,no_overlap_def]>>
      qsuff_tac`ctrl = REVERSE(ZIP(w.wc.ctrl_names,MAP (\x.x,x) ctrlplus_ls))`
      >-
        (disch_then SUBST_ALL_TAC>>
        match_mp_tac MEM_ALOOKUP_APPEND_REV>>
        fs[MAP_ZIP])
      >>
      simp[Abbr`ctrl`]>>
      rpt(AP_TERM_TAC)>>
      unabbrev_all_tac>>fs[]>>
      rw[LIST_EQ_REWRITE,EL_MAP,lookup_var_def]>>
      PURE_REWRITE_TAC[GSYM APPEND_ASSOC]>>
      dep_rewrite.DEP_ONCE_REWRITE_TAC [NOT_MEM_ALOOKUP_APPEND]>>
      simp[MAP_ZIP,MAP_REVERSE]>>
      CONJ_TAC>- cheat>>
      dep_rewrite.DEP_ONCE_REWRITE_TAC [Q.SPEC `[]` (GEN_ALL MEM_ALOOKUP_APPEND)]>>
      simp[MAP_ZIP,MAP_REVERSE]>>
      CONJ_TAC>- metis_tac[EL_MEM]>>
      dep_rewrite.DEP_ONCE_REWRITE_TAC [alookup_distinct_reverse]>>
      fs[MAP_ZIP]>>
      (* easy *)
      cheat)
    >-
      (fs[GSYM ZIP_APPEND,Abbr`sensorplus`]>>
      PURE_REWRITE_TAC[GSYM APPEND_ASSOC]>>
      match_mp_tac EQ_SYM>>
      match_mp_tac MEM_ALOOKUP_APPEND_REV>>
      fs[MAP_ZIP]));

(* Looping the body corresponds to the reflexive transitive closure *)
val body_loop_state_rel = Q.store_thm("body_loop_state_rel",`
  ∀w w'.
  (body_step T defaults)^* w w' ⇒
  ∀st.
  wf_config w.wc ∧
  wf_mach w ∧
  state_rel w st ∧
  evaluate_default w.wc.const_names w.ws.const_vals w.wc.default = SOME defaults ==>
  ∃st'.
  state_rel w' st' ∧
  wpsem (Loop (body_sandbox T w.wc)) st st'`,
  ho_match_mp_tac RTC_INDUCT>>
  rw[]
  >-
    (qexists_tac`st`>>simp[Once wpsem_cases])
  >>
    drule (GEN_ALL body_step_state_rel)>>fs[]>>
    disch_then drule>>
    disch_then drule>>
    rw[hide_def]>>
    simp[Once wpsem_cases]>>
    simp[METIS_PROVE [] ``(A ∧ (C ∨ D)) ⇔ (A ∧ C) ∨ (A ∧ D)``,EXISTS_OR_THM]>>
    DISJ2_TAC>>
    simp[PULL_EXISTS]>>
  CONV_TAC (RESORT_EXISTS_CONV (sort_vars ["u"]))>>
  qexists_tac`st'`>>simp[]>>
  fs[body_step_def,ffi_actuate_def]>>
  rpt(pairarg_tac>>fs[])>>rw[]>>
  fs[]>>
  first_x_assum match_mp_tac>>
  fs[state_rel_def,wf_mach_def,get_oracle_def]>>
  rpt(pairarg_tac>>fs[])>>rw[]);

val _ = translation_extends "MonitorProg";
(*"*)

(* We now prove specs for each function added in MonitorProg *)

val bot_st = get_ml_prog_state();
val _ = overload_on ("WORD32",``WORD:word32 -> v -> bool``);

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
    app (p:'ffi ffi_proj) ^(fetch_v "pack_w32_list" bot_st) [lv]
      emp (POSTv av.
      W8ARRAY av (w32_to_w8 l))`,
  xcf "pack_w32_list" bot_st>>
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
    app (p:'ffi ffi_proj) ^(fetch_v "unpack_w32_list" bot_st) [av]
      (W8ARRAY av a)
      (POSTv lv.
      W8ARRAY av a *
      &LIST_TYPE WORD32 (w8_to_w32 a) lv)`,
  xcf "unpack_w32_list" bot_st>>
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

(* We now specify each of the functions *)

val IOBOT_def = Define `
  IOBOT w = IOx bot_ffi_part w * &(wf_mach w)`

(* TODO: remove once STRING_TYPE is fixed *)
val _ = overload_on ("CLSTRING_TYPE",``LIST_TYPE CHAR``);

val get_const_spec = Q.store_thm("get_const_spec",`
  ∀w vs ls.
  LIST_TYPE CLSTRING_TYPE ls vs ∧
  LENGTH ls = LENGTH w.wc.const_names
  ⇒
  app (p:'ffi ffi_proj) ^(fetch_v "get_const" bot_st) [vs]
    (IOBOT w)
    (POSTv lv.
    IOBOT w *
    &LIST_TYPE WORD32 w.ws.const_vals lv)`,
  rw[IOBOT_def]>>
  xpull>>
  xcf "get_const" bot_st>>
  rpt(xlet_auto>- xsimpl)>>
  xlet `POSTv u.
         IOx bot_ffi_part w *
         W8ARRAY v' (w32_to_w8 w.ws.const_vals)`
  >-
    (xffi>>xsimpl>>
    simp[IOx_def,bot_ffi_part_def,mk_ffi_next_def]>>
    xsimpl >>
    qmatch_goalsub_abbrev_tac`IO s u ns` >>
    map_every qexists_tac [`&wf_mach w`, `s`, `s`, `u`, `ns`] >>
    unabbrev_all_tac>>
    xsimpl >>
    fs[mk_ffi_next_def,ffi_get_const_def,wf_mach_def])
  >>
  xapp>>xsimpl>>
  simp[w8_to_w32_w32_to_w8]);

val get_sensor_spec = Q.store_thm("get_sensor_spec",`
  ∀w vs ls.
  LIST_TYPE CLSTRING_TYPE ls vs ∧
  LENGTH ls = LENGTH w.wc.sensor_names
  ⇒
  app (p:'ffi ffi_proj) ^(fetch_v "get_sensor" bot_st) [vs]
    (IOBOT w)
    (POSTv lv.
    IOBOT w *
    &LIST_TYPE WORD32 w.ws.sensor_vals lv)`,
  rw[IOBOT_def]>>
  xpull>>
  xcf "get_sensor" bot_st>>
  rpt(xlet_auto>- xsimpl)>>
  xlet `POSTv u.
         IOx bot_ffi_part w *
         W8ARRAY v' (w32_to_w8 w.ws.sensor_vals)`
  >-
    (xffi>>xsimpl>>
    simp[IOx_def,bot_ffi_part_def,mk_ffi_next_def]>>
    xsimpl >>
    qmatch_goalsub_abbrev_tac`IO s u ns` >>
    map_every qexists_tac [`&wf_mach w`, `s`, `s`, `u`, `ns`] >>
    unabbrev_all_tac>>
    xsimpl >>
    fs[mk_ffi_next_def,ffi_get_sensor_def,wf_mach_def])
  >>
  xapp>>xsimpl>>
  simp[w8_to_w32_w32_to_w8]);

val to_string_spec = Q.store_thm("to_string_spec",`
  app (p:'ffi ffi_proj) ^(fetch_v "to_string" bot_st) [ar]
    (W8ARRAY ar av)
    (POSTv v.
    &(STRING_TYPE (strlit (MAP (CHR o w2n) av)) v) * W8ARRAY ar av)`,
  xcf "to_string" bot_st>>
  xlet_auto >- xsimpl>>
  xapp>>
  xsimpl>>
  qexists_tac`LENGTH av`>>
  simp[]);

val get_ctrl_spec = Q.store_thm("get_ctrl_spec",`
  ∀w vs constv sensorv ls.
  LIST_TYPE CLSTRING_TYPE ls vs ∧
  LENGTH ls = LENGTH w.wc.ctrl_names ∧
  LIST_TYPE WORD32 w.ws.const_vals constv ∧
  LIST_TYPE WORD32 w.ws.sensor_vals sensorv
  ⇒
  app (p:'ffi ffi_proj) ^(fetch_v "get_ctrl" bot_st) [vs;constv;sensorv]
    (IOBOT w)
    (POSTv lv.
    IOBOT (w with
      wo := w.wo with ctrl_oracle := (λn. w.wo.ctrl_oracle (n + 1)))*
    SEP_EXISTS vv.
    & (LENGTH vv = LENGTH w.wc.ctrl_names ∧
      LIST_TYPE WORD32 vv lv))`,
  rw[IOBOT_def]>>
  xpull>>
  xcf "get_ctrl" bot_st>>
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
  >- (
    xffi>>xsimpl>>
    simp[IOx_def,bot_ffi_part_def,mk_ffi_next_def]>>
    qmatch_goalsub_abbrev_tac`IO s u ns` >>
    qabbrev_tac`lss = w32_to_w8 w.ws.const_vals ++ w32_to_w8 w.ws.sensor_vals`>>
    qexists_tac`lss` >>
    qexists_tac`W8ARRAY av (w32_to_w8 (w.ws.const_vals ⧺ w.ws.sensor_vals))`>> xsimpl>>
    qmatch_goalsub_abbrev_tac`IO (encode s') u ns` >>
    map_every qexists_tac[`s`,`encode s'`,`u`,`ns`]>>
    xsimpl>>
    unabbrev_all_tac>>
    simp[mk_ffi_next_def,ffi_get_control_def,get_oracle_def]>>
    fs[mlstringTheory.concat_def,ml_translatorTheory.STRING_TYPE_def,
      LENGTH_w32_to_w8,wf_mach_def,w32_to_w8_APPEND]>>
    metis_tac[])
  >>
    xapp>>xsimpl>>
    rw[]>>
    fs[w8_to_w32_w32_to_w8,wf_mach_def]>>
    metis_tac[]);

val string_ID = Q.store_thm("string_ID",`
  ∀s. MAP (CHR ∘ (w2n:word8->num)) (MAP (n2w ∘ ORD) s) = s`,
  fs[LIST_EQ_REWRITE,EL_MAP]>>rw[]>>
  `ORD (EL x s) MOD 256 = ORD (EL x s)` by
    fs[MOD_LESS,ORD_BOUND]>>
  metis_tac[CHR_ORD]);

val actuate_spec = Q.store_thm("actuate_spec",`
  LIST_TYPE WORD32 ctrl_vals ctrlv ∧
  STRING_TYPE strng strngv ∧
  LENGTH ctrl_vals = LENGTH w.wc.ctrl_names ∧
  wf_config w.wc ∧
  w.wo.step_oracle 0
  ⇒
  app (p:'ffi ffi_proj) ^(fetch_v "actuate" bot_st) [strngv;ctrlv]
   (IOBOT w )
   (* We could be more precise and also talk about the oracles
      but this characterization is all we need here *)
   (POSTv uv. &(UNIT_TYPE () uv) *
   SEP_EXISTS w'. IOBOT w'  *
   &(
    w'.tr = SNOC (w.ws,ctrl_vals) w.tr ∧
    w.wc = w'.wc ∧
    w.ws.const_vals = w'.ws.const_vals ∧
    w'.wo.step_oracle = λn. w.wo.step_oracle (n+1)))`,
  rw[]>>
  xcf"actuate" bot_st>>
  xlet_auto >- xsimpl>>
  simp[IOBOT_def]>>xpull>>
  xlet`POSTv uv. W8ARRAY av (w32_to_w8 ctrl_vals) *
     SEP_EXISTS w'.
       IOx bot_ffi_part w' * &(wf_mach w') *
       &(w'.tr = w.tr ⧺ [(w.ws,ctrl_vals)] ∧ w.wc = w'.wc ∧
         w.ws.const_vals = w'.ws.const_vals ∧
         w'.wo.step_oracle = (λn. w.wo.step_oracle (n + 1)))`
  >-
    (xffi >> xsimpl>>
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
    qexists_tac`ww`>>xsimpl>>
    fs[Abbr`ww`,wf_mach_def,w8_to_w32_w32_to_w8])
  >>
  xcon>>xsimpl>>
  asm_exists_tac>>xsimpl);

(*
  At this point, we have enough to specify our 1-shot controller.

val get_fixed_def = Define`
  get_fixed wc ws ls =
  let names = wc.const_names ++ wc.sensor_names in
  let vals  = ws.const_vals  ++ ws.sensor_vals in
    lookup_fixed (ZIP (names,vals)) ls`

(* The control choice ctrl is good w.r.t. to a mach state *)
val ctrl_sat_def = Define`
  ctrl_sat wc ws ctrl ⇔
  wfsem wc.ctrl_monitor
    (vars_to_state
    (wc.const_names ++ wc.sensor_names ++ wc.ctrlplus_names ++ wc.ctrlfixed_names)
    (ws.const_vals  ++ ws.sensor_vals  ++ ctrl              ++ get_fixed wc ws wc.ctrlfixed_rhs)) = SOME T`
*)

(* First we define what we means for a default controller to make sense with respect
   to a world w
   When looked up, its output satisfies the controller monitor
val get_default_def = Define`
  get_default w =
    evaluate_default w.wc.const_names w.ws.const_vals w.wc.default`

val good_default_def = Define`
  good_default w ⇔
  ∀svals.
  LENGTH svals = LENGTH w.wc.sensor_names ⇒
  ctrl_sat w.wc (w.ws with sensor_vals := svals) (get_default w)`

val good_default_IMP = Q.prove(`
  ∀ls w.
  good_default w ∧
  wf_config w.wc ∧
  wf_mach w ∧
  LENGTH ls = LENGTH w.wc.ctrl_names ==>
  let r = SND (ctrl_monitor w.wc.ctrl_monitor
               w.wc.const_names w.wc.sensor_names w.wc.ctrlplus_names
               w.ws.const_vals w.ws.sensor_vals ls
               w.wc.ctrlfixed_names w.wc.ctrlfixed_rhs (get_default w)) in
  ctrl_sat w.wc w.ws r ∧
  LENGTH r = LENGTH w.wc.ctrl_names`,
  rw[ctrl_monitor_def,ctrl_sat_def,wfsem_bi_val_def,good_default_def,get_default_def]>>
  EVERY_CASE_TAC>>fs[get_default_def,get_fixed_def]>>
  fs[wf_config_def,wf_mach_def]>>
  fs[evaluate_default_def]);

val comp_eq = [mach_component_equality,
               mach_config_component_equality,
               mach_state_component_equality,
               mach_oracle_component_equality];

val ctrl_monitor_1shot_spec = Q.store_thm("ctrl_monitor_1shot_spec",`
  ∀w const_valsv sensor_valsv.
    (* These specify what the inputs should be *)
    MONITORPROG_FML_TYPE w.wc.ctrl_monitor fv ∧
    LIST_TYPE CLSTRING_TYPE w.wc.const_names const_namesv ∧
    LIST_TYPE CLSTRING_TYPE w.wc.sensor_names sensor_namesv ∧
    LIST_TYPE CLSTRING_TYPE w.wc.ctrlplus_names ctrlplus_namesv ∧
    LIST_TYPE CLSTRING_TYPE w.wc.ctrlfixed_names ctrlfixed_namesv ∧
    LIST_TYPE (SUM_TYPE WORD32 CLSTRING_TYPE) w.wc.ctrlfixed_rhs ctrlfixed_rhsv ∧
    LIST_TYPE MONITORPROG_TRM_TYPE w.wc.default defaultv ∧
    good_default w ∧
    wf_config w.wc ∧
    w.wo.step_oracle 0
    ⇒
    app (p:'ffi ffi_proj) ^(fetch_v "ctrl_monitor_1shot" bot_st)
      [fv;const_namesv;sensor_namesv;ctrlplus_namesv;ctrlfixed_namesv;ctrlfixed_rhsv;defaultv]
    (IOBOT w)
    (POSTv uv.  &(UNIT_TYPE () uv) *
      SEP_EXISTS w' ctrl_vals.
      (* We can be more specific here, but the key property is that
         we enter a new state which extends the old by a single actuation step
         Moreover, that step is guraanteed to be ctrl_sat *)
      IOBOT w' *
      &(
        w'.tr = SNOC (w.ws,ctrl_vals) w.tr ∧
        ctrl_sat w.wc w.ws ctrl_vals))`,
  rw[]>>
  reverse (Cases_on`wf_mach w`) >- (simp[IOBOT_def]>>xpull)>>
  xcf "ctrl_monitor_1shot" bot_st>>
  fs[wf_config_def]>>
  rpt(xlet_auto>- (xsimpl>>metis_tac[]))>>
  qmatch_goalsub_abbrev_tac`IOBOT w'`>>
  fs[]>>
  drule good_default_IMP>>
  disch_then (qspec_then`vv` assume_tac)>>
  rfs[wf_config_def,get_default_def]>>
  qmatch_asmsub_abbrev_tac`PAIR_TYPE _ _ fls _`>>
  Cases_on`fls`>> fs[ml_translatorTheory.PAIR_TYPE_def]>>
  xmatch>>
  drule (GEN_ALL actuate_spec)>>
  disch_then drule>>
  disch_then(qspecl_then[`w'`,`p`] mp_tac)>>
  impl_tac>-
    fs[Abbr`w'`,wf_config_def]>>
  strip_tac>>
  xapp>>xsimpl>>
  rw[]>>
  qexists_tac`x`>>simp[Abbr`w'`]>>
  xsimpl);

(* Now we specify the looping control monitor *)

(* Instead of just assuming the 1shot controller,
   we now require the default controller to be satisfied in all
   sensor states *)

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

(* The controller monitor loop body's good mach propositions *)
val good_mach_def = Define`
  good_mach w ⇔
  good_default w ∧
  good_ctrl_trace w.wc w.tr`

*)

val has_next_spec = Q.store_thm("has_next_spec",`
    UNIT_TYPE u uv
    ⇒
    app (p:'ffi ffi_proj) ^(fetch_v "has_next" bot_st) [uv]
      (IOBOT w)
      (POSTv bv.
      IOBOT w *
      &BOOL (w.wo.step_oracle 0) bv)`,
  rw[]>>
  xcf "has_next" bot_st>>
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
(*
val ctrl_monitor_loop_body_spec = Q.store_thm("ctrl_monitor_loop_body_spec",`
  ∀w const_valsv sensor_valsv.
    (* These specify what the inputs should be *)
    MONITORPROG_FML_TYPE w.wc.ctrl_monitor fv ∧
    LIST_TYPE CLSTRING_TYPE w.wc.const_names const_namesv ∧
    LIST_TYPE CLSTRING_TYPE w.wc.sensor_names sensor_namesv ∧
    LIST_TYPE CLSTRING_TYPE w.wc.ctrlplus_names ctrlplus_namesv ∧
    LIST_TYPE CLSTRING_TYPE w.wc.ctrlfixed_names ctrlfixed_namesv ∧
    LIST_TYPE (SUM_TYPE WORD32 CLSTRING_TYPE) w.wc.ctrlfixed_rhs ctrlfixed_rhsv ∧
    LIST_TYPE WORD32 (get_default w) defaultv ∧
    LIST_TYPE WORD32 w.ws.const_vals const_valsv ∧
    LIST_TYPE WORD32 w.ws.sensor_vals sensor_valsv ∧
    wf_config w.wc ∧
    eventually ($~) w.wo.step_oracle
    ⇒
    app (p:'ffi ffi_proj) ^(fetch_v "ctrl_monitor_loop_body" bot_st)
      [fv;const_namesv;sensor_namesv;ctrlplus_namesv;
       ctrlfixed_namesv;ctrlfixed_rhsv;defaultv;
       const_valsv;sensor_valsv]
    (IOBOT w * &good_mach w)
    (POSTv uv.  &(UNIT_TYPE () uv) *
    SEP_EXISTS w'. IOBOT w' *
      &(good_mach w' ∧
        (* We can state stronger properties here, but they aren't that important *)
        ¬w'.wo.step_oracle 0 ∧
        w.wc = w'.wc))`,
  fs[eventually_def,PULL_EXISTS]>>
  completeInduct_on`n`>>rw[]>>
  xcf"ctrl_monitor_loop_body" bot_st>>
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
  reverse (Cases_on`wf_mach w`) >- (simp[IOBOT_def]>>xpull)>>
  fs[wf_config_def]>>
  rpt(xlet_auto >- (xsimpl>>metis_tac[]))>>
  qmatch_asmsub_abbrev_tac`PAIR_TYPE _ _ fls _`>>
  Cases_on`fls`>>   fs[ml_translatorTheory.PAIR_TYPE_def,markerTheory.Abbrev_def]>>
  xmatch>>
  fs[good_mach_def]>>drule good_default_IMP>>
  simp[]>>
  disch_then(qspec_then`vv` mp_tac)>>
  impl_tac>- fs[wf_config_def]>>
  strip_tac>>
  qpat_x_assum`(q,r) = _` (assume_tac o SYM)>>fs[]>>
  drule (GEN_ALL actuate_spec)>>simp[]>>
  rpt(disch_then drule)>>
  qmatch_goalsub_abbrev_tac`IOBOT w'`>>
  disch_then(qspecl_then[`w'`,`p`] mp_tac)>>
  impl_tac>-
    (fs[Abbr`w'`,good_mach_def,wf_config_def])>>
  strip_tac>>
  xlet`POSTv uv'.
            &UNIT_TYPE () uv' *
            SEP_EXISTS w''.
              IOBOT w'' *
              &(w''.tr = w.tr ⧺ [(w.ws,r)] ∧ w.wc = w''.wc ∧
                w.ws.const_vals = w''.ws.const_vals ∧
                w''.wo.step_oracle = (λn. w.wo.step_oracle (n + 1)))`
  >-
    (xapp>>xsimpl>>
    rw[]>>
    fs[Abbr`w'`]>>
    qexists_tac`x`>>xsimpl)>>
  fs[]>>
  rpt(xlet_auto>- ((TRY xcon)>>xsimpl))>>
  last_x_assum(qspec_then`n-1` mp_tac)>>simp[]>>
  impl_tac>-
    (Cases_on`n`>>fs[])>>
  disch_then drule >> simp[]>>
  fs[get_default_def]>>
  disch_then drule>>
  disch_then drule>>
  Cases_on`n`>>rfs[ADD1]>>
  strip_tac>>
  xapp>> xsimpl>>
  fs[good_mach_def,good_default_def,get_default_def]>>
  `∀sv. w''.ws with sensor_vals := sv =
     w.ws with sensor_vals := sv` by fs comp_eq>>
  rw[]>>TRY(metis_tac comp_eq)>>
  match_mp_tac good_ctrl_trace_SNOC>>
  metis_tac comp_eq);
*)

val violation_spec = Q.store_thm("violation_spec",`
  STRING_TYPE strng strngv
  ⇒
  app (p:'ffi ffi_proj) ^(fetch_v "violation" bot_st) [strngv]
    (IOBOT w)
    (POSTv uv. &(UNIT_TYPE () uv) * IOBOT w)`,
  rw[]>>
  xcf"violation"bot_st>>
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

val init_sat_def = Define`
  init_sat wc ws ⇔
  (wfsem wc.init
      (vars_to_state
      (wc.const_names ++ wc.sensor_names)
      (ws.const_vals ++ ws.sensor_vals)) = SOME T) ∧
  ∃ls. evaluate_default wc.const_names ws.const_vals wc.default = SOME ls`

(*
(* Finally, we can specify the full control monitor loop *)
val ctrl_monitor_loop_spec = Q.store_thm("ctrl_monitor_loop_spec",`
  (* These specify what the inputs should be *)
  MONITORPROG_FML_TYPE w.wc.init initv ∧
  MONITORPROG_FML_TYPE w.wc.ctrl_monitor fv ∧
  LIST_TYPE CLSTRING_TYPE w.wc.const_names const_namesv ∧
  LIST_TYPE CLSTRING_TYPE w.wc.sensor_names sensor_namesv ∧
  LIST_TYPE CLSTRING_TYPE w.wc.ctrlplus_names ctrlplus_namesv ∧
  LIST_TYPE CLSTRING_TYPE w.wc.ctrlfixed_names ctrlfixed_namesv ∧
  LIST_TYPE (SUM_TYPE WORD32 CLSTRING_TYPE) w.wc.ctrlfixed_rhs ctrlfixed_rhsv ∧
  LIST_TYPE MONITORPROG_TRM_TYPE w.wc.default defaultv ∧
  eventually ($~) w.wo.step_oracle ∧
  good_default w ∧
  wf_config w.wc ∧
  good_ctrl_trace w.wc w.tr
  ⇒
  app (p:'ffi ffi_proj) ^(fetch_v "ctrl_monitor_loop" bot_st)
    [initv;fv;const_namesv;sensor_namesv;ctrlplus_namesv;
     ctrlfixed_namesv;ctrlfixed_rhsv; defaultv]
  (IOBOT w)
  (POSTv uv.  &(UNIT_TYPE () uv) *
    SEP_EXISTS w'. IOBOT w' *
    &(
      (* Either the initial mach violates bounds immediately *)
      (w = w' ∧ ¬init_sat w.wc w.ws) ∨
      (* Or we transition to a final mach,
         and good_mach guarantees that the actuation trace all
         satisfy the control monitor *)
      good_mach w' ∧
      ¬w'.wo.step_oracle 0))`,
  rw[]>>
  xcf"ctrl_monitor_loop" bot_st>>
  rpt (xlet_auto >- xsimpl)>>
  xif
  >-
    (xapp>>xsimpl>>
    asm_exists_tac>>simp[]>>
    xsimpl>>fs[good_mach_def,get_default_def]>>rw[]>>
    qexists_tac`x`>>simp[]>>xsimpl)
  >>
  reverse (Cases_on`wf_mach w`)
  >-
    (simp[IOBOT_def]>>xpull)>>
  xapp >> xsimpl>>
  qexists_tac`emp`>>qexists_tac`w`>>xsimpl>>
  rw[]>>
  qexists_tac`w`>>fs[init_sat_def]>>
  fs[wfsem_bi_val_def]>>
  xsimpl>>every_case_tac>>fs[]);
*)

(* Finally, we add the plant monitor to get the full sandboxing monitor program *)
(*
  We now need an additional check that the plant states along
   the trace makes sense
*)
val plant_sat_def = Define`
  plant_sat wc (wspre,ctrlpre) ws ⇔
  wfsem wc.plant_monitor
    (vars_to_state
    (wc.const_names ++ wc.sensor_names   ++ wc.ctrl_names ++ wc.sensorplus_names)
    (ws.const_vals  ++ wspre.sensor_vals ++ ctrlpre ++ ws.sensor_vals)) = SOME T`

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


val mk_sandbox_loop_def = Define`
  mk_sandbox_loop wc = Loop (read_vars wc.sensor_names)`

val mk_sandbox_def = Define`
  mk_sandbox wc =
  Seq (read_vars wc.const_names) (mk_sandbox_loop wc)`



val monitor_loop_body_spec = Q.store_thm("monitor_loop_body_spec",`
  ∀w const_valsv sensor_valsv.
    (* These specify what the inputs should be *)
    INTERVALARITH_FML_TYPE w.wc.plant_monitor plantfv ∧
    INTERVALARITH_FML_TYPE w.wc.ctrl_monitor ctrlfv ∧
    LIST_TYPE CLSTRING_TYPE w.wc.const_names const_namesv ∧
    LIST_TYPE CLSTRING_TYPE w.wc.sensor_names sensor_namesv ∧
    LIST_TYPE CLSTRING_TYPE w.wc.ctrlplus_names ctrlplus_namesv ∧
    LIST_TYPE CLSTRING_TYPE w.wc.ctrl_names ctrl_namesv ∧
    LIST_TYPE CLSTRING_TYPE w.wc.sensorplus_names sensorplus_namesv ∧
    LIST_TYPE CLSTRING_TYPE w.wc.ctrlfixed_names ctrlfixed_namesv ∧
    LIST_TYPE (SUM_TYPE WORD32 CLSTRING_TYPE) w.wc.ctrlfixed_rhs ctrlfixed_rhsv ∧
    LIST_TYPE WORD32 (get_default w) defaultv ∧
    LIST_TYPE WORD32 w.ws.const_vals const_valsv ∧
    LIST_TYPE WORD32 w.ws.sensor_vals sensor_valsv ∧
    wf_config w.wc ∧
    state_rel w.wc w.ws st ∧
    eventually ($~) w.wo.step_oracle
    ⇒
    app (p:'ffi ffi_proj) ^(fetch_v "monitor_loop_body" bot_st)
      [plantfv;ctrlfv;
      const_namesv;sensor_namesv;ctrlplus_namesv;ctrl_namesv;sensorplus_namesv;
      ctrlfixed_namesv; ctrlfixed_rhsv; defaultv;
      const_valsv;sensor_valsv]
    (IOBOT w * &(good_plant_trace T w.wc w.tr w.ws) )
    (POSTv uv.  &(UNIT_TYPE () uv) *
      SEP_EXISTS w'. IOBOT w' *
      &((* Either we step to the end, or we reach the first plant violation *)
         (¬w'.wo.step_oracle 0 ∧
         (∃st'. state_rel w'.wc w'.ws st' ∧
          wpsem (mk_sandbox_loop w.wc) st st')
         ∨
         good_plant_trace F w'.wc w'.tr w'.ws) ∧
        w.wc = w'.wc))`,
  fs[eventually_def,PULL_EXISTS]>>
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
    xsimpl>>
    simp[mk_sandbox_loop_def]
    )
  >>
  reverse (Cases_on`wf_mach w`) >- (simp[IOBOT_def]>>xpull)>>
  fs[wf_config_def]>>
  rpt(xlet_auto>- (xsimpl>>metis_tac[]))>>
  qmatch_asmsub_abbrev_tac`PAIR_TYPE _ _ fls _`>>
  Cases_on`fls`>>   fs[ml_translatorTheory.PAIR_TYPE_def,markerTheory.Abbrev_def]>>
  xmatch>>
  fs[good_mach_def]>>
  drule good_default_IMP>>
  simp[]>>
  disch_then(qspec_then`vv` mp_tac)>>
  impl_tac>- fs[wf_config_def]>>
  strip_tac>>
  qpat_x_assum`(q,r) = _` (assume_tac o SYM)>>fs[]>>
  drule (GEN_ALL actuate_spec)>>simp[]>>
  rpt(disch_then drule)>>
  qmatch_goalsub_abbrev_tac`IOBOT w'`>>
  disch_then(qspecl_then[`w'`,`p`] mp_tac)>>
  impl_tac>-
    (fs[Abbr`w'`,good_mach_def,wf_config_def])>>
  strip_tac>>
  xlet`POSTv uv'.
            &UNIT_TYPE () uv' *
            SEP_EXISTS w''.
              IOBOT w'' *
              &(w''.tr = w.tr ⧺ [(w.ws,r)] ∧ w.wc = w''.wc ∧
                w.ws.const_vals = w''.ws.const_vals ∧
                w''.wo.step_oracle = (λn. w.wo.step_oracle (n + 1)))`
  >-
    (xapp>>xsimpl>>
    rw[]>>
    fs[Abbr`w'`]>>
    qexists_tac`x`>>xsimpl)>>
  fs[]>>
  rpt(xlet_auto>- ((TRY xcon)>>xsimpl))>>
  reverse xif
  >-
    (xapp>>xsimpl>>
    qexists_tac`GC`>>qexists_tac`w''`>>xsimpl>>
    rw[]>>qexists_tac`w''`>>xsimpl>>
    fs[good_mach_def,good_default_def,get_default_def]>>
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
  fs[get_default_def]>>
  disch_then drule>>
  disch_then drule>>
  strip_tac>>
  rpt(xlet_auto>- (TRY(xcon)>>xsimpl))>>
  xapp>>
  xsimpl>>
  fs[good_mach_def,good_default_def,get_default_def]>>
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
  INTERVALARITH_FML_TYPE w.wc.init iv ∧
  INTERVALARITH_FML_TYPE w.wc.plant_monitor plantfv ∧
  INTERVALARITH_FML_TYPE w.wc.ctrl_monitor ctrlfv ∧
  LIST_TYPE CLSTRING_TYPE w.wc.const_names const_namesv ∧
  LIST_TYPE CLSTRING_TYPE w.wc.sensor_names sensor_namesv ∧
  LIST_TYPE CLSTRING_TYPE w.wc.ctrlplus_names ctrlplus_namesv ∧
  LIST_TYPE CLSTRING_TYPE w.wc.ctrl_names ctrl_namesv ∧
  LIST_TYPE CLSTRING_TYPE w.wc.sensorplus_names sensorplus_namesv ∧
  LIST_TYPE CLSTRING_TYPE w.wc.ctrlfixed_names ctrlfixed_namesv ∧
  LIST_TYPE (SUM_TYPE WORD32 CLSTRING_TYPE) w.wc.ctrlfixed_rhs ctrlfixed_rhsv ∧
  LIST_TYPE INTERVALARITH_TRM_TYPE w.wc.default defaultv ∧
  wf_config w.wc ∧
  eventually ($~) w.wo.step_oracle ∧
  state_rel w.wc w.ws st ∧
  (* Alternatively, if w.tr = [] then these two are true *)
  good_plant_trace T w.wc w.tr w.ws
  ⇒
  app (p:'ffi ffi_proj) ^(fetch_v "monitor_loop" bot_st)
    [iv;plantfv;ctrlfv;const_namesv;sensor_namesv;ctrlplus_namesv;ctrl_namesv;sensorplus_namesv;ctrlfixed_namesv;ctrlfixed_rhsv;defaultv]
  (IOBOT w)
  (POSTv uv. &(UNIT_TYPE () uv) *
    SEP_EXISTS w'. IOBOT w' *
    &(
      (* Either the initial mach violates init immediately *)
      (w = w' ∧ (¬init_sat w.wc w.ws)) ∨
      (* Or we transition to a final mach,
         and good_mach guarantees that the actuation trace all
         satisfy the control monitor *)
      (* good_mach w' ∧ *)
      (¬w'.wo.step_oracle 0 ∧
      (∃st'. state_rel w'.wc w'.ws st' ∧
      wpsem (mk_sandbox w.wc) st st') ∨
         good_plant_trace F w'.wc w'.tr w'.ws)))`,
  rw[]>>
  xcf"monitor_loop" bot_st>>
  rpt(xlet_auto >- xsimpl)>>
  pop_assum mp_tac>>
  qmatch_goalsub_abbrev_tac`evaluate_default cn cv def`>>
  Cases_on`evaluate_default cn cv def`>>
  fs[OPTION_TYPE_def]>>strip_tac>>
  xmatch
  >-
    (reverse (Cases_on`wf_mach w`)
    >-
      (simp[IOBOT_def]>>xpull)>>
    xapp >> xsimpl>>
    qexists_tac`emp`>>qexists_tac`w`>>xsimpl>>
    rw[]>>xsimpl>>
    qexists_tac`w`>>fs[init_sat_def]>>
    xsimpl)
  >>
  rpt(xlet_auto >- xsimpl)>>
  reverse xif
  >-
    (* init violated *)
    (reverse (Cases_on`wf_mach w`)
    >-
      (simp[IOBOT_def]>>xpull)>>
    rpt (xlet_auto >- (TRY(xcon)>>xsimpl))>>
    xapp >> xsimpl>>
    qexists_tac`emp`>>qexists_tac`w`>>xsimpl>>
    rw[]>>xsimpl>>
    qexists_tac`w`>>fs[init_sat_def]>>
    fs[wfsem_bi_val_def]>>
    xsimpl>>every_case_tac>>fs[])
  >>
    xapp>>xsimpl>>
    asm_exists_tac>>simp[]>>
    xsimpl>>fs[good_mach_def,get_default_def]>>
    simp[good_ctrl_trace_def,good_plant_trace_def]>>
    rw[]
    >-
      (fs[init_sat_def,wfsem_bi_val_def]>>
      EVERY_CASE_TAC>>fs[]>>
      asm_exists_tac>>xsimpl)
    >>
      qexists_tac`x`>>simp[]>>xsimpl);

val _ = export_theory();
