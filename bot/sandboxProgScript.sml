open preamble ml_progLib ml_translatorLib
     basisFunctionsLib basis_ffiLib
     cfTacticsLib cfLetAutoLib
     monitorProgTheory
open cfHeapsBaseTheory

(*
  This defines the full monitoring program
*)
val _ = new_theory "sandboxProg";

val _ = translation_extends "monitorProg";

(* Reads the constants and returns it as a list *)
val get_const = process_topdecs`
  fun get_const const_names =
  let val const_vals = Word8Array.array (4 * List.length const_names) (Word8.fromInt 0)
      val u = #(get_const) "" const_vals
  in
    unpack_w32_list const_vals
  end;`

val _ = append_prog get_const;

(* Same but for sensors *)
val get_sensor = process_topdecs`
  fun get_sensor sensor_names =
  let val sensor_vals = Word8Array.array (4 * List.length sensor_names) (Word8.fromInt 0)
      val u = #(get_sensor) "" sensor_vals
  in
    unpack_w32_list sensor_vals
  end;`

val _ = append_prog get_sensor;

(* TODO: should be in Word8Array basis? *)
val to_string = process_topdecs`
  fun to_string arr = Word8Array.substring arr 0 (Word8Array.length arr);`

val _ = append_prog to_string;

val get_ctrl = process_topdecs`
  fun get_ctrl ctrl_names const_ls sensor_ls =
  let val csarr = pack_w32_list (List.append const_ls sensor_ls)
      val param_str = to_string csarr
      val ctrl_vals = Word8Array.array (4 * List.length ctrl_names) (Word8.fromInt 0)
      val u = #(get_ctrl) param_str ctrl_vals
  in
    unpack_w32_list ctrl_vals
  end;`

val _ = append_prog get_ctrl;

(* Reads a control decision, returns it if it passes the monitor *)
val ctrl_monitor = process_topdecs`
  fun ctrl_monitor ctrl_phi const_names sensor_names ctrl_names
                            const_ls sensor_ls =
  let
    val ctrl_ls = get_ctrl ctrl_names const_ls sensor_ls
    val st_ls = List.concat [const_ls,sensor_ls,ctrl_ls]
    val names_ls = List.concat [const_names,sensor_names,ctrl_names]
  in
    if
      wfsem_bi_val ctrl_phi (vars_to_state names_ls st_ls)
    then
      SOME ctrl_ls
    else
      NONE
  end;`

val _ = append_prog ctrl_monitor;

val actuate = process_topdecs`
  fun actuate ctrl_ls =
    let val ctrl_vals = pack_w32_list ctrl_ls in
      #(actuate) "" ctrl_vals
    end`

val _ = append_prog actuate;

val default_actuate = process_topdecs`
  fun default_actuate ctrl_ls =
    let val ctrl_vals = pack_w32_list ctrl_ls in
      #(default_actuate) "" ctrl_vals
    end`

val _ = append_prog default_actuate;

(* Reads a plant result, returns it if it passes the monitor *)
val plant_monitor = process_topdecs`
  fun plant_monitor plant_phi const_names sensor_pre_names sensor_names ctrl_names
                            const_ls sensor_pre_ls ctrl_ls =
  let
    val sensor_ls = get_sensor sensor_names (* could also be sensor_pre_names *)
    val st_ls = List.concat [const_ls,sensor_pre_ls,sensor_ls,ctrl_ls]
    val names_ls = List.concat [const_names,sensor_pre_names,sensor_names,ctrl_names]
  in
    if
      wfsem_bi_val plant_phi (vars_to_state names_ls st_ls)
    then
      SOME sensor_ls
    else
      NONE
  end;`

val _ = append_prog plant_monitor;

(* Checks if there is a next transition *)
val has_next = process_topdecs`
  fun has_next () =
  let val arr = (Word8Array.array 0 (Word8.fromInt 0))
      val u = #(has_next) "" arr
  in
    Word8Array.sub arr 0 <> Word8.fromInt 0
  end`

val sandbox_body = process_topdecs`
  fun sandbox_body plant_phi ctrl_phi
              const_names sensor_pre_names sensor_names ctrl_names default
              const_ls sensor_ls =
  (* First, we we will check if there is a next iteration *)
  if has_next()
  then
    let
    (* Run the controller monitor *)
    val ctrl_ls_opt = ctrl_monitor ctrl_phi const_names sensor_names ctrl_names default
                            const_ls sensor_ls
    (* Actuate *)
    val ctrl_ls =
      case ctrl_ls_opt of
        NONE =>
          let val ls = default const_ls sensor_ls
          in
            (default_actuate ls; ls)
          end
      | SOME ls => (actuate ls; ls)
    (* Now that we have actuated, we run the plant_monitor *)
    val sensor_ls_opt =
      plant_monitor plant_phi const_names sensor_pre_names sensor_names ctrl_names
                    const_ls sensor_ls ctrl_ls
    in
      case sensor_ls_opt of
        NONE =>
          (* End the world if plant failed *)
          #(plant_violation) "" (Word8Array.array 0 (Word8.fromInt 0))
      | SOME sensor_ls =>
          (* Otherwise, continue with the new sensor reading *)
        let val u = fullGC() in
          sandbox_body plant_phi ctrl_phi
                    const_names sensor_pre_names sensor_names ctrl_names default
                    const_ls sensor_ls
        end
    end
  else
    ()`

val _ = append_prog sandbox_body;

val sandbox = process_topdecs`
  fun sandbox init_phi plant_phi ctrl_phi
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
      sandbox_body plant_phi ctrl_phi
              const_names sensor_pre_names sensor_names ctrl_names default
              const_ls sensor_ls
    else
      #(init_violation) "" (Word8Array.array 0 (Word8.fromInt 0))
  end`

val _ = append_prog sandbox

(* The world model has three parts:
   - The world_config is immutable, and should be given to the controller
   - The world_state is the current concrete values
   - The world_oracle is a sequence gives the transition functions
*)

(* This models the "output" of the monitor
   Violation is triggered on plant or init violations
*)
val _ = Datatype`
  world_config = <|
    const_names        : mlstring list;
    sensor_pre_names   : mlstring list;
    sensor_names       : mlstring list;
    ctrl_names         : mlstring list;
    init               : fml;
    ctrl_monitor       : fml;
    plant_monitor      : fml |>`

(* The current world state is (partially) observable *)
val _ = Datatype`
  world_state = <|
    const_vals   : word32 list; (* Fixed constants *)
    sensor_vals  : word32 list; (* The current sensor values *)
    step         : bool       ; (* Whether we could still take a transition *)
    |>`

(* Sequences of world oracles TODO: currently unencodable
  The current oracle is the head of the sequence, and each time
  an oracle is used, it gets popped
*)
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

(* tr tracks the trace of actuations *)
val _ = Datatype`
  world = <| wc : world_config ;
             ws : world_state  ;
             wo : world_oracle ;
             tr : (world_state # word32 list) list|>`

val get_oracle_def = Define`
  get_oracle f = (f 0n,λn. f (n+1))`

(* Modeling the world interactions *)
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

(* TODO: Need to assume that the oracle always gives the correct length back... *)
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

(* When actuate is called, we track it in the trace
   Input bytes are unchanged
*)
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

(* TODO: is this the right model? *)
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

(* No op *)
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

(*    Cons (List (MAP (Str o explode) w.wc.const_names))
   (Cons (List (MAP (Str o explode) w.wc.sensor_names))
   (Cons (List (MAP (Str o explode) w.wc.ctrl_names))
   (Cons (encode_word32_list w.ws.const_vals)
   (Cons (encode_word32_list w.ws.sensor_vals)
   (Cons (encode_word32_list w.ws.ctrl_vals)
   (encode_fml w.wc.ctrl_monitor))))))` *)

(* Invert the encoding *)
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
(*
  fs[encode_def] >> fs comp_eq>> rw[]>>
  TRY(
    match_mp_tac (INJ_MAP_EQ |> Q.ISPEC`Str o explode`)>>
    rw[INJ_DEF]>>metis_tac[mlstringTheory.explode_11])>>
  TRY(metis_tac[decode_encode_fml,decode_encode_word32_list,SOME_11])); *)

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
       ("default_actuate",ffi_actuate);
       ("has_next",ffi_has_next);
       ("plant_violation",ffi_violation);
       ("init_violation",ffi_violation);
       ])`;

(* Well-formed worlds obey their config's lengths *)
val wf_world_def = Define`
  wf_world w ⇔
  let constlen = LENGTH w.wc.const_names in
  let sensorlen = LENGTH w.wc.sensor_names in
  let sensor_prelen = LENGTH w.wc.sensor_pre_names in
  let ctrllen = LENGTH w.wc.ctrl_names in
  sensorlen = sensor_prelen ∧
  LENGTH w.ws.const_vals = constlen ∧
  LENGTH w.ws.sensor_vals = sensorlen ∧
  (∀n inp.
    (*LENGTH inp = clen + slen ⇒ -- we could restrict it more... *)
    LENGTH (w.wo.ctrl_oracle n inp) = ctrllen) ∧
  (∀n inp.
    (* See above on the length restriction *)
    LENGTH (w.wo.transition_oracle n inp) = sensorlen)`

(* The controller choice checks out *)
val ctrl_sat_def = Define`
  ctrl_sat wc ws ctrl ⇔
  wfsem wc.ctrl_monitor
    (vars_to_state
    (wc.const_names ++ wc.sensor_names ++ wc.ctrl_names)
    (ws.const_vals  ++ ws.sensor_vals  ++ ctrl)) = SOME T`

val init_sat_def = Define`
  init_sat wc ws ⇔
  wfsem wc.init
      (vars_to_state
      (wc.const_names ++ wc.sensor_names)
      (ws.const_vals ++ ws.sensor_vals)) = SOME T`

(* If we actuated again after the previous step, then
  we must be able to step to the current state from the previous step
  obeying the plant monitor *)
val plant_sat_def = Define`
  plant_sat wc prev_sensor prev_ctrl ws ⇔
  wfsem wc.plant_monitor
    (vars_to_state
      (wc.const_names ++ wc.sensor_pre_names ++ wc.sensor_names ++ wc.ctrl_names)
      (ws.const_vals ++ prev_sensor ++ ws.sensor_vals ++ prev_ctrl)) = SOME T`

(* For each actuation, we check that it satisfies the controller monitor*)
val good_trace_def = Define`
  (good_trace wc prev [] = T) ∧
  (good_trace wc prev ((ws,ctrl)::xs) =
  (ctrl_sat wc ws ctrl ∧
  (case prev of
    NONE =>
    init_sat wc ws
  | SOME (s,c) =>
    plant_sat wc s c ws) ∧
  good_trace wc (SOME (ws.sensor_vals,ctrl)) xs))`

val bot_st = get_ml_prog_state();

val IOBOT_def = Define `
  IOBOT w = IOx bot_ffi_part w * &wf_world w`

val _ = overload_on ("WORD32",``WORD:word32 -> v -> bool``);

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

val w32_to_w8_APPEND = Q.prove(`
  w32_to_w8 (a ++ b) = w32_to_w8 a ++ w32_to_w8 b`,
  cheat);

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
    xlet `
    (POSTv lv.
      IOBOT (w with
        wo := w.wo with ctrl_oracle := (λn. w.wo.ctrl_oracle (n + 1)))*
      SEP_EXISTS vv.
      & (LENGTH vv = LENGTH w.wc.ctrl_names ∧
        LIST_TYPE WORD32 vv lv))`
    >-
      (xapp>> fs[])
    >>
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

val plant_monitor_spec = Q.store_thm("plant_monitor_spec",`
    (* These specify what the inputs should be *)
    MONITORPROG_FML_TYPE w.wc.plant_monitor fv ∧
    LIST_TYPE STRING_TYPE w.wc.const_names const_namesv ∧
    LIST_TYPE STRING_TYPE w.wc.sensor_pre_names sensor_pre_namesv ∧
    LIST_TYPE STRING_TYPE w.wc.sensor_names sensor_namesv ∧
    LIST_TYPE STRING_TYPE w.wc.ctrl_names ctrl_namesv ∧
    LIST_TYPE WORD32 w.ws.const_vals const_valsv ∧
    LIST_TYPE WORD32 sensor_vals sensor_valsv ∧
    LIST_TYPE WORD32 ctrl_vals ctrl_valsv
    ⇒
    app (p:'ffi ffi_proj) ^(fetch_v "plant_monitor" bot_st)
      [fv;const_namesv;sensor_pre_namesv;sensor_namesv;ctrl_namesv;
          const_valsv;sensor_valsv;ctrl_valsv]
    (IOBOT w)
    (POSTv optv.
      IOBOT (w) *
      &(OPTION_TYPE (LIST_TYPE WORD32)
        (if plant_sat w.wc sensor_vals ctrl_vals w.ws
         then
           SOME w.ws.sensor_vals
         else
           NONE
        ) optv))`,
    strip_tac>>
    xcf "plant_monitor" bot_st>>
    drule get_sensor_spec>>
    strip_tac>>
    xlet_auto >> xsimpl>>
    rpt(xlet_auto>- ((TRY xcon)>>xsimpl))>>
    qabbrev_tac`x0 = [w.ws.const_vals;sensor_vals;w.ws.sensor_vals;ctrl_vals]`>>
    xlet `
    (POSTv lv.
      IOBOT w *
      &LIST_TYPE WORD32 (FLAT x0) lv)`
    >-
      (xapp_spec (ListProgTheory.flat_v_thm |> INST_TYPE [alpha |-> ``:word32``])>>
      xsimpl>>
      qexists_tac`x0`>>simp[]>>
      qexists_tac`WORD32`>>simp[ml_translatorTheory.LIST_TYPE_def,Abbr`x0`])
    >>
    rpt(xlet_auto>- ((TRY xcon)>>xsimpl))>>
    qabbrev_tac`x1 = [w.wc.const_names;w.wc.sensor_pre_names;w.wc.sensor_names;w.wc.ctrl_names]`>>
    xlet`POSTv v. IOBOT w * &LIST_TYPE STRING_TYPE (FLAT x1) v`
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
      fs[plant_sat_def,wfsem_bi_val_def]>>
      pop_assum mp_tac>> TOP_CASE_TAC>>fs[]>>
      simp[ml_translatorTheory.OPTION_TYPE_def])>>
    xcon>>xsimpl>>
    fs[plant_sat_def,wfsem_bi_val_def]>>
    pop_assum mp_tac>> TOP_CASE_TAC>>fs[]>>
    simp[ml_translatorTheory.OPTION_TYPE_def]);

val actuate_spec = Q.store_thm("actuate_spec",`
    LENGTH cvs = 4 * LENGTH w.wc.ctrl_names ∧
    wfsem_sat w (w8_to_w32 cvs)
    ⇒
    app (p:'ffi ffi_proj) ^(fetch_v "actuate" bot_st) [ctrlv]
      (IOBOT w *
      W8ARRAY ctrlv cvs)
      (POSTv ar.
      IOBOT w *
      W8ARRAY ctrlv cvs)`,
    rw[]>>
    xcf"actuate" bot_st>>
    simp[IOBOT_def]>>xpull>>
    xffi >> xsimpl>>
    simp[IOx_def,bot_ffi_part_def,mk_ffi_next_def]>>
    qmatch_goalsub_abbrev_tac`IO s u ns` >>
    map_every qexists_tac [`emp`, `s`, `s`, `u`, `ns`] >>
    xsimpl >>
    unabbrev_all_tac>>
    simp[mk_ffi_next_def,ffi_actuate_def]);

val default_actuate_spec = Q.store_thm("default_actuate_spec",`
    LENGTH cvs = 4 * LENGTH w.wc.ctrl_names ∧
    wfsem_sat w (w8_to_w32 cvs)
    ⇒
    app (p:'ffi ffi_proj) ^(fetch_v "default_actuate" bot_st) [ctrlv]
      (IOBOT w *
      W8ARRAY ctrlv cvs)
      (POSTv ar.
      IOBOT w *
      W8ARRAY ctrlv cvs)`,
    rw[]>>
    xcf"default_actuate" bot_st>>
    simp[IOBOT_def]>>xpull>>
    xffi >> xsimpl>>
    simp[IOx_def,bot_ffi_part_def,mk_ffi_next_def]>>
    qmatch_goalsub_abbrev_tac`IO s u ns` >>
    map_every qexists_tac [`emp`, `s`, `s`, `u`, `ns`] >>
    xsimpl >>
    unabbrev_all_tac>>
    simp[mk_ffi_next_def,ffi_actuate_def]);

(* We assume that the default function always works in the current world
  -- This is a really strong assumption, it really ought to work in all
     world_configs rather than all worlds
*)
val good_default_def = Define`
  good_default default w ⇔
  (* Any valuation satisfying the const and sensor lengths *)
  let def_ctrl = default w.ws.const_vals w.ws.sensor_vals in
  LENGTH def_ctrl = LENGTH w.wc.ctrl_names ∧
  wfsem w.wc.ctrl_monitor
      (vars_to_state
      (w.wc.const_names++ w.wc.sensor_names++ w.wc.ctrl_names)
      (w.ws.const_vals ++ w.ws.sensor_vals ++ def_ctrl)) = SOME T`

val ctrl_monitor_spec = Q.store_thm("ctrl_monitor_spec",`
    (* These specify what the inputs should be *)
    MONITORPROG_FML_TYPE w.wc.ctrl_monitor fv ∧
    LIST_TYPE STRING_TYPE w.wc.const_names const_namesv ∧
    LIST_TYPE STRING_TYPE w.wc.sensor_names sensor_namesv ∧
    LIST_TYPE STRING_TYPE w.wc.ctrl_names ctrl_namesv ∧
    (LIST_TYPE (WORD:word32 -> v -> bool) -->
    LIST_TYPE (WORD:word32 -> v -> bool) -->
    LIST_TYPE (WORD:word32 -> v -> bool)) def defv ∧
    good_default def w ⇒
    app (p:'ffi ffi_proj) ^(fetch_v "ctrl_monitor" bot_st)
      [fv;const_namesv;sensor_namesv;ctrl_namesv;defv]
    (IOBOT w)
    (POSTv u. IOBOT w)`,
    rw[]>>
    xcf "ctrl_monitor" bot_st>>
    drule get_const_spec >> strip_tac>>
    xlet_auto>- xsimpl>>
    drule get_sensor_spec >> strip_tac>>
    xlet_auto>- xsimpl>>
    drule get_ctrl_spec >> strip_tac>>
    rpt(xlet_auto >- xsimpl)>>
    xlet`POSTv ls.
     SEP_EXISTS vv.
     W8ARRAY ar'' (w32_to_w8 w.ws.ctrl_vals) *
     W8ARRAY ar' (w32_to_w8 w.ws.sensor_vals) *
     W8ARRAY ar (w32_to_w8 w.ws.const_vals) * IOBOT w *
     &(wfsem_sat w vv /\ LENGTH vv = LENGTH w.wc.ctrl_names ∧
       LIST_TYPE (WORD:word32 -> v -> bool) (vv) ls)`
    >-
      (xapp>>xsimpl>>
      asm_exists_tac>>simp[]>>
      asm_exists_tac>>simp[]>>
      asm_exists_tac>>simp[]>>
      fs[w8_to_w32_w32_to_w8,good_default_def]>>
      rw[]>>
      HINT_EXISTS_TAC>>simp[wfsem_sat_def])
    >>
    rpt(xlet_auto >- xsimpl)>>
    xif
    >-
      (simp[IOBOT_def] >> xpull>>
      xapp>>xsimpl>>simp[w8_to_w32_w32_to_w8,LENGTH_w32_to_w8,IOBOT_def]>>
      xsimpl>>
      map_every qexists_tac [`W8ARRAY ar' (w32_to_w8 w.ws.sensor_vals) *
W8ARRAY ar (w32_to_w8 w.ws.const_vals) `,`w`] >> xsimpl>>
      fs[wf_world_def,wfsem_sat_def,wfsem_bi_val_def]>>
      every_case_tac>>fs[w8_to_w32_w32_to_w8])
    >>
      xlet_auto>- xsimpl>>
      simp[IOBOT_def] >> xpull>>
      xapp>>xsimpl>>simp[w8_to_w32_w32_to_w8,LENGTH_w32_to_w8,IOBOT_def]>>
      xsimpl>>
      map_every qexists_tac [`W8ARRAY ar'' (w32_to_w8 w.ws.ctrl_vals) *
        W8ARRAY ar' (w32_to_w8 w.ws.sensor_vals) *
        W8ARRAY ar (w32_to_w8 w.ws.const_vals)  `,`w`] >> xsimpl);

(*
(* Models a (changing) world? *)
val _ = Datatype`
  world = <|
    const_names         : string list;
    sensor_names        : string list;
    ctrl_names          : string list;
    const_vals          : word32 list;  (* Fixed constants *)
    sensor_vals         : word32 list;  (* The current world state *)
    ctrl_oracle         : num -> word32 list -> word32 list; (* The sequence of controllers *)
    actuation_oracle    : num -> word32 list -> word32 list -> word32 list
                   (* The actuation oracle:
                      Given the current (constant and) sensor state and controls,
                      it returns the new sensor state *)
    |>`

val w32_to_w8_def = Define`
  w32_to_w8 ls = FLAT_TUP (MAP w32_to_le_bytes ls)`

val w8_to_w32_def = Define`
  w8_to_w32 ls = MAP4 le_bytes_to_w32 ls`

val ffi_get_const_def = Define`
  ffi_get_const (conf:word8 list) (bytes:word8 list) (st:world) =
  if LENGTH bytes = 4 * LENGTH st.const_names
  then
    SOME (w32_to_w8 st.const_vals,st)
  else
    NONE`

val ffi_get_sensor_def = Define`
  ffi_get_sensor (conf:word8 list) (bytes:word8 list) (st:world) =
  if LENGTH bytes = 4 * LENGTH st.sensor_names
  then
    SOME (w32_to_w8 st.sensor_vals,st)
  else
    NONE`

val ffi_get_control_def = Define`
  ffi_get_control (conf:word8 list) (bytes:word8 list) (st:world) =
  if LENGTH conf = 4 * (LENGTH st.const_names + LENGTH st.sensor_names) ∧
     LENGTH bytes = 4 * LENGTH st.ctrl_names
  then
    let cur_oracle = st.ctrl_oracle 0 in
    let next_oracle = λn. st.ctrl_oracle (n+1) in
    let w32s = w8_to_w32 bytes in
    let w8s = w32_to_w8 (cur_oracle w32s) in
    SOME (w8s,st with ctrl_oracle := next_oracle)
  else NONE`

(* on actuation, the world changes according to the oracle *)
val ffi_actuate_def = Define`
  ffi_actuate (conf:word8 list) (bytes:word8 list) (st:world) =
  if LENGTH bytes = 4 * (LENGTH st.ctrl_names)
  then
    let cur_oracle = st.actuation_oracle 0 in
    let next_oracle = λn. st.actuation_oracle (n+1) in
    let cur_state = st.const_vals ++ st.sensor_vals in
    let w32s = w8_to_w32 bytes in
    let next_state = cur_oracle cur_state w32s in
    SOME (bytes,st with
      <| sensor_vals := next_state;
         actuation_oracle := next_oracle |>)
  else NONE`

(* Turn a word32 list into a list of strings invertibly *)
val encode_word32_list_def = Define`
  encode_word32_list ws =
  List (MAP (Str o w2s 2 CHR) ws)`

val decode_string_def = Define`
  (decode_string (Str w) = SOME (s2w 2 ORD w)) ∧
  (decode_string _ = NONE)`

val decode_word32_list_def = Define`
  (decode_word32_list (List ls) =
  let dec = MAP decode_string ls in
  if EVERY IS_SOME dec then SOME (MAP THE dec)
  else
    NONE) ∧
  (decode_word32_list _ = NONE)`

val decode_encode_word32_list = Q.prove(`
  ∀ls. decode_word32_list (encode_word32_list ls) = SOME ls`,
  Induct>>fs[encode_word32_list_def,decode_word32_list_def,decode_string_def]>>
  rw[]>> match_mp_tac s2w_w2s>>
  fs[]);

(* Encode world into the FFI type *)
val encode_def = Define`
  encode (w:world) = (ARB :ffi)`

(*    Cons (List (MAP Str w.const_names))
   (Cons (List (MAP Str w.sensor_names))
   (Cons (List (MAP Str w.ctrl_names))
   (Cons (Num w.epoch)
   (Cons (encode_word32_list w.const_vals)
   (Cons (List (MAP encode_word32_list w.sensor_vals))
   (Cons (List (MAP encode_word32_list w.ctrl_vals))
   (List (MAP encode_word32_list w.actuations))))))))` *)

val decode_encode = Q.store_thm("decode_encode[simp]",
  `decode (encode (w:world)) = SOME w`, cheat);

val bot_ffi_part_def = Define`
  bot_ffi_part =
    (encode,decode,
      [("get_const",ffi_get_const);
       ("get_sensor",ffi_get_sensor);
       ("get_ctrl",ffi_get_control);
       ("actuate",ffi_actuate);
       ("default_actuate",ffi_actuate)])`;

(* Well-formed worlds *)
   const_names         : string list;
    sensor_names        : string list;
    ctrl_names          : string list;
    const_vals          : word32 list;  (* Fixed constants *)
    sensor_vals         : word32 list;  (* The current world state *)
    ctrl_oracle         : num -> word32 list -> word32 list;
                        (* The sequence of controllers *)
    actuation_oracle    : num -> word32 list -> word32 list -> word32 list
                        (* The actuation oracle:
                        Given the current (constant and) sensor state and controls,
                        it returns the new sensor state *)

(* Well-formedness restricts the lengths *)
val wf_world_def = Define`
  wf_world w ⇔
  LENGTH w.const_vals = LENGTH w.const_names ∧
  LENGTH w.sensor_vals = LENGTH w.sensor_names ∧
  (∀n st.
    LENGTH st = LENGTH w.const_names + LENGTH w.sensor_names
    ⇒
    LENGTH (w.ctrl_oracle n st) = LENGTH w.ctrl_names) ∧
  (∀n st c.
    LENGTH st = LENGTH w.const_names + LENGTH w.sensor_names ∧
    LENGTH c = LENGTH w.ctrl_names
    ⇒
    LENGTH (w.actuation_oracle n st c) = LENGTH w.ctrl_names)`

val bot_st = get_ml_prog_state();

(* The oracle always produces good states (w.r.t. P)
   if it is given a state that starts in P *)
val good_next_state_def = Define`
  good_next_state P Q oracle ⇔
  ∀n:num (constv:word32 list) (sensev:word32 list) (ctrlv:word32 list).
    P constv sensev ∧ Q constv sensev ctrlv ⇒
    P constv (oracle n (constv++sensev) ctrlv)`

val good_w_def = Define`
  good_w P Q w ⇔
  wf_world w ∧
  good_next_state P Q w.actuation_oracle ∧
  P w.const_vals w.sensor_vals`

val IOBOT_def = Define `
  IOBOT P Q w =
  IOx bot_ffi_part w * &good_w P Q w`

open cfHeapsBaseTheory

val get_const_spec = Q.store_thm("get_const_spec",`
    ∀w vs.
    LIST_TYPE (LIST_TYPE CHAR) w.const_names vs
    ⇒
    app (p:'ffi ffi_proj) ^(fetch_v "get_const" bot_st) [vs]
      (IOBOT P Q w)
      (POSTv ar.
      IOBOT P Q w *
      W8ARRAY ar (w32_to_w8 w.const_vals))`,
    rw[IOBOT_def]>>
    xpull>>
    xcf "get_const" bot_st>>
    rpt(xlet_auto>- xsimpl)>>
    xlet `POSTv u.
           IOx bot_ffi_part w *
           W8ARRAY v' (w32_to_w8 w.const_vals)`
    >-
      (xffi>>xsimpl>>
      simp[IOx_def,bot_ffi_part_def,mk_ffi_next_def]>>
      xsimpl >>
      qmatch_goalsub_abbrev_tac`IO s u ns` >>
      map_every qexists_tac [`&wf_world w`, `s`, `s`, `u`, `ns`] >>
      unabbrev_all_tac>>
      xsimpl >>
      fs[mk_ffi_next_def,ffi_get_const_def,good_w_def])
    >>
      xvar>>xsimpl);

val get_sensor_spec = Q.store_thm("get_sensor_spec",`
    ∀w vs.
    LIST_TYPE (LIST_TYPE CHAR) w.sensor_names vs
    ⇒
    app (p:'ffi ffi_proj) ^(fetch_v "get_sensor" bot_st) [vs]
      (IOBOT w)
      (POSTv ar.
      IOBOT w *
      W8ARRAY ar (w32_to_w8 (EL w.epoch w.sensor_vals)))`,
    rw[IOBOT_def]>>
    xpull>>
    xcf "get_sensor" bot_st>>
    rpt(xlet_auto>- xsimpl)>>
    xlet `POSTv u.
           IOx bot_ffi_part w *
           W8ARRAY v' (w32_to_w8 (EL w.epoch w.sensor_vals))`
    >-
      (xffi>>xsimpl>>
      simp[IOx_def,bot_ffi_part_def,mk_ffi_next_def]>>
      xsimpl >>
      qmatch_goalsub_abbrev_tac`IO s u ns` >>
      map_every qexists_tac [`&wf_world w`, `s`, `s`, `u`, `ns`] >>
      unabbrev_all_tac>>
      xsimpl >>
      simp[mk_ffi_next_def,ffi_get_sensors_def])
    >>
      xvar>>xsimpl);

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
    ∀w vs cs ss constv sensev.
    LIST_TYPE (LIST_TYPE CHAR) w.ctrl_names vs
    ⇒
    app (p:'ffi ffi_proj) ^(fetch_v "get_ctrl" bot_st) [vs;constv;sensev]
      (IOBOT w *
      W8ARRAY constv (w32_to_w8 w.const_vals) *
      W8ARRAY sensev (w32_to_w8 (EL w.epoch w.sensor_vals)))
      (POSTv ar.
      IOBOT w *
      W8ARRAY ar (w32_to_w8 (EL w.epoch w.ctrl_vals)) *
      W8ARRAY constv (w32_to_w8 w.const_vals) *
      W8ARRAY sensev (w32_to_w8 (EL w.epoch w.sensor_vals)))`,
    rw[IOBOT_def]>>
    xpull>>
    xcf "get_ctrl" bot_st>>
    rpt(xlet_auto>- ((TRY xcon)>>xsimpl))>>
    qmatch_asmsub_abbrev_tac`STRING_TYPE conststr _`>>
    qmatch_asmsub_abbrev_tac`STRING_TYPE sensestr sv`>>
    xlet `POSTv v. &STRING_TYPE (concat [conststr;sensestr]) v *
       (W8ARRAY constv (w32_to_w8 w.const_vals) *
       W8ARRAY sensev (w32_to_w8 (EL w.epoch w.sensor_vals)) *
       W8ARRAY v' (REPLICATE (4 * LENGTH w.ctrl_names) 0w) *
       IOx bot_ffi_part w)`
    >-
      (xapp>>xsimpl>>
      qexists_tac`[conststr;sensestr]`>>simp[ml_translatorTheory.LIST_TYPE_def])
    >>
    xlet`
    (POSTv u.
     IOx bot_ffi_part w *
     W8ARRAY v' (w32_to_w8 (EL w.epoch w.ctrl_vals)) *
     W8ARRAY constv (w32_to_w8 w.const_vals) *
     W8ARRAY sensev (w32_to_w8 (EL w.epoch w.sensor_vals)))`
    >-
      (
      xffi>>
      xsimpl>>
      simp[IOx_def,bot_ffi_part_def,mk_ffi_next_def]>>
      qmatch_goalsub_abbrev_tac`IO s u ns` >>
      qabbrev_tac`ls = w32_to_w8 w.const_vals ++ w32_to_w8 (EL w.epoch w.sensor_vals)`>>
      map_every qexists_tac [`ls`,`
        W8ARRAY constv (w32_to_w8 w.const_vals) *
        W8ARRAY sensev (w32_to_w8 (EL w.epoch w.sensor_vals)) *
        &wf_world w`, `s`, `s`, `u`, `ns`] >>
      xsimpl >>
      unabbrev_all_tac>>
      simp[mk_ffi_next_def,ffi_get_control_def]>>
      cheat)
    >>
      xvar>>
      xsimpl);

val actuate_spec = Q.store_thm("actuate_spec",`
    ∀a av w.
    app (p:'ffi ffi_proj) ^(fetch_v "actuate" bot_st) [a]
      (IOBOT w * W8ARRAY a av)
      (POSTv ar.
      IOBOT (w with actuations := SNOC (w8_to_w32 av) w.actuations) *
      W8ARRAY a av)`,
    rw[IOBOT_def]>>
    xpull>>
    xcf "actuate" bot_st>>
    xffi>>xsimpl>>
    simp[IOx_def,bot_ffi_part_def,mk_ffi_next_def]>>
    qmatch_goalsub_abbrev_tac`IO s u ns` >>
    qpat_abbrev_tac`s' = w with actuations := _`>>
    map_every qexists_tac [`emp`, `s`, `encode s'`, `u`, `ns`] >>
    xsimpl >>
    unabbrev_all_tac>>
    simp[mk_ffi_next_def,ffi_actuate_def,wf_world_def]>> )

*)
val _ = export_theory();
