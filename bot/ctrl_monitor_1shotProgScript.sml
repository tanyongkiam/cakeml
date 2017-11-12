open preamble ml_progLib ml_translatorLib
     basisFunctionsLib basis_ffiLib
     cfTacticsLib cfLetAutoLib
     monitorProgTheory
open cfHeapsBaseTheory

(*
  Defines and verifies a 1-shot controller monitor + wrapper

  Many of the functions will get new specifications later
  when we model the world more carefully
*)

val _ = new_theory "ctrl_monitor_1shotProg";

val _ = translation_extends "monitorProg";

(* TODO: should be in Word8Array basis? *)
val to_string = process_topdecs`
  fun to_string arr = Word8Array.substring arr 0 (Word8Array.length arr);`

val _ = append_prog to_string;

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

(* Read the controls *)
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

(* Pure controller monitor wrapper
   The additional string literal is just there for external logging
*)
val ctrl_monitor_def = Define`
  ctrl_monitor ctrl_phi const_names sensor_names ctrl_names
                        const_ls sensor_ls ctrl_ls default =
  let st_ls = FLAT [const_ls; sensor_ls; ctrl_ls] in
  let names_ls = FLAT [const_names; sensor_names; ctrl_names] in
    if
      wfsem_bi_val ctrl_phi (vars_to_state names_ls st_ls)
    then
      (strlit"OK",ctrl_ls)
    else
      (strlit"DEFAULT",default const_ls sensor_ls)`

val res = translate ctrl_monitor_def;

val actuate = process_topdecs`
  fun actuate str ctrl_ls =
    let val ctrl_vals = pack_w32_list ctrl_ls in
      #(actuate) str ctrl_vals
    end`

val _ = append_prog actuate;

val ctrl_monitor_1shot = process_topdecs`
  fun ctrl_monitor_1shot ctrl_phi const_names sensor_names ctrl_names default =
  let
    (* First read the constants and state *)
    val const_ls = get_const const_names
    val sensor_ls = get_sensor sensor_names
    val ctrl_ls = get_ctrl ctrl_names const_ls sensor_ls
  in
    case ctrl_monitor ctrl_phi const_names sensor_names ctrl_names
                        const_ls sensor_ls ctrl_ls default
    of
      (flg,ls) => actuate flg ls
  end`

val _ = append_prog ctrl_monitor_1shot;

(*
  The world model here is simplified.
  It has two parts:
   - The world_config is immutable, and visible to our program
   - The world_state is unknown, and gets seen by the FFI
   - The world_oracle gives the oracle transitions
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
    |>`

val _ = Datatype`
  world_oracle = <|
    ctrl_oracle   : num -> word32 list -> word32 list; (* A sequence of non-deterministic oracles *)
  |>`

val get_oracle_def = Define`
  get_oracle f = (f 0n,λn. f (n+1))`

val _ = Datatype`
  world = <| wc : world_config; ws : world_state ; wo : world_oracle|>`

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

val ctrl_sat_def = Define`
  ctrl_sat wc ws ctrl ⇔
  wfsem wc.ctrl_monitor
    (vars_to_state
    (wc.const_names ++ wc.sensor_names ++ wc.ctrl_names)
    (ws.const_vals  ++ ws.sensor_vals  ++ ctrl)) = SOME T`

(* In this model, the world ends if we call actuate
   but the monitor is not satisfied *)
val ffi_actuate_def = Define`
  ffi_actuate (conf:word8 list) (bytes:word8 list) (st:world) =
  if LENGTH bytes = 4 * (LENGTH st.wc.ctrl_names)
  then
    let ctrl = w8_to_w32 bytes in
      if ctrl_sat st.wc st.ws ctrl
      then SOME(bytes,st)
      else NONE
  else NONE`

val get_num_def = Define`
  (get_num (iNum n) = n) ∧
  (get_num _ = 0)`

val get_word32_def = Define`
  (get_word32 (iStr s) = (s2w 2 ORD s)) ∧
  (get_word32 _ = 0w:word32)`

val get_word32_list_def = Define`
  (get_word32_list (iList ls) = MAP get_word32 ls) /\
  (get_word32_list _ = [])`

val encode_ctrl_oracle_def = Define`
  encode_ctrl_oracle ctrl_oracle =
    Fun (λnum:ffi_inner.
    Fun (λw32ls:ffi_inner.
      encode_word32_list (ctrl_oracle (get_num num) (get_word32_list w32ls))))`

(* Encode world into the FFI type *)
val encode_def = Define`
  encode (w:world) =
    Cons (List (MAP (Str o explode) w.wc.const_names))
   (Cons (List (MAP (Str o explode) w.wc.sensor_names))
   (Cons (List (MAP (Str o explode) w.wc.ctrl_names))
   (Cons (encode_word32_list w.ws.const_vals)
   (Cons (encode_word32_list w.ws.sensor_vals)
   (Cons (encode_ctrl_oracle w.wo.ctrl_oracle)
   (encode_fml w.wc.ctrl_monitor))))))`

val comp_eq = map theorem ["world_component_equality",
                           "world_config_component_equality",
                           "world_state_component_equality",
                           "world_oracle_component_equality"];

val encode_word32_list_inner_def = Define`
  encode_word32_list = encode_list (Str o w2s 2 CHR)`

val encode_ctrl_oracle_11 = Q.prove(`
  encode_ctrl_oracle f = encode_ctrl_oracle f' ⇒
  f = f'`,
  rw[encode_ctrl_oracle_def]>>
  fs[FUN_EQ_THM]>>
  rw[]>>
  pop_assum (qspecl_then[`iNum x`,`iList (MAP (iStr o w2s 2 CHR) x')`] assume_tac)>>
  fs[get_num_def,get_word32_list_def,get_word32_def,MAP_MAP_o,o_DEF]>>
  `∀x:word32. s2w 2 ORD (w2s 2 CHR x)= x` by
     (rw[]>>match_mp_tac s2w_w2s>>fs[])>>
  fs[]>>
  metis_tac[encode_word32_list_11]);

val MAP_Str_explode_11 = Q.store_thm("MAP_Str_explode_11",`
  MAP (Str o explode) ls =
  MAP (Str o explode) ls' ==>
  ls = ls'`,
  fs[LIST_EQ_REWRITE]>>
  rw[]>>
  rfs[EL_MAP]>>
  metis_tac[mlstringTheory.explode_11]);

val encode_11 = Q.store_thm("encode_11",`
  ∀w w'.
  encode w' = encode w <=> w' = w`,
  fs[encode_def]>>
  rw[EQ_IMP_THM]>>fs comp_eq>>
  fs[encode_word32_list_11]>>
  rw[EQ_IMP_THM]>>fs[MAP_Str_explode_11,encode_ctrl_oracle_11,encode_fml_11])

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
       ("actuate",ffi_actuate);])`;

(* Well-formed worlds follow their config *)
val wf_world_def = Define`
  wf_world w ⇔
  LENGTH w.ws.const_vals = LENGTH w.wc.const_names ∧
  LENGTH w.ws.sensor_vals = LENGTH w.wc.sensor_names ∧
  (∀n inp.
    (*LENGTH inp = clen + slen ⇒ -- we could restrict it more... *)
    LENGTH (w.wo.ctrl_oracle n inp) = LENGTH w.wc.ctrl_names)`

val bot_st = get_ml_prog_state();

val IOBOT_def = Define `
  IOBOT w = IOx bot_ffi_part w * &wf_world w`

val _ = overload_on ("WORD32",``WORD:word32 -> v -> bool``);

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
  ctrl_sat w.wc w.ws ctrl_vals
  ⇒
  app (p:'ffi ffi_proj) ^(fetch_v "actuate" bot_st) [strngv;ctrlv]
    (IOBOT w)
    (POSTv u. IOBOT w * SEP_EXISTS av. W8ARRAY av (w32_to_w8 ctrl_vals))`,
  rw[]>>
  xcf"actuate" bot_st>>
  xlet_auto >- xsimpl>>
  simp[IOBOT_def]>>xpull>>
  xffi >> xsimpl>>
  simp[IOx_def,bot_ffi_part_def,mk_ffi_next_def]>>
  qmatch_goalsub_abbrev_tac`IO s u ns` >>
  map_every qexists_tac [`MAP (n2w o ORD) (explode strng)`,`emp`,`w32_to_w8 ctrl_vals`,`s`, `s`, `u`, `ns`] >>
  xsimpl >>
  unabbrev_all_tac>>
  simp[mk_ffi_next_def,ffi_actuate_def,w8_to_w32_w32_to_w8,LENGTH_w32_to_w8]>>
  qexists_tac`av`>>xsimpl>>
  fs[]>>
  Cases_on`strng`>>fs[ml_translatorTheory.STRING_TYPE_def,string_ID]);

(* We assume that the default function always works in the current world
   This is a really strong assumption, it really ought to work in all
   world_configs rather than all worlds
*)
val good_default_def = Define`
  good_default default w ⇔
  (* Any valuation satisfying the const and sensor lengths *)
  let def_ctrl = default w.ws.const_vals w.ws.sensor_vals in
  LENGTH def_ctrl = LENGTH w.wc.ctrl_names ∧
  ctrl_sat w.wc w.ws def_ctrl`

val good_default_IMP = Q.prove(`
  ∀ls w.
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

val ctrl_monitor_1shot_spec = Q.store_thm("ctrl_monitor_1shot_spec",`
  (* These specify what the inputs should be *)
  MONITORPROG_FML_TYPE w.wc.ctrl_monitor fv ∧
  LIST_TYPE STRING_TYPE w.wc.const_names const_namesv ∧
  LIST_TYPE STRING_TYPE w.wc.sensor_names sensor_namesv ∧
  LIST_TYPE STRING_TYPE w.wc.ctrl_names ctrl_namesv ∧
  (LIST_TYPE WORD32 -->
  LIST_TYPE WORD32 -->
  LIST_TYPE WORD32) def defv ∧
  good_default def w ⇒
  app (p:'ffi ffi_proj) ^(fetch_v "ctrl_monitor_1shot" bot_st)
    [fv;const_namesv;sensor_namesv;ctrl_namesv;defv]
  (IOBOT w)
  (POSTv u. IOBOT (w with
      wo := w.wo with ctrl_oracle := (λn. w.wo.ctrl_oracle (n + 1))))`,
  rw[]>>
  xcf "ctrl_monitor_1shot" bot_st>>
  drule get_const_spec >> strip_tac>>
  xlet_auto>- xsimpl>>
  drule get_sensor_spec >> strip_tac>>
  xlet_auto>- xsimpl>>
  drule get_ctrl_spec >> rpt(disch_then drule)>> strip_tac>>
  xlet_auto>- (xsimpl>>metis_tac[])>>
  qmatch_goalsub_abbrev_tac`IOBOT w'`>>
  fs[]>>
  xlet_auto>- xsimpl>>
  drule good_default_IMP>>
  disch_then (qspec_then`vv` assume_tac)>>
  rfs[]>>
  qmatch_asmsub_abbrev_tac`PAIR_TYPE _ _ fls _`>>
  Cases_on`fls`>>   fs[ml_translatorTheory.PAIR_TYPE_def,markerTheory.Abbrev_def]>>
  xmatch>>
  simp[IOBOT_def]>>xpull>>
  xapp>> xsimpl>>
  rfs[wf_world_def]>>fs[]>>
  qpat_x_assum`LENGTH r = _` assume_tac>>
  qexists_tac`emp`>>qexists_tac`w'`>>simp[]>>
  asm_exists_tac>>simp[]>>
  asm_exists_tac>>simp[]>>
  fs[IOBOT_def]>>xsimpl>>
  fs[wf_world_def]);

val _ = export_theory();
