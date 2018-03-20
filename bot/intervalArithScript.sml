open preamble

val _ = new_theory "intervalArith";

(*
  Define a copy of the word arithmetic semantics
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
      | Var string (* TODO: this could also use the faster mlstring *)
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

(* The discrete fragment of hybrid programs we need for sandboxes *)
val _ = Datatype`
   hp = Test fml
      | Assign string (trm option)
      | Seq hp hp
      | Choice hp hp
      | Loop hp`

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
val _ = type_abbrev ("wstate",``:(string,word32 # word32) alist``)

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

val _ = Datatype`
   hp = Test fml
      | Assign string (trm option)
      | Seq hp hp
      | Choice hp hp
      | Loop hp`

(* The non-deterministic big-step relational semantics of hybrid programs *)
val (wpsem_rules,wpsem_ind, wpsem_cases) = Hol_reln`
  (* Non-deterministic assignment *)
  (∀x a b w v.
  wleq a b ∧
  (∀y. ALOOKUP v y =
    if y = x then SOME (a,b) else ALOOKUP w y) ⇒
  wpsem (Assign x NONE) w v) ∧
  (* Deterministic assignment *)
  (∀x t w v.
  (∀y. ALOOKUP v y =
    if y = x then SOME (wtsem t w) else ALOOKUP w y) ⇒
  wpsem (Assign x (SOME t)) w v) ∧
  (∀f w.
    wfsem f w = SOME T ⇒
    wpsem (Test f) w w) ∧
  (∀a b w u v.
    wpsem a w u ∧
    wpsem b u v ⇒
    wpsem (Seq a b) w v) ∧
  (∀a b w v.
    wpsem a w v ⇒
    wpsem (Choice a b) w v) ∧
  (∀a b w v.
    wpsem b w v ⇒
    wpsem (Choice a b) w v) ∧
  (∀a w.
    wpsem (Loop a) w w) ∧
  (∀a w.
    wpsem a w u ∧
    wpsem (Loop a) u v ⇒
    wpsem (Loop a) w v)`

(* Free variables *)
val fv_trm_def = Define`
  (fv_trm (Const _) = []) ∧
  (fv_trm (Var x) = [x]) ∧
  (fv_trm (Plus t1 t2) = fv_trm t1 ++ fv_trm t2) ∧
  (fv_trm (Times t1 t2) = fv_trm t1 ++ fv_trm t2) ∧
  (fv_trm (Max t1 t2) = fv_trm t1 ++ fv_trm t2) ∧
  (fv_trm (Min t1 t2) = fv_trm t1 ++ fv_trm t2) ∧
  (fv_trm (Neg t) = fv_trm t)`

val fv_fml_def = Define`
  (fv_fml (Le t1 t2) = fv_trm t1 ++ fv_trm t2) ∧
  (fv_fml (Leq t1 t2) = fv_trm t1 ++ fv_trm t2) ∧
  (fv_fml (Equals t1 t2) = fv_trm t1 ++ fv_trm t2) ∧
  (fv_fml (And f1 f2) = fv_fml f1 ++ fv_fml f2) ∧
  (fv_fml (Or f1 f2) = fv_fml f1 ++ fv_fml f2) ∧
  (fv_fml (Not f) = fv_fml f)`

(* Term Coincidence *)
val fv_trm_coincide = Q.store_thm("fv_trm_coincide",`
  ∀t w v.
  EVERY (λx. ALOOKUP w x = ALOOKUP v x) (fv_trm t) ⇒
  wtsem t w = wtsem t v`,
  Induct>>fs[fv_trm_def,wtsem_def]>>rw[]>>
  rpt(pairarg_tac>>fs[])>>
  metis_tac[PAIR,FST,SND]);

(* Formula Coincidence *)
val fv_fml_coincide = Q.store_thm("fv_fml_coincide",`
  ∀f w v.
  EVERY (λx. ALOOKUP w x = ALOOKUP v x) (fv_fml f) ⇒
  wfsem f w = wfsem f v`,
  Induct>>fs[fv_fml_def,wfsem_def]>>rw[]>>
  rpt(pairarg_tac>>fs[])>>rw[]>>
  metis_tac[PAIR,FST,SND,fv_trm_coincide]);

val _ = export_theory();
