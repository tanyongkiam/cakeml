open preamble ml_progLib ml_translatorLib
     basisFunctionsLib basis_ffiLib
     cfTacticsLib cfLetAutoLib
     monitorProgTheory ctrl_monitor_1shotProgTheory
open cfHeapsBaseTheory

(*
  Defines and verifies a looping controller monitor + wrapper
*)

val _ = new_theory "ctrl_monitor_loopProg";

val _ = translation_extends "ctrl_monitor_1shotProg";

(* Checks if there is a next transition *)
val has_next = process_topdecs`
  fun has_next () =
  let val arr = (Word8Array.array 1 (Word8.fromInt 0))
      val u = #(has_next) "" arr
  in
    Word8Array.sub arr 0 <> Word8.fromInt 0
  end`

val _ = append_prog has_next;

val ctrl_monitor_loop_body = process_topdecs`
  fun ctrl_monitor_loop_body ctrl_phi const_names sensor_names ctrl_names default
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
    val sensor_ls = get_sensor sensor_names
    val u = Runtime.fullGC()
    in
      ctrl_monitor_loop_body ctrl_phi const_names sensor_names ctrl_names default
                    const_ls sensor_ls
    end
  end
  else
    ()`

val _ = append_prog ctrl_monitor_loop_body;

val violation = process_topdecs`
  fun violation str =
  let val arr = (Word8Array.array 0 (Word8.fromInt 0))
  in
    (#(violation) str arr ; ())
  end`

val _ = append_prog violation;

val ctrl_monitor_loop = process_topdecs`
  fun ctrl_monitor_loop init_phi ctrl_phi
              const_names sensor_names ctrl_names default =
  (* First read the constants and initial state *)
  let val const_ls = get_const const_names
      val sensor_ls = get_sensor sensor_names
      val names_ls = List.append const_names sensor_names
      val st_ls = List.append const_ls sensor_ls
  in
    if
      wfsem_bi_val init_phi (vars_to_state names_ls st_ls)
    then
      ctrl_monitor_loop_body ctrl_phi
              const_names sensor_names ctrl_names default
              const_ls sensor_ls
    else
      violation "Init Violation"
  end`

val _ = append_prog ctrl_monitor_loop;

(*
  The world model has three parts:
   - The world_config is immutable, and visible to our program
   - The world_state is unknown, and gets seen by the FFI
   - The world_oracle gives the oracle transitions
  We also include some extra fields for the plant monitor later
  This reduces the amount of duplication
*)

val _ = Datatype`
  world_config = <|
    const_names        : mlstring list;
    sensor_pre_names   : mlstring list; (* This is unused for now *)
    sensor_names       : mlstring list;
    ctrl_names         : mlstring list;
    init               : fml;
    ctrl_monitor       : fml;
    plant_monitor      : fml            (* This is unused for now *)
  |>`

val _ = Datatype`
  world_state = <|
    const_vals   : word32 list; (* Fixed constants *)
    sensor_vals  : word32 list;
    |>`

val _ = Datatype`
  world_oracle = <|
    (* Returns the next control decision when given some input words *)
    ctrl_oracle   : num -> word32 list -> word32 list;
    (* Returns the new observable sensor values when given the current
       world state and control decision *)
    transition_oracle : num -> (world_state # word32 list) -> word32 list;
    (* Returns whether we are allowed to take a next step *)
    step_oracle   : num -> bool;
  |>`

(* We track the trace of actuations *)
val _ = Datatype`
  world = <| wc : world_config ;
             ws : world_state  ;
             wo : world_oracle ;
             tr : (world_state # word32 list) list|>`

val ffi_get_const_def = Define`
  ffi_get_const (conf:word8 list) (bytes:word8 list) (st:world) =
  if LENGTH bytes = 4 * LENGTH st.wc.const_names
  then
    SOME (w32_to_w8 st.ws.const_vals,st)
  else
    NONE`

val ffi_get_sensor_def = Define`
  ffi_get_sensor (conf:word8 list) (bytes:word8 list) (st:world) =
  if LENGTH bytes = 4 * LENGTH st.wc.sensor_names
  then
    SOME (w32_to_w8 st.ws.sensor_vals,st)
  else
    NONE`

val ffi_get_control_def = Define`
  ffi_get_control (conf:word8 list) (bytes:word8 list) (st:world) =
  if LENGTH conf = 4 * (LENGTH st.wc.const_names + LENGTH st.wc.sensor_names) ∧
     LENGTH bytes = 4 * LENGTH st.wc.ctrl_names
  then
    let w32s = w8_to_w32 bytes in
    let wo = st.wo in
    let (cur_oracle,next_oracle) = get_oracle wo.ctrl_oracle in
    let w8s = w32_to_w8 (cur_oracle w32s) in
    let new_wo = wo with ctrl_oracle := next_oracle in
    SOME (w8s,st with wo := new_wo)
  else NONE`

val ffi_actuate_def = Define`
  ffi_actuate (conf:word8 list) (bytes:word8 list) (st:world) =
  if LENGTH bytes = 4 * (LENGTH st.wc.ctrl_names)
  then
    let ws = st.ws in
    let wo = st.wo in
    let ctrl = w8_to_w32 bytes in
    let (cur_transition_oracle,next_transition_oracle) = get_oracle wo.transition_oracle in
    let (cur_step_oracle,next_step_oracle) = get_oracle wo.step_oracle in
    if cur_step_oracle
    then
      (* Transition to the new world state *)
      let new_ws = ws with <|sensor_vals := cur_transition_oracle (ws,ctrl)|> in
      let new_wo = wo with <|transition_oracle := next_transition_oracle;
                             step_oracle       := next_step_oracle|> in
        SOME(bytes, st with <|wo := new_wo ; ws := new_ws ; tr := SNOC (ws,ctrl) st.tr|>)
    else
       NONE
  else NONE`

val ffi_has_next_def = Define`
  ffi_has_next (conf:word8 list) (bytes:word8 list) (st:world) =
  if LENGTH bytes = 1
  then
    if st.wo.step_oracle 0 then
      SOME([1w:word8], st)
    else
      SOME([0w:word8],st)
  else
    NONE`

val ffi_violation_def = Define`
  ffi_violation (conf:word8 list) (bytes:word8 list) (st:world) =
  if LENGTH bytes = 0
  then
    SOME(bytes, st)
  else
    NONE`

val comp_eq = map theorem ["world_component_equality",
                           "world_config_component_equality",
                           "world_state_component_equality",
                           "world_oracle_component_equality"];

val encode_world_config_def = Define`
  encode_world_config wc =
   Cons (List (MAP (Str o explode) wc.const_names))
   (Cons (List (MAP (Str o explode) wc.sensor_pre_names))
   (Cons (List (MAP (Str o explode) wc.sensor_names))
   (Cons (List (MAP (Str o explode) wc.ctrl_names))
   (Cons (encode_fml wc.init)
   (Cons (encode_fml wc.ctrl_monitor)
   (encode_fml wc.plant_monitor))))))`

val encode_world_config_11 = Q.prove(`
  encode_world_config x = encode_world_config y ⇔
  x = y`,
  fs[encode_world_config_def]>>
  rw[EQ_IMP_THM]>>fs comp_eq>>
  fs[MAP_Str_explode_11,encode_fml_11]);

val encode_word32_list_inner_def = Define`
  encode_word32_list_inner = iList o (MAP (iStr o w2s 2 CHR))`

val encode_world_state_def = Define`
  encode_world_state ws =
  Cons (encode_word32_list ws.const_vals)
  (encode_word32_list ws.sensor_vals)`

(* This is a bit special: we will use the inner type as well *)
val encode_world_state_inner_def = Define`
  encode_world_state_inner ws =
  iCons (encode_word32_list_inner ws.const_vals)
  (encode_word32_list_inner ws.sensor_vals)`

val encode_world_state_11 = Q.prove(`
  encode_world_state x = encode_world_state y ⇔
  x = y`,
  rw[encode_world_state_def]>>fs comp_eq>>
  metis_tac[encode_word32_list_11]);

val encode_word32_list_inner_11 = Q.prove(`
  !x y. encode_word32_list_inner x = encode_word32_list_inner y <=> x = y`,
  Induct \\ Cases_on `y`
  \\ fs [encode_word32_list_inner_def]
  \\ metis_tac[w2sCHR_11]);

val encode_world_state_inner_11 = Q.prove(`
  encode_world_state_inner x =
  encode_world_state_inner y <=>
  x = y`,
  rw[encode_world_state_inner_def]>>fs comp_eq>>
  metis_tac[encode_word32_list_inner_11]);

val decode_encode_world_state_inner = new_specification("decode_encode_world_state_inner",["decode_world_state_inner"],
  prove(``?decode. !cls. decode (encode_world_state_inner cls) = SOME cls``,
        qexists_tac `\f. some c. encode_world_state_inner c = f` \\ fs [encode_world_state_inner_11]));
val _ = export_rewrites ["decode_encode_world_state_inner"];

val encode_step_oracle_def = Define`
  encode_step_oracle step_oracle =
    Fun (λnum:ffi_inner.
      Num (if step_oracle (get_num num) then 1 else 0))`

val encode_step_oracle_11 = Q.prove(`
  encode_step_oracle x = encode_step_oracle y ==>
  x = y`,
  rw[]>>fs[FUN_EQ_THM,encode_step_oracle_def]>>rw[]>>
  pop_assum(qspec_then`iNum x'` assume_tac)>>fs[get_num_def]>>
  every_case_tac>>fs[]);

val get_st_ctrl_pair_def = Define`
  (get_st_ctrl_pair (iCons st ctrl) =
    case decode_world_state_inner st of
      NONE => ARB
    | SOME st => (st, get_word32_list ctrl)) ∧
  (get_st_ctrl_pair _ = ARB)`

(* This is a bit strange... *)
val encode_transition_oracle_def = Define`
  encode_transition_oracle transition_oracle =
    Fun (λnum:ffi_inner.
    Fun (λstpr:ffi_inner.
    encode_word32_list (transition_oracle (get_num num) (get_st_ctrl_pair stpr))))`

val encode_transition_oracle_11 = Q.prove(`
  encode_transition_oracle f = encode_transition_oracle f' ==>
  f = f'`,
  rw[encode_transition_oracle_def]>>
  fs[FUN_EQ_THM]>>
  rw[]>>
  Cases_on`x'`>>
  pop_assum (qspecl_then[`iNum x`,`iCons (encode_world_state_inner q) (encode_word32_list_inner r)`] assume_tac)>>
  fs[get_num_def,get_st_ctrl_pair_def,get_word32_list_def,encode_word32_list_inner_def]>>
  fs[MAP_MAP_o,o_DEF,get_word32_def]>>
  `∀x:word32. s2w 2 ORD (w2s 2 CHR x)= x` by
     (rw[]>>match_mp_tac s2w_w2s>>fs[])>>
  fs[]>>
  metis_tac[encode_word32_list_11]);

val encode_world_oracle_def = Define`
  encode_world_oracle wo =
  Cons (encode_ctrl_oracle wo.ctrl_oracle)
  (Cons (encode_transition_oracle wo.transition_oracle)
  (encode_step_oracle wo.step_oracle))`

val encode_world_oracle_11 = Q.prove(`
  encode_world_oracle x = encode_world_oracle y ⇔
  x = y`,
  fs[encode_world_oracle_def]>>rw[EQ_IMP_THM]>>
  fs comp_eq>>
  metis_tac[encode_transition_oracle_11,encode_ctrl_oracle_11,encode_step_oracle_11]);

val encode_def = Define`
  encode w =
   Cons (encode_world_config w.wc)
  (Cons (encode_world_state w.ws)
  (Cons (encode_world_oracle w.wo)
  (List
    (MAP (λ(st,ws). Cons (encode_world_state st) (encode_word32_list ws)) w.tr))))`

val encode_11 = Q.store_thm("encode_11",`
  ∀w w'.
  encode w' = encode w <=> w' = w`,
  fs[encode_def]>>
  rw[EQ_IMP_THM]>>fs comp_eq>>
  fs[encode_world_config_11,encode_world_state_11,encode_world_oracle_11]>>
  rfs[LIST_EQ_REWRITE,EL_MAP]>>rw[]>>
  fs[EL_MAP]>>
  res_tac>>fs[]>>
  pairarg_tac>>fs[]>>
  pairarg_tac>>fs[]>>
  metis_tac[encode_world_state_11,encode_word32_list_11]);

val decode_encode = new_specification("decode_encode",["decode"],
  prove(``?decode. !cls. decode (encode cls) = SOME cls``,
        qexists_tac `\f. some c. encode c = f` \\ fs [encode_11]));
val _ = export_rewrites ["decode_encode"];

val bot_ffi_part_def = Define`
  bot_ffi_part =
    (encode,decode,
      [("get_const",ffi_get_const);
       ("get_sensor",ffi_get_sensor);
       ("get_ctrl",ffi_get_control);
       ("actuate",ffi_actuate);
       ("has_next",ffi_has_next);
       ("violation",ffi_violation);
       ])`;

(* The control choice is good w.r.t. to a world state *)
val ctrl_sat_def = Define`
  ctrl_sat wc ws ctrl ⇔
  wfsem wc.ctrl_monitor
    (vars_to_state
    (wc.const_names ++ wc.sensor_names ++ wc.ctrl_names)
    (ws.const_vals  ++ ws.sensor_vals  ++ ctrl)) = SOME T`

(* The init state is good *)
val init_sat_def = Define`
  init_sat wc ws ⇔
  wfsem wc.init
      (vars_to_state
      (wc.const_names ++ wc.sensor_names)
      (ws.const_vals ++ ws.sensor_vals)) = SOME T`

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

val bot_st = get_ml_prog_state();

val IOBOT_def = Define `
  IOBOT w = IOx bot_ffi_part w * &wf_world w`

val get_const_spec = Q.store_thm("get_const_spec",`
    ∀w vs.
    LIST_TYPE STRING_TYPE w.wc.const_names vs
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
      map_every qexists_tac [`&wf_world w`, `s`, `s`, `u`, `ns`] >>
      unabbrev_all_tac>>
      xsimpl >>
      simp[mk_ffi_next_def,ffi_get_const_def])
    >>
    xapp>>xsimpl>>
    simp[w8_to_w32_w32_to_w8]);

val get_sensor_spec = Q.store_thm("get_sensor_spec",`
    ∀w vs.
    LIST_TYPE STRING_TYPE w.wc.sensor_names vs
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
      map_every qexists_tac [`&wf_world w`, `s`, `s`, `u`, `ns`] >>
      unabbrev_all_tac>>
      xsimpl >>
      simp[mk_ffi_next_def,ffi_get_sensor_def])
    >>
    xapp>>xsimpl>>
    simp[w8_to_w32_w32_to_w8])

val get_ctrl_spec = Q.store_thm("get_ctrl_spec",`
    ∀w vs constv sensorv.
    LIST_TYPE STRING_TYPE w.wc.ctrl_names vs ∧
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

(*
val ctrl_monitor_spec = Q.store_thm("ctrl_monitor_spec",`
    (* These specify what the inputs should be *)
    MONITORPROG_FML_TYPE w.wc.ctrl_monitor fv ∧
    LIST_TYPE STRING_TYPE w.wc.const_names const_namesv ∧
    LIST_TYPE STRING_TYPE w.wc.sensor_names sensor_namesv ∧
    LIST_TYPE STRING_TYPE w.wc.ctrl_names ctrl_namesv ∧
    LIST_TYPE WORD32 w.ws.const_vals const_valsv ∧
    LIST_TYPE WORD32 w.ws.sensor_vals sensor_valsv
    ⇒
    app (p:'ffi ffi_proj) ^(fetch_v "ctrl_monitor" bot_st)
      [fv;const_namesv;sensor_namesv;ctrl_namesv;const_valsv;sensor_valsv]
    (IOBOT w)
    (POSTv optv.
      IOBOT (w with
        wo := w.wo with ctrl_oracle := (λn. w.wo.ctrl_oracle (n + 1))) *
      SEP_EXISTS opt.
        &(OPTION_TYPE (LIST_TYPE WORD32) opt optv ∧
         case opt of NONE => T
         | SOME ctrl =>
           ctrl_sat w.wc w.ws ctrl))`,
    rw[]>>
    xcf "ctrl_monitor" bot_st>>
    drule get_ctrl_spec>>
    rpt(disch_then drule)>>
    strip_tac>>
    xlet_auto >- (xsimpl>>metis_tac[])>>
    rpt(xlet_auto>- ((TRY xcon)>>xsimpl))>>
    qmatch_goalsub_abbrev_tac`IOBOT w'`>>
    qabbrev_tac`x0 = [w.ws.const_vals;w.ws.sensor_vals;vv]`>>
    xlet`POSTv v. IOBOT w' * &LIST_TYPE WORD32 (FLAT x0) v`
    >-
      (xapp_spec (ListProgTheory.flat_v_thm |> INST_TYPE [alpha |-> ``:word32``])>>
      xsimpl>>
      qexists_tac`x0`>>simp[]>>
      qexists_tac`WORD32`>>simp[ml_translatorTheory.LIST_TYPE_def,Abbr`x0`])
    >>
    rpt(xlet_auto>- ((TRY xcon)>>xsimpl))>>
    qabbrev_tac`x1 = [w.wc.const_names;w.wc.sensor_names;w.wc.ctrl_names]`>>
    xlet`POSTv v. IOBOT w' * &LIST_TYPE STRING_TYPE (FLAT x1) v`
    >-
      (xapp_spec (ListProgTheory.flat_v_thm |> INST_TYPE [alpha |-> ``:mlstring``])>>
      xsimpl>>
      qexists_tac`x1`>>simp[]>>
      qexists_tac`STRING_TYPE`>>simp[ml_translatorTheory.LIST_TYPE_def,Abbr`x1`])
    >>
    rpt(xlet_auto >- xsimpl)>>
    reverse xif
    >-
      (xcon>>xsimpl>>
      qexists_tac`NONE`>>
      simp[ml_translatorTheory.OPTION_TYPE_def])>>
    xcon>>xsimpl>>
    fs[ctrl_sat_def,wfsem_bi_val_def]>>
    pop_assum mp_tac>> TOP_CASE_TAC>>fs[]>>
    strip_tac>>qexists_tac`SOME vv`>>
    simp[ml_translatorTheory.OPTION_TYPE_def]);
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

(* The trace of actuations are all good *)
val good_trace_def = Define`
  (good_trace wc [] <=> T) ∧
  (good_trace wc ((ws,ctrl)::xs) <=>
    ctrl_sat wc ws ctrl)`

val good_trace_SNOC = Q.store_thm("good_trace_SNOC",`
  ∀tr.
  good_trace wc tr ∧
  ctrl_sat wc ws vals
  ⇒
  good_trace wc (SNOC (ws,vals) tr)`,
  Induct>>fs[good_trace_def]>>rw[]>>Cases_on`h`>>fs[good_trace_def]);

(* eventually on oracle sequences *)
val eventually_def = Define`
  eventually P oracle ⇔
  ∃n.
    P(oracle n)`

val actuate_spec = Q.store_thm("actuate_spec",`
    LIST_TYPE WORD32 ctrl_vals ctrlv ∧
    STRING_TYPE strng strngv ∧
    LENGTH ctrl_vals = LENGTH w.wc.ctrl_names ∧
    ctrl_sat w.wc w.ws ctrl_vals ∧
    w.wo.step_oracle 0 ∧
    ¬w.wo.step_oracle n ∧
    good_trace w.wc w.tr
    ⇒
    app (p:'ffi ffi_proj) ^(fetch_v "actuate" bot_st) [strngv;ctrlv]
     (IOBOT w )
     (* We could be more precise and also talk about the oracles
        but this characterization is all we need here *)
     (POSTv u. (SEP_EXISTS av. W8ARRAY av (w32_to_w8 ctrl_vals)) *
     SEP_EXISTS w'. IOBOT w'  *
     &(good_trace w'.wc w'.tr ∧
      w'.tr = SNOC (w.ws,ctrl_vals) w.tr ∧
      w.wc = w'.wc ∧
      w.ws.const_vals = w'.ws.const_vals ∧
      ¬w'.wo.step_oracle (n-1)))`,
    rw[]>>
    xcf"actuate" bot_st>>
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
    rw[] >-
      (match_mp_tac good_trace_SNOC>>simp[])>>
    Cases_on`n`>>fs[ADD1]);

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

(* Good world propositions *)
val good_world_def = Define`
  good_world def w ⇔
  good_default def w ∧
  good_trace w.wc w.tr ∧
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
    app (p:'ffi ffi_proj) ^(fetch_v "ctrl_monitor_loop_body" bot_st)
      [fv;const_namesv;sensor_namesv;ctrl_namesv;defv;const_valsv;sensor_valsv]
    (IOBOT w * &good_world def w )
    (POSTv u. SEP_EXISTS w'. IOBOT w' *
      &(good_world def w' ∧
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
  last_x_assum(qspec_then`n-1` mp_tac)>>simp[]>>
  impl_tac>-
    (Cases_on`n`>>fs[])>>
  disch_then drule >> simp[]>>
  disch_then drule>>
  disch_then drule>>
  strip_tac>>
  xapp>>
  xsimpl>>
  fs[good_world_def,good_default_def,const_ok_def]>>
  `∀sv. w''.ws with sensor_vals := sv =
     w.ws with sensor_vals := sv` by fs comp_eq>>
  metis_tac comp_eq);

val violation_spec = Q.store_thm("violation_spec",`
  STRING_TYPE strng strngv
  ⇒
  app (p:'ffi ffi_proj) ^(fetch_v "violation" bot_st) [strngv]
    (IOBOT w)
    (POSTv u. IOBOT w)`,
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

(* Finally, we can specify the full control monitor *)
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
  good_trace w.wc w.tr
  ⇒
  app (p:'ffi ffi_proj) ^(fetch_v "ctrl_monitor_loop" bot_st)
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
  xcf"ctrl_monitor_loop" bot_st>>
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

val _ = export_theory();
