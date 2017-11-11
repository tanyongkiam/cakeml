open preamble ml_progLib ml_translatorLib
     basisFunctionsLib basis_ffiLib
     cfTacticsLib cfLetAutoLib
     monitorProgTheory
open cfHeapsBaseTheory

(* Defines and verifies a 1 shot controller monitor wrapper *)

val _ = new_theory "ctrl_monitorProg";

val _ = translation_extends "monitorProg";

(*
  This takes in:
  1) controller monitor formula phi
  2) names for the constants, sensors and control parameters
  3) a default for the controller
*)

val to_string = process_topdecs`
  fun to_string arr = Word8Array.substring arr 0 (Word8Array.length arr);`

val _ = append_prog to_string;

(* Reads the constants and returns the vals,string rep and list rep *)
val get_const = process_topdecs`
  fun get_const const_names =
  let val const_vals = Word8Array.array (4 * List.length const_names) (Word8.fromInt 0)
      val u = #(get_const) "" const_vals
  in
    const_vals
  end;`

val _ = append_prog get_const;

(* Same except it reads from the sensor FFI *)
val get_sensor = process_topdecs`
  fun get_sensor sensor_names =
  let val sensor_vals = Word8Array.array (4 * List.length sensor_names) (Word8.fromInt 0)
      val u = #(get_sensor) "" sensor_vals
  in
    sensor_vals
  end;`

val _ = append_prog get_sensor;

(* Same, except it reads from the ctrl FFI and at the same time,
   provides the const and sensor values *)
val get_ctrl = process_topdecs`
  fun get_ctrl ctrl_names const_vals sensor_vals =
  let val ctrl_vals = Word8Array.array (4 * List.length ctrl_names) (Word8.fromInt 0)
      val param_str =
        String.concat [to_string const_vals,to_string sensor_vals]
      val u = #(get_ctrl) param_str ctrl_vals
  in
    ctrl_vals
  end;`

val _ = append_prog get_ctrl;

val actuate = process_topdecs`
  fun actuate ctrl_vals = #(actuate) "" ctrl_vals`

val _ = append_prog actuate;

val default_actuate = process_topdecs`
  fun default_actuate ctrl_vals = #(default_actuate) "" ctrl_vals`

val _ = append_prog default_actuate;

(* The full program *)

val ctrl_monitor = process_topdecs`
  fun ctrl_monitor phi const_names sensor_names ctrl_names default =
  let
    val const_vals = get_const const_names
    val sensor_vals = get_sensor sensor_names
    val ctrl_vals = get_ctrl ctrl_names const_vals sensor_vals
    val const_ls = unpack_w32_list const_vals
    val sensor_ls = unpack_w32_list sensor_vals
    val ctrl_ls = unpack_w32_list ctrl_vals
    val st_ls = List.append const_ls (List.append sensor_ls ctrl_ls)
    val names_ls = List.append const_names (List.append sensor_names ctrl_names)
    val default_ls = default const_ls sensor_ls
  in
    if
      wfsem_bi_val phi (vars_to_state names_ls st_ls)
    then
      actuate ctrl_vals
    else
      default_actuate (pack_w32_list default_ls)
  end;`

val _ = append_prog ctrl_monitor;

(* The world model has two parts:
   - The world_config is immutable, and should be given to the controller
   - The world_state is unknown, and gets seen by the FFI
*)

val _ = Datatype`
  world_config = <|
    const_names  : mlstring list;
    sensor_names : mlstring list;
    ctrl_names   : mlstring list;
    ctrl_monitor : fml |>`

val _ = Datatype`
  world_state = <|
    const_vals   : word32 list; (* Fixed constants *)
    sensor_vals  : word32 list;
    ctrl_vals    : word32 list; (* This should really be word32 list -> word32 list*)
    |>`

val _ = Datatype`
  world = <| wc : world_config; ws : world_state |>`

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
    let w8s = w32_to_w8 st.ws.ctrl_vals in
    SOME (w8s,st)
  else NONE`

val wfsem_sat_def = Define`
  wfsem_sat st ctrl_decision ⇔
  wfsem st.wc.ctrl_monitor
      (vars_to_state
      (st.wc.const_names++st.wc.sensor_names++st.wc.ctrl_names)
      (st.ws.const_vals++st.ws.sensor_vals++ctrl_decision)) = SOME T`

(* When actuate is called, the world halts if the monitor is violated *)
val ffi_actuate_def = Define`
  ffi_actuate (conf:word8 list) (bytes:word8 list) (st:world) =
  if LENGTH bytes = 4 * (LENGTH st.wc.ctrl_names)
  then
    if wfsem_sat st (w8_to_w32 bytes)
    then SOME(bytes,st)
    else NONE
  else NONE`

(* Encode world into the FFI type *)
val encode_def = Define`
  encode (w:world) =
    Cons (List (MAP (Str o explode) w.wc.const_names))
   (Cons (List (MAP (Str o explode) w.wc.sensor_names))
   (Cons (List (MAP (Str o explode) w.wc.ctrl_names))
   (Cons (encode_word32_list w.ws.const_vals)
   (Cons (encode_word32_list w.ws.sensor_vals)
   (Cons (encode_word32_list w.ws.ctrl_vals)
   (encode_fml w.wc.ctrl_monitor))))))`

(* Invert the encoding *)
val decode_def = Define`
  decode foo = some w. encode w = foo`

val comp_eq = map theorem ["world_component_equality",
                           "world_config_component_equality",
                           "world_state_component_equality"];

val INJ_Str_explode = Q.prove(`
  INJ (Str o explode) UNIV UNIV`,
  rw[INJ_DEF]>>metis_tac[mlstringTheory.explode_11]);

val encode_11 = Q.prove(`
  ∀w w'.
  encode w' = encode w ⇒
  w' = w`,
  fs[encode_def] >> fs comp_eq>> rw[]>>
  TRY(
    match_mp_tac (INJ_MAP_EQ |> Q.ISPEC`Str o explode`)>>
    rw[INJ_DEF]>>metis_tac[mlstringTheory.explode_11])>>
  TRY(metis_tac[decode_encode_fml,decode_encode_word32_list,SOME_11]));

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
       ("default_actuate",ffi_actuate)])`;

(* Well-formed worlds follow their config *)
val wf_world_def = Define`
  wf_world w ⇔
  LENGTH w.ws.const_vals = LENGTH w.wc.const_names ∧
  LENGTH w.ws.sensor_vals = LENGTH w.wc.sensor_names ∧
  LENGTH w.ws.ctrl_vals = LENGTH w.wc.ctrl_names`

val bot_st = get_ml_prog_state();

val IOBOT_def = Define `
  IOBOT w = IOx bot_ffi_part w * &wf_world w`

val get_const_spec = Q.store_thm("get_const_spec",`
    ∀w vs.
    LIST_TYPE STRING_TYPE w.wc.const_names vs
    ⇒
    app (p:'ffi ffi_proj) ^(fetch_v "get_const" bot_st) [vs]
      (IOBOT w)
      (POSTv ar.
      IOBOT w *
      W8ARRAY ar (w32_to_w8 w.ws.const_vals))`,
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
      xvar>>xsimpl);

val get_sensor_spec = Q.store_thm("get_sensor_spec",`
    ∀w vs.
    LIST_TYPE STRING_TYPE w.wc.sensor_names vs
    ⇒
    app (p:'ffi ffi_proj) ^(fetch_v "get_sensor" bot_st) [vs]
      (IOBOT w)
      (POSTv ar.
      IOBOT w *
      W8ARRAY ar (w32_to_w8 w.ws.sensor_vals))`,
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
    LIST_TYPE STRING_TYPE w.wc.ctrl_names vs
    ⇒
    app (p:'ffi ffi_proj) ^(fetch_v "get_ctrl" bot_st) [vs;constv;sensev]
      (IOBOT w *
      W8ARRAY constv (w32_to_w8 w.ws.const_vals) *
      W8ARRAY sensev (w32_to_w8 w.ws.sensor_vals))
      (POSTv ar.
      IOBOT w *
      W8ARRAY ar (w32_to_w8 (w.ws.ctrl_vals)) *
      W8ARRAY constv (w32_to_w8 w.ws.const_vals) *
      W8ARRAY sensev (w32_to_w8 w.ws.sensor_vals))`,
    rw[IOBOT_def]>>
    xpull>>
    xcf "get_ctrl" bot_st>>
    rpt(xlet_auto>- ((TRY xcon)>>xsimpl))>>
    qmatch_asmsub_abbrev_tac`STRING_TYPE conststr _`>>
    qmatch_asmsub_abbrev_tac`STRING_TYPE sensestr sv`>>
    xlet `POSTv v. &STRING_TYPE (concat [conststr;sensestr]) v *
       (W8ARRAY constv (w32_to_w8 w.ws.const_vals) *
       W8ARRAY sensev (w32_to_w8 w.ws.sensor_vals) *
       W8ARRAY v' (REPLICATE (4 * LENGTH w.wc.ctrl_names) 0w) *
       IOx bot_ffi_part w)`
    >-
      (xapp>>xsimpl>>
      qexists_tac`[conststr;sensestr]`>>simp[ml_translatorTheory.LIST_TYPE_def])
    >>
    xlet`
    (POSTv u.
     IOx bot_ffi_part w *
     W8ARRAY v' (w32_to_w8 w.ws.ctrl_vals) *
     W8ARRAY constv (w32_to_w8 w.ws.const_vals) *
     W8ARRAY sensev (w32_to_w8 w.ws.sensor_vals))`
    >-
      (
      xffi>>
      xsimpl>>
      simp[IOx_def,bot_ffi_part_def,mk_ffi_next_def]>>
      qmatch_goalsub_abbrev_tac`IO s u ns` >>
      qabbrev_tac`ls = w32_to_w8 w.ws.const_vals ++ w32_to_w8 w.ws.sensor_vals`>>
      map_every qexists_tac [`ls`,`
        W8ARRAY constv (w32_to_w8 w.ws.const_vals) *
        W8ARRAY sensev (w32_to_w8 w.ws.sensor_vals) *
        &wf_world w`, `s`, `s`, `u`, `ns`] >>
      xsimpl >>
      unabbrev_all_tac>>
      simp[mk_ffi_next_def,ffi_get_control_def]>>
      fs[mlstringTheory.concat_def,ml_translatorTheory.STRING_TYPE_def,
        LENGTH_w32_to_w8,wf_world_def])
    >>
      xvar>>
      xsimpl);

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
