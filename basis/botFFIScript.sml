open preamble mlstringTheory cfHeapsBaseTheory
open MonitorProgTheory

val _ = new_theory"botFFI"

(*
  This is our logical world model for the control/plant model
  We don't need the full model for the 1shot controller monitor or loop controller monitor
  However, we have included everything into the world model

  The world model has three parts:
   - The world_config is an immutable configuration for the world.
   - The world_state is unknown, and gets seen by the FFI
   - The world_oracle gives the oracle transitions
*)

val _ = Datatype`
  world_config = <|
    const_names        : mlstring list;
    sensor_pre_names   : mlstring list;
    sensor_names       : mlstring list;
    ctrl_names         : mlstring list;
    init               : fml;
    ctrl_monitor       : fml;
    plant_monitor      : fml;
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

(* flatten 4 tuples *)
val FLAT_TUP_def = Define`
  (FLAT_TUP [] = []) ∧
  (FLAT_TUP ((b0,b1,b2,b3)::bs) = [b0;b1;b2;b3]++FLAT_TUP bs)`

(* Consume a list 4 elements at a time *)
val MAP4_def = Define`
  (MAP4 f (a::b::c::d::ls) = f a b c d :: MAP4 f ls) ∧
  (MAP4 f ls = [])`

val w32_to_w8_def = Define`
  w32_to_w8 ls = FLAT_TUP (MAP w32_to_le_bytes ls)`

val w8_to_w32_def = Define`
  w8_to_w32 ls = MAP4 le_bytes_to_w32 ls`

val get_oracle_def = Define`
  get_oracle f = (f 0n,λn. f (n+1))`

val ffi_get_const_def = Define`
  ffi_get_const (conf:word8 list) (bytes:word8 list) (st:world) =
  if LENGTH bytes = 4 * LENGTH st.wc.const_names ∧
     (* This second check is added for parts_ok *)
     LENGTH st.wc.const_names = LENGTH st.ws.const_vals
  then
    SOME (w32_to_w8 st.ws.const_vals,st)
  else
    NONE`

val ffi_get_sensor_def = Define`
  ffi_get_sensor (conf:word8 list) (bytes:word8 list) (st:world) =
  if LENGTH bytes = 4 * LENGTH st.wc.sensor_names ∧
     LENGTH st.wc.sensor_names = LENGTH st.ws.sensor_vals
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
    if LENGTH w8s = LENGTH bytes
    then
      SOME (w8s,st with wo := new_wo)
    else
      NONE
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

(* This section defines an encoding of the world into CakeML's 'ffi type *)

(* Turn a word32 list into a list of strings invertibly *)
val w2sCHR_11 = Q.store_thm("w2sCHR_11",`
  w2s 2 CHR c = w2s 2 CHR c' ⇒ c = c'`,
  rw[]>>
  qsuff_tac `∀h. s2w 2 ORD (w2s 2 CHR h) = h` >>fs[]
  >-
    metis_tac[]
  >>
    rw[]>>match_mp_tac s2w_w2s>>simp[]);

val encode_word32_list_def = Define`
  encode_word32_list = encode_list (Str o w2s 2 CHR)`

val encode_word32_list_11 = Q.store_thm("encode_word32_list_11",`
  !x y. encode_word32_list x = encode_word32_list y <=> x = y`,
  Induct \\ Cases_on `y`
  \\ fs [encode_word32_list_def,encode_list_def]
  \\ metis_tac[w2sCHR_11]);

val decode_encode_word32_list = new_specification("decode_encode_word32_list",["decode_word32_list"],
  prove(``?decode_word32_list. !cls. decode_word32_list (encode_word32_list cls) = SOME cls``,
        qexists_tac `\f. some c. encode_word32_list c = f` \\ fs [encode_word32_list_11]));
val _ = export_rewrites ["decode_encode_word32_list"];

val encode_trm_def = Define`
  (encode_trm (Const w) = Cons (Num 0) (Str (w2s 2 CHR w))) ∧
  (encode_trm (Var s) = Cons (Num 1) (Str (explode s))) ∧
  (encode_trm (Plus t1 t2) = Cons (Num 2) (Cons (encode_trm t1) (encode_trm t2))) ∧
  (encode_trm (Times t1 t2) = Cons (Num 3) (Cons (encode_trm t1) (encode_trm t2))) ∧
  (encode_trm (Max t1 t2) = Cons (Num 4) (Cons (encode_trm t1) (encode_trm t2))) ∧
  (encode_trm (Min t1 t2) = Cons (Num 5) (Cons (encode_trm t1) (encode_trm t2))) ∧
  (encode_trm (Neg t) = Cons (Num 6) (encode_trm t))`

val encode_trm_11 = Q.store_thm("encode_trm_11",`
  ∀x y. encode_trm x = encode_trm y <=> x = y`,
  Induct>>Cases_on`y`>>rw[encode_trm_def]>>
  fs[mlstringTheory.explode_11]>>
  metis_tac[w2sCHR_11]);

val decode_encode_trm = new_specification("decode_encode_trm",["decode_trm"],
  prove(``?decode_trm. !cls. decode_trm (encode_trm cls) = SOME cls``,
        qexists_tac `\f. some c. encode_trm c = f` \\ fs [encode_trm_11]));
val _ = export_rewrites ["decode_encode_trm"];

val encode_fml_def = Define`
  (encode_fml (Le t1 t2) = Cons (Num 0) (Cons (encode_trm t1) (encode_trm t2))) ∧
  (encode_fml (Leq t1 t2) = Cons (Num 1) (Cons (encode_trm t1) (encode_trm t2))) ∧
  (encode_fml (Equals t1 t2) = Cons (Num 2) (Cons (encode_trm t1) (encode_trm t2))) ∧
  (encode_fml (And f1 f2) = Cons (Num 3) (Cons (encode_fml f1) (encode_fml f2))) ∧
  (encode_fml (Or f1 f2) = Cons (Num 4) (Cons (encode_fml f1) (encode_fml f2))) ∧
  (encode_fml (Not f) = Cons (Num 5) (encode_fml f))`

val encode_fml_11 = Q.store_thm("encode_fml_11",`
  ∀x y. encode_fml x = encode_fml y <=> x = y`,
  Induct>>Cases_on`y`>>rw[encode_fml_def]>>
  metis_tac[encode_trm_11]);

val decode_encode_fml = new_specification("decode_encode_fml",["decode_fml"],
  prove(``?decode_fml. !cls. decode_fml (encode_fml cls) = SOME cls``,
        qexists_tac `\f. some c. encode_fml c = f` \\ fs [encode_fml_11]));
val _ = export_rewrites ["decode_encode_fml"];

val encode_world_config_def = Define`
  encode_world_config wc =
   Cons (List (MAP (Str o explode) wc.const_names))
   (Cons (List (MAP (Str o explode) wc.sensor_pre_names))
   (Cons (List (MAP (Str o explode) wc.sensor_names))
   (Cons (List (MAP (Str o explode) wc.ctrl_names))
   (Cons (encode_fml wc.init)
   (Cons (encode_fml wc.ctrl_monitor)
   (encode_fml wc.plant_monitor))))))`

val MAP_Str_explode_11 = Q.store_thm("MAP_Str_explode_11",`
  MAP (Str o explode) ls =
  MAP (Str o explode) ls' ==>
  ls = ls'`,
  fs[LIST_EQ_REWRITE]>>
  rw[]>>
  rfs[EL_MAP]>>
  metis_tac[mlstringTheory.explode_11]);

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

(* Now we encode the oracles *)
val get_num_def = Define`
  (get_num (iNum n) = n) ∧
  (get_num _ = 0)`

val get_word32_def = Define`
  (get_word32 (iStr s) = (s2w 2 ORD s)) ∧
  (get_word32 _ = 0w:word32)`

val get_word32_list_def = Define`
  (get_word32_list (iList ls) = MAP get_word32 ls) /\
  (get_word32_list _ = [])`

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

val encode_ctrl_oracle_def = Define`
  encode_ctrl_oracle ctrl_oracle =
    Fun (λnum:ffi_inner.
    Fun (λw32ls:ffi_inner.
      encode_word32_list (ctrl_oracle (get_num num) (get_word32_list w32ls))))`

val encode_ctrl_oracle_11 = Q.store_thm("encode_ctrl_oracle_11",`
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

val LENGTH_w32_to_w8 = Q.store_thm("LENGTH_w32_to_w8",`
  ∀ls. LENGTH (w32_to_w8 ls) = 4* LENGTH ls`,
  Induct>>fs[w32_to_w8_def,FLAT_TUP_def,w32_to_le_bytes_def]);

(* Needed for parts_ok *)
val bot_ffi_LENGTH = Q.store_thm("bot_ffi_LENGTH",`
  (ffi_get_const conf bytes w = SOME (bytes',w') ⇒ LENGTH bytes' = LENGTH bytes) ∧
  (ffi_get_sensor conf bytes w = SOME (bytes',w') ⇒ LENGTH bytes' = LENGTH bytes) ∧
  (ffi_get_control conf bytes w = SOME (bytes',w') ⇒ LENGTH bytes' = LENGTH bytes) ∧
  (ffi_actuate conf bytes w = SOME (bytes',w') ⇒ LENGTH bytes' = LENGTH bytes) ∧
  (ffi_has_next conf bytes w = SOME (bytes',w') ⇒ LENGTH bytes' = LENGTH bytes) ∧
  (ffi_violation conf bytes w = SOME (bytes',w') ⇒ LENGTH bytes' = LENGTH bytes)`,
  rw[ffi_get_const_def,ffi_get_sensor_def,ffi_get_control_def,ffi_actuate_def,ffi_has_next_def,ffi_violation_def]>>
  rpt(pairarg_tac>>fs[])>>rw[]>>
  fs[LENGTH_w32_to_w8]);

val _ = export_theory();
