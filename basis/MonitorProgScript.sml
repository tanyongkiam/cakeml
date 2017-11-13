open preamble ml_progLib ml_translatorLib
open blastLib
open cfTacticsLib
open TextIOProgTheory ml_translatorTheory basisFunctionsLib

val _ = new_theory "MonitorProg";

(*
  This first section defines a copy of the interpreter for formulas
  from the Isabelle/HOL formalization
*)

val NEG_INF = (rconc o EVAL) ``((INT_MINw: 32 word) + 1w)``
val POS_INF = (rconc o EVAL) ``((INT_MAXw: 32 word) )``

val NEG_INF_def = Define`NEG_INF:word32 = ^NEG_INF`
val POS_INF_def = Define`POS_INF:word32 = ^POS_INF`

(*
  Note: this includes the constant INT_MINw which is interpreted as the interval
  (-INF,INF)
  All other constants are interpreted as in the Isabelle formalization e.g.
  -INF is interpreted as (-INF,-INF)
*)
val _ = Datatype`
  trm = Const word32
      | Var mlstring
      | Plus trm trm
      | Times trm trm
      | Max trm trm
      | Min trm trm
      | Neg trm`

val _ = Datatype`
  fml = Le trm trm
      | Leq trm trm
      | Equals trm trm
      | And fml fml
      | Or fml fml
      | Not fml`

val _ = Datatype`
   hp = Test fml
      | Seq hp hp
      | Assign num trm
      | Choice hp hp`

(*
val _ = overload_on ("+",Term `Plus`)
val _ = add_infix ("+", 580, HOLgrammars.LEFT)

val _ = overload_on ("*",Term `Times`)
val _ = add_infix ("*", 580, HOLgrammars.LEFT)

val _ = overload_on ("&&", Term `And`)
val _ = add_infix ("&&", 580, HOLgrammars.LEFT)

val _ = overload_on ("||", Term `Or`)
val _ = add_infix ("||", 440, HOLgrammars.LEFT)

val _ = overload_on ("==", Term `Equals`)
val _ = add_infix ("==", 450, HOLgrammars.NONASSOC)

val _ = overload_on ("<", Term `Le`)
val _ = add_infix ("<", 450, HOLgrammars.NONASSOC)

val _ = overload_on ("<=", Term `Leq`)
val _ = add_infix ("<=", 450, HOLgrammars.NONASSOC)
*)

val round_to_inf_def = Define`
  round_to_inf (w:word64) =
    if w ≤ sw2sw NEG_INF then NEG_INF
    else if
      sw2sw POS_INF ≤ w then POS_INF
    else
      w2w w`

val pu_def = Define`
  pu (w1:word32) (w2:word32) =
  if w1 = POS_INF ∨ w2 = POS_INF
  then POS_INF
  else
    let s:word64 = sw2sw w1 + sw2sw w2 in
    round_to_inf s`

val pl_def = Define`
  pl (w1:word32) (w2:word32) =
  if w1 = NEG_INF ∨ w2 = NEG_INF then NEG_INF
  else
  let s:word64 = sw2sw w1 + sw2sw w2 in
  round_to_inf s`

val wmax_def = Define`
  wmax (w1:word32) (w2:word32) = if w1 < w2 then w2 else w1`

val wtimes_def = Define`
  wtimes (w1:word32) (w2:word32) =
  let prod = sw2sw w1 * sw2sw w2 in round_to_inf prod`

(* Checking the simplification
EVAL``wtimes POS_INF POS_INF = POS_INF``
EVAL``wtimes NEG_INF POS_INF = NEG_INF``
EVAL``wtimes POS_INF NEG_INF = NEG_INF``
EVAL``wtimes NEG_INF NEG_INF = POS_INF``

EVAL``wtimes POS_INF (-1w) = NEG_INF``
EVAL``wtimes POS_INF (1w) = POS_INF``
EVAL``wtimes POS_INF 0w = 0w``
EVAL``wtimes NEG_INF (-1w) = POS_INF``
EVAL``wtimes NEG_INF (1w) = NEG_INF``
EVAL``wtimes NEG_INF 0w = 0w``

EVAL``wtimes (-1w) POS_INF = NEG_INF``
EVAL``wtimes (1w) POS_INF = POS_INF``
EVAL``wtimes 0w POS_INF = 0w``
EVAL``wtimes (-1w) NEG_INF = POS_INF``
EVAL``wtimes (1w) NEG_INF = NEG_INF``
EVAL``wtimes 0w NEG_INF = 0w``
*)

val tu_def = Define`
  tu w1l w1u w2l w2u =
  wmax (wmax (wtimes w1l w2l) (wtimes w1u w2l))
       (wmax (wtimes w1l w2u) (wtimes w1u w2u))`

val wmin_def = Define`
  wmin (w1:word32) (w2:word32) = if w1 < w2 then w1 else w2`

val tl_def = Define`
  tl w1l w1u w2l w2u =
  wmin (wmin (wtimes w1l w2l) (wtimes w1u w2l))
       (wmin (wtimes w1l w2u) (wtimes w1u w2u))`

val wneg_def = Define`
  wneg w =
  if w = NEG_INF then POS_INF
  else if w = POS_INF then NEG_INF
  else -w`;

(* States are represented as an association list of
  strings -> (w32,w32) *)
val _ = type_abbrev ("wstate",``:(mlstring,word32 # word32) alist``)

(* Differences from Isabelle formalization:
   The state is a finite map -- when Var n is not in the map, we assume that
   it is in the interval (-Inf,Inf)
*)

val wtsem_def = Define`
  (wtsem (Const w) (s:wstate) =
     if NEG_INF ≤ w ∧ w ≤ POS_INF then (w,w)
     else (NEG_INF,POS_INF)) ∧
  (wtsem (Var n) s =
    case ALOOKUP s n of
      NONE => (NEG_INF,POS_INF)
    | SOME i => i) ∧
  (wtsem (Plus t1 t2) s =
    let (l1,u1) = wtsem t1 s in
    let (l2,u2) = wtsem t2 s in
    (pl l1 l2, pu u1 u2)) ∧
  (wtsem (Times t1 t2) s =
    let (l1,u1) = wtsem t1 s in
    let (l2,u2) = wtsem t2 s in
    (tl l1 u1 l2 u2, tu l1 u1 l2 u2)) ∧
  (wtsem (Max t1 t2) s =
    let (l1,u1) = wtsem t1 s in
    let (l2,u2) = wtsem t2 s in
    (wmax l1 l2, wmax u1 u2)) ∧
  (wtsem (Min t1 t2) s =
    let (l1,u1) = wtsem t1 s in
    let (l2,u2) = wtsem t2 s in
    (wmin l1 l2, wmin u1 u2)) ∧
  (wtsem (Neg t) s =
    let (l,u) = wtsem t s in
    (wneg u, wneg l))`

val wle_def = Define`
  wle (w1:word32) w2 <=> w1 < w2`

val wleq_def = Define`
  wleq (w1:word32) w2 <=>
  ¬ (w1 = NEG_INF ∧ w2 = NEG_INF) ∧
  ¬ (w2 = POS_INF ∧ w2 = POS_INF) ∧
  w1 <= w2`

(* We use a tri-valued logic for wfsem instead of an underspecified relation *)

val wfsem_def = Define`
  (wfsem (Le t1 t2) (s:wstate) =
  let (l1,u1) = wtsem t1 s in
  let (l2,u2) = wtsem t2 s in
  if wle u1 l2 then SOME T
  else if wleq u2 l1 then SOME F
  else NONE) ∧
  (wfsem (Leq t1 t2) s =
  let (l1,u1) = wtsem t1 s in
  let (l2,u2) = wtsem t2 s in
  if wleq u1 l2 then SOME T
  else if wle u2 l1 then SOME F
  else NONE) ∧
  (wfsem (Equals t1 t2) s =
  let (l1,u1) = wtsem t1 s in
  let (l2,u2) = wtsem t2 s in
  if l2 = u2 ∧ u2 = u1 ∧ u1 = l1 ∧ l2 ≠ NEG_INF ∧ l2 ≠ POS_INF then SOME T
  else if wle u1 l2 then SOME F
  else if wle u2 l1 then SOME F
  else NONE) ∧
  (wfsem (And f1 f2) s =
  case (wfsem f1 s, wfsem f2 s) of
    SOME T, SOME T => SOME T
  | SOME F, _ => SOME F
  | _, SOME F => SOME F
  | _ => NONE) ∧
  (wfsem (Or f1 f2) s =
  case (wfsem f1 s, wfsem f2 s) of
    SOME T, _ => SOME T
  | _, SOME T => SOME T
  | SOME F, SOME F => SOME F
  | _ => NONE) ∧
  (wfsem (Not f) s =
  case wfsem f s of
    SOME F => SOME T
  | SOME T => SOME F
  | _ => NONE)`

(* Return to the bivalued logic *)
val wfsem_bi_val_def = Define`
  wfsem_bi_val f s =
  case wfsem f s of
    NONE => F
  | SOME F => F
  | SOME T => T`

(* End of pure monitor stuff *)

(*
  Translation of the monitors into CML
*)

val _ = translation_extends"TextIOProg";

val _ = ml_prog_update (open_module "Monitor");

val spec32 = INST_TYPE[alpha|->``:32``]
val spec64= INST_TYPE[alpha|->``:64``]
val gconv = CONV_RULE (DEPTH_CONV wordsLib.WORD_GROUND_CONV)
val econv = CONV_RULE wordsLib.WORD_EVAL_CONV

val word_msb_rw32 = Q.prove(
  `word_msb (a:word32) ⇔ (a>>>31) <> 0w`,
  rw[word_msb_def,fcpTheory.CART_EQ,word_index,word_lsr_def,fcpTheory.FCP_BETA]
  \\ rw[EQ_IMP_THM]
  >- ( qexists_tac`0` \\ simp[] )
  \\ `i = 0` by decide_tac \\ fs[]);

val word_msb_rw64 = Q.prove(
  `word_msb (a:word64) ⇔ (a>>>63) <> 0w`,
  rw[word_msb_def,fcpTheory.CART_EQ,word_index,word_lsr_def,fcpTheory.FCP_BETA]
  \\ rw[EQ_IMP_THM]
  >- ( qexists_tac`0` \\ simp[] )
  \\ `i = 0` by decide_tac \\ fs[]);

val inlines = SIMP_RULE std_ss [NEG_INF_def,POS_INF_def,sw2sw_w2w,word_msb_rw32,word_msb_rw64,word_mul_def,word_2comp_def]

val res = translate (integer_wordTheory.WORD_LTi |> spec32)
val res = translate (integer_wordTheory.WORD_LEi |> spec32)
val res = translate (integer_wordTheory.WORD_LEi |> spec64)
val res = translate lookup_def;
val res = translate (round_to_inf_def |> inlines |> econv);

val res = translate (pl_def |> inlines |> econv);
val res = translate (pu_def |> inlines |> econv);
val res = translate (wmin_def |> inlines |> econv);
val res = translate (wmax_def |> inlines |> econv);
val res = translate (wtimes_def |> inlines |> econv);
val res = translate (tl_def |> inlines |> econv);
val res = translate (tu_def |> inlines |> econv);
val res = translate (wneg_def |> inlines |> econv);
val res = translate (wtsem_def |> inlines);
val res = translate (wle_def |> inlines);
val res = translate (wleq_def |> inlines);
val res = translate (wfsem_def|>inlines);
val res = translate (wfsem_bi_val_def|>inlines);

(* The rest of these are wrappers around the monitors *)

(* Converts 4 bytes in little endian order into a 32bit word *)
val le_bytes_to_w32_def = Define`
  le_bytes_to_w32 (b0:word8) (b1:word8) (b2:word8) (b3:word8) =
  (w2w b3):word32 << 24 + (w2w b2) << 16 + (w2w b1) << 8 + (w2w b0)`

(* Converts 32bit word into 4 bytes in little endian order *)
val w32_to_le_bytes_def = Define`
  w32_to_le_bytes (w:word32) =
  ((7 >< 0) w, (15 >< 8) w, (23 >< 16) w, (31 >< 24) w):(word8# word8 # word8 #word8)`

val res = translate (le_bytes_to_w32_def)
val res = translate (w32_to_le_bytes_def |> SIMP_RULE std_ss [word_extract_w2w_mask] |> gconv)

(* Functions for packing and unpacking word32 lists into byte arrays
   and vice versa *)
val pack_w32_list = process_topdecs
  `fun pack_w32_list l =
    let fun f arr l i =
       case l of
          [] => arr
        | (w::ws) =>
        (case w32_to_le_bytes w of
        (b0,bs) =>
        case bs of (b1,bs) =>
        case bs of (b2,b3) =>
        (Word8Array.update arr i b0;
        Word8Array.update arr (i+1) b1;
        Word8Array.update arr (i+2) b2;
        Word8Array.update arr (i+3) b3;
        f arr ws (i + 4)))
    in
      f (Word8Array.array (4 * List.length l) (Word8.fromInt 0)) l 0
    end`;

val _ = append_prog pack_w32_list;

val unpack_w32_list = process_topdecs
  `fun unpack_w32_list arr =
    let fun f arr i lim =
       if i + 4 <= lim then
         (le_bytes_to_w32
         (Word8Array.sub arr i)
         (Word8Array.sub arr (i+1))
         (Word8Array.sub arr (i+2))
         (Word8Array.sub arr (i+3)))::(f arr (i+4) lim)
       else
         []
    in
      f arr 0 (Word8Array.length arr)
    end;`

val _ = append_prog unpack_w32_list

(* Helper function to handoff a state to the monitor *)

val vars_to_state_def = Define`
  (vars_to_state [] [] = []:wstate) ∧
  (vars_to_state (x::xs) (v:word32::vs) = ((x, (v,v))::vars_to_state xs vs)) ∧
  (vars_to_state [] _ = []) ∧
  (vars_to_state _ [] = [])`

val res = translate vars_to_state_def;

(* Now we define the various monitoring wrappers *)

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
      (strlit"Control Violation",default const_ls sensor_ls)`

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

val _ = ml_prog_update (close_module NONE);

val _ = export_theory();
