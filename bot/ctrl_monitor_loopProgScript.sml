open preamble ml_progLib ml_translatorLib
     basisFunctionsLib basis_ffiLib
     cfTacticsLib cfLetAutoLib
     monitorProgTheory ctrl_monitor_1shotProgTheory
open cfHeapsBaseTheory

(*
  Defines and verifies a controller monitor + wrapper

  Many of the functions will get new specifications later,
  when we model the world more carefully
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
      #(init_violation) "" (Word8Array.array 0 (Word8.fromInt 0))
  end`

val _ = append_prog ctrl_monitor_loop;

(*
  The world model here introduces oracles
  It has three parts:
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
    step         : bool       ; (* Whether we could still take a transition *)
    |>`

(* Sequences of world oracles TODO: currently unencodable *)
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

val get_oracle_def = Define`
  get_oracle f = (f 0n,λn. f (n+1))`

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
    (* Transition to the new world state *)
    let new_ws = ws with <|sensor_vals := cur_transition_oracle (ws,ctrl);
                           step        := cur_step_oracle|> in
    let new_wo = wo with <|transition_oracle := next_transition_oracle;
                           step_oracle       := next_step_oracle|> in
      SOME(bytes, st with <|wo := new_wo ; ws := new_ws ; tr := SNOC (ws,ctrl) st.tr|>)
  else NONE`

val ffi_has_next_def = Define`
  ffi_has_next (conf:word8 list) (bytes:word8 list) (st:world) =
  if LENGTH bytes = 1
  then
    if st.ws.step then
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

(* Encode world into the FFI type *)
val encode_def = Define`
  encode (w:world) = ARB:ffi`

val decode_def = Define`
  decode foo = some w. encode w = foo`

val comp_eq = map theorem ["world_component_equality",
                           "world_config_component_equality",
                           "world_state_component_equality",
                           "world_oracle_component_equality"];

val INJ_Str_explode = Q.prove(`
  INJ (Str o explode) UNIV UNIV`,
  rw[INJ_DEF]>>metis_tac[mlstringTheory.explode_11]);

val encode_11 = Q.prove(`
  ∀w w'.
  encode w' = encode w ⇒
  w' = w`,cheat);

val decode_encode = Q.store_thm("decode_encode[simp]",
  `decode (encode (w:world)) = SOME w`,
  simp[decode_def,some_def]>>rw[]>- metis_tac[]>>
  match_mp_tac SELECT_UNIQUE>>
  rw[]>>
  metis_tac[encode_11]);

val bot_ffi_part_def = Define`
  bot_ffi_part =
    (encode,decode,
      [("get_const",ffi_get_const);
       ("get_sensor",ffi_get_sensor);
       ("get_ctrl",ffi_get_control);
       ("actuate",ffi_actuate);
       ("has_next",ffi_has_next);
       ("init_violation",ffi_violation);
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
      &BOOL (w.ws.step) bv)`,
  rw[]>>
  xcf "has_next" bot_st>>
  fs[ml_translatorTheory.UNIT_TYPE_def]>>
  xmatch>>
  rpt(xlet_auto >- xsimpl)>>
  xlet `POSTv u.
         IOBOT w *
         W8ARRAY v' (if w.ws.step then [1w:word8] else [0w])`
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
    ctrl_sat wc ws ctrl ∧
    ws.step = T)`


val good_trace_SNOC = Q.store_thm("good_trace_SNOC",`
  ∀tr.
  good_trace wc tr ∧
  ctrl_sat wc ws vals ∧ ws.step
  ⇒
  good_trace wc (SNOC (ws,vals) tr)`,
  Induct>>fs[good_trace_def]>>rw[]>>Cases_on`h`>>fs[good_trace_def]);

val LEAST_STOP_def = Define`
  LEAST_STOP w =
    (LEAST n. ¬w.wo.step_oracle n) + (if w.ws.step then 1 else 0)`

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
    w.ws.step ∧
    ¬w.wo.step_oracle n ∧
    good_trace w.wc w.tr
    ⇒
    app (p:'ffi ffi_proj) ^(fetch_v "actuate" bot_st) [strngv;ctrlv]
     (IOBOT w )
     (* Could be more precise, but we don't need that .. *)
     (POSTv u. (SEP_EXISTS av. W8ARRAY av (w32_to_w8 ctrl_vals)) *
     SEP_EXISTS w'. IOBOT w'  *
     &(good_trace w'.wc w'.tr ∧
      w.wc = w'.wc ∧
      w.ws.const_vals = w'.ws.const_vals ∧
      if n = 0 then ¬w'.ws.step else ¬w'.wo.step_oracle (n-1)))`,
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
    fs[Abbr`ww`,wf_world_def,LEAST_STOP_def,w8_to_w32_w32_to_w8]>>
    rw[] >-
      (match_mp_tac good_trace_SNOC>>simp[])>>
    fs[]);

val good_default_def = Define`
  good_default default w ⇔
  (* Any valuation satisfying the const and sensor lengths *)
  let def_ctrl = default w.ws.const_vals w.ws.sensor_vals in
  LENGTH def_ctrl = LENGTH w.wc.ctrl_names ∧
  ctrl_sat w.wc w.ws def_ctrl`

val good_default_IMP = Q.prove(`
  ∀ls.
  good_default def w ∧
  LENGTH ls = LENGTH w.wc.ctrl_names ==>
  let r = SND (ctrl_monitor w.wc.ctrl_monitor
               w.wc.const_names w.wc.sensor_names w.wc.ctrl_names
               w.ws.const_vals w.ws.sensor_vals ls
               def) in
  ctrl_sat w.wc w.ws r ∧
  LENGTH r = LENGTH w.wc.ctrl_names`,
  rw[ctrl_monitor_def,ctrl_sat_def,wfsem_bi_val_def,good_default_def]>>
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
    eventually ($~) w.wo.step_oracle ∧
    good_default def w
    ⇒
    app (p:'ffi ffi_proj) ^(fetch_v "ctrl_monitor_loop_body" bot_st)
      [fv;const_namesv;sensor_namesv;ctrl_namesv;defv;const_valsv;sensor_valsv]
    (IOBOT w * &good_trace w.wc w.tr )
    (POSTv u. SEP_EXISTS w'. IOBOT w' *
      &(good_trace w'.wc w'.tr  ∧ ¬w'.ws.step ∧
        w.wc = w'.wc))`,
  fs[eventually_def,PULL_EXISTS]>>
  (* TODO: seems awkward, maybe there's a better setup?? *)
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
  drule get_ctrl_spec >>
  rpt(disch_then drule)>>
  strip_tac>>
  xlet_auto>- (xsimpl>>metis_tac[])>>
  xlet_auto >- xsimpl>>
  qmatch_asmsub_abbrev_tac`PAIR_TYPE _ _ fls _`>>
  Cases_on`fls`>>   fs[ml_translatorTheory.PAIR_TYPE_def,markerTheory.Abbrev_def]>>
  xmatch>>
  drule good_default_IMP>>
  disch_then drule>>rw[]>>fs[]>>
  qpat_x_assum`(q,r) = _` (assume_tac o SYM)>>fs[]>>
  drule (GEN_ALL actuate_spec)>>simp[]>>
  rpt(disch_then drule)>>
  qmatch_goalsub_abbrev_tac`IOBOT w'`>>
  disch_then(qspecl_then[`w'`,`p`,`n`] mp_tac)>>
  impl_tac>- fs[Abbr`w'`]>>
  strip_tac>>
  xlet_auto
  >-
    (xsimpl>>rw[]>>qexists_tac`x'`>>qexists_tac`x`>>xsimpl)>>
  fs comp_eq>>rw[]>>
  drule get_sensor_spec>>
  strip_tac>>
  xlet_auto>- xsimpl>>
  rpt(xlet_auto>- ((TRY xcon)>>xsimpl))>>
  Cases_on`n=0`>>fs[]
  >-
    cheat
  >>
  first_x_assum(qspec_then`n-1` mp_tac)>>simp[]>>
  disch_then drule >> simp[]>>
  disch_then drule>>
  disch_then drule>>
  impl_tac>-
    (* good_default_def is wrong *)
    (fs[good_default_def]>>cheat)>>
  strip_tac>>
  xapp >> xsimpl>>rw[]>>
  qexists_tac`x`>>xsimpl);

(* test compilation *)
val reval = rconc o EVAL;

val Apps_def = tDefine "Apps" `
  (Apps [x;y] = App Opapp [x;y]) /\
  (Apps [] = ARB) /\
  (Apps xs = App Opapp [Apps (FRONT xs); LAST xs])`
  (WF_REL_TAC `measure LENGTH` \\ fs [LENGTH_FRONT]);

val init_fml_def = Define`
  init_fml = Leq (Const 0w) (Var (strlit"ep"))`

val cml_init_fml_th = translate init_fml_def;

val ctrl_fml_def = Define`
  ctrl_fml =
  Or
    (And (Leq (Times (Var (strlit"V")) (Var (strlit"ep"))) (Var (strlit"d")))
    (And (And (Leq (Const 0w) (Var (strlit"vpost"))) (Leq (Var (strlit"vpost")) (Var (strlit"V"))))
    (And (Leq (Const 0w) (Var (strlit"ep")))
    (And (Equals (Var (strlit"dpost")) (Var (strlit"d")))
         (Equals (Var (strlit"tpost")) (Const 0w))))))

    (And (Leq (Const 0w) (Var (strlit"ep")))
    (And (Equals (Var (strlit"dpost")) (Var (strlit"d")))
    (And (Equals (Var (strlit"vpost")) (Const 0w))
         (Equals (Var (strlit"tpost")) (Const 0w)))))`

val cml_ctrl_fml_th = translate ctrl_fml_def;

val const_vars_def = Define`
  const_vars = [strlit "V";strlit"ep"]`
val sensor_vars_def = Define`
  sensor_vars = [strlit"d";strlit"v";strlit"t"]`
val ctrl_vars_def = Define`
  ctrl_vars = [strlit"dpost";strlit"vpost";strlit"tpost"]`

val cml_const_th = translate const_vars_def;
val cml_sensor_th = translate sensor_vars_def;
val cml_ctrl_th = translate ctrl_vars_def;

(* The sensor that always returns d *)
val default_def = Define`
  default (const_ls:word32 list) (sense_ls:word32 list) =
  case sense_ls of
    [] => []
  | x::xs => [x; 0w:word32 ; 0w]`

val cml_default_th = translate default_def;

val main_body =
  process_topdecs`
  fun main_body u = ctrl_monitor_loop init_fml ctrl_fml const_vars sensor_vars ctrl_vars default`

val _ = append_prog main_body;

val main = reval ``Tdec (Dlet unknown_loc (Pvar "u") (Apps [Var (Short "main_body"); Con NONE []]))``

val (ML_code (ss,envs,vs,th)) = get_ml_prog_state ();

val prog = (rconc o EVAL) ``SNOC ^main ^(th |> concl |> strip_comb |> #2 |> el 3)``

val prog_def = Define`bot_prog = ^prog`;

open compilationLib

(* Produce .S files *)
val x64 = compile_x64 500 500 "bot_x64" prog_def;
val arm6 = compile_arm6 100 100 "bot_arm6" prog_def;

val _ = export_theory();
