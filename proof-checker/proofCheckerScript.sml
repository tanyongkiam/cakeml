open preamble

val _ = new_theory "proofChecker";

(* The base enumeration type for 'c *)
val _ = Datatype`
  vars =
  | i1
  | i2
  | i3
  | i4
  | i5
  | i6
  | i7
  | i8
  | i9
  | i10
  | i11
  | i12
  | i13
  | i14
  | i15
  | i16
  | i17
  | i18
  | i19
  | i20`

(*
  We manually instantiate 'c -> vars
  Throughout the development to avoid type class issues
*)
val varls_def = Define`
  varls = [i1;i2;i3;i4;i5;i6;i7;i8;i9;i10;i11;i12;i13;i14;i15;i16;i17;i18;i19;i20]`

val var_to_el_def = Define`
  (var_to_el i1 = 0n) ∧
  (var_to_el i2 = 1) ∧
  (var_to_el i3 = 2) ∧
  (var_to_el i4 = 3) ∧
  (var_to_el i5 = 4) ∧
  (var_to_el i6 = 5) ∧
  (var_to_el i7 = 6) ∧
  (var_to_el i8 = 7) ∧
  (var_to_el i9 = 8) ∧
  (var_to_el i10 = 9) ∧
  (var_to_el i11 = 10) ∧
  (var_to_el i12 = 11) ∧
  (var_to_el i13 = 12) ∧
  (var_to_el i14 = 13) ∧
  (var_to_el i15 = 14) ∧
  (var_to_el i16 = 15) ∧
  (var_to_el i17 = 16) ∧
  (var_to_el i18 = 17) ∧
  (var_to_el i19 = 18) ∧
  (var_to_el i20 = 19)`

(* Technically, the Isabelle/HOL formalization excludes one word from word32 *)
val _ = type_abbrev ("word",``:word32``);

val _ = Datatype`
  trm =
    Var vars
  | Const word
  | Function 'a (trm list) (* must have length matching varls *)
  | Functional 'a
  | Plus trm trm
  | Times trm trm
  | Neg trm
  | Max trm trm
  | Min trm trm
  | Abs trm
  | DiffVar vars
  | Differential trm`

val _ = type_abbrev ("space",``:vars option``);

val _ = Datatype`
  ODE =
    OVar vars space
  | OSing vars ('a trm)
  | OProd ODE ODE`

(* The HP and formulas in mutual induction *)
val _ = Datatype`
  hp =
    Pvar vars
  | Assign vars ('a trm)
  | AssignAny vars
  | DiffAssign vars ('a trm)
  | Test formula
  | EvolveODE ('a ODE) formula
  | Choice hp hp
  | Sequence hp hp
  | Loop hp
  ;
  formula =
    Geq ('a trm) ('a trm)
  | Prop vars ('a trm list) (* vars -> ('a,vars) trm *)
  | Not formula
  | And formula formula
  | Exists vars formula
  | Diamond hp formula
  | InContext 'b formula`

(* Derived forms *)
val DFunl_def = Define`
  DFunl fid = Function fid (MAP Var varls)`

val DPredl_def = Define`
  DPredl fid = Prop fid (MAP Var varls)`

val Minus_def = Define`
  Minus t1 t2 = Plus t1 (Neg t2)`

val Or_def = Define`
  Or P Q = Not (And (Not P) (Not Q))`

val Implies_def = Define`
  Implies P Q = Or Q (Not P)`

val Equiv_def = Define`
  Equiv P Q = Or (And P Q) (And (Not P) (Not Q))`

val Forall_def = Define`
  Forall x P = Not (Exists x (Not P))`

val Equals_def = Define`
  Equals t1 t2 = And (Geq t1 t2) (Geq t2 t1)`

val NotEquals_def = Define`
  NotEquals t1 t2 = Not (And (Geq t1 t2) (Geq t2 t1))`

val Greater_def = Define`
  Greater t1 t2 = Not (Geq t2 t1)`

val Less_def = Define`
  Less t1 t2 = Not (Geq t1 t2)`

val Leq_def = Define`
  Leq t1 t2 = Geq t2 t1`

val Box_def = Define`
  Box a P = Not (Diamond a (Not P))`

val TT_def = Define`
  TT = Geq (Const 0w) (Const 0w)`

val FF_def = Define`
  FF = Geq (Const 0w) (Const 1w)`

val _ = Datatype`
  ids_loc = <|
           vid1 : vars;
           vid2 : vars;
           vid3 : vars;
           is_vid1 : vars -> bool;

           fid1 : 'a;
           fid2 : 'a;
           fid3 : 'a;

           pid1 : 'b;
           pid2 : 'b;
           pid3 : 'b;
           pid4 : 'b|>`

(* More defs from Syntax.thy *)
val Predicational_def = Define`
  Predicational P = InContext P (Geq (Const 0w) (Const 0w))`

val _ = Parse.overload_on ("Pc",``Predicational``);

val singleton_def = Define`
  singleton ids t = MAP (λi. if ids.is_vid1 i then t else Const 0w) varls`

val empty_def = Define`
  empty = MAP (λv. Const 0w) varls`

val oprod_def = Define`
  (oprod (OSing x t) ODE2 = (OProd (OSing x t) ODE2)) ∧
  (oprod (OVar c d) ODE2 = (OProd (OVar c d) ODE2)) ∧
  (oprod (OProd ll lr) ODE2 = oprod ll (oprod lr ODE2))`

(* Substitutions *)
val _ = Datatype`
  subst =
  <| SFunctions  : 'a -> ('a + vars) trm option;
     SFunls      : 'a -> 'a trm option;
     SPredicates : vars -> ('a + vars, 'b) formula option;
     SContexts   : 'b -> ('a, 'b + unit) formula option;
     SPrograms   : vars -> ('a, 'b) hp option;
     SODEs       : vars -> space -> 'a ODE option |>`

(* Proof Checker Implementation *)
val _ = Datatype`
  rrule =
    ImplyR | AndR | CohideRR | TrueR | EquivR | Skolem | NotR
  | HideR | CutRight (('a,'b) formula) | EquivifyR | CommuteEquivR | BRenameR vars vars`

val _ = Datatype`
  lrule =
    ImplyL | AndL | HideL
  | NotL | CutLeft (('a,'b) formula) | EquivL | BRenameL vars vars`

val _ = Datatype`
  axRule =
    CQ | CE | G | monb`

val _ = Datatype`
  axiom =
    AloopIter | AI | Atest | Abox | Achoice | AK | AV | Aassign | Adassign
  | Advar | AdConst | AdPlus | AdMult
  | ADW |ADE | ADC | ADS
  | AEquivReflexive | ADiffEffectSys
  | AAllElim | ADiffLinear | AboxSplit | AImpSelf | Acompose | AconstFcong | AdMinus | AassignEq | AallInst
  | AassignAny | AequalCommute`

val _ = Datatype`
  ruleApp =
    URename vars vars
  | RightRule (('a,'b) rrule) num
  | LeftRule (('a,'b) lrule) num
  | CloseId num num
  | Cohide2 num num
  | Cut (('a,'b) formula)
  | DIGeqSchema ('a ODE) ('a trm) ('a trm)
  | DIGrSchema ('a ODE) ('a trm) ('a trm)
  | DIEqSchema ('a ODE) ('a trm) ('a trm)`

val _ = type_abbrev ("sequent",``: ('a,'b) formula list # ('a,'b) formula list``);
val _ = type_abbrev ("rule",``: ('a,'b) sequent list # ('a,'b) sequent``);

val _ = Datatype`
  pt =
    FOLRConstant (('a,'b) formula)
  | RuleApplication pt (('a,'b) ruleApp) num
  | AxiomaticRule axRule
  | PrUSubst pt (('a,'b) subst)
  | Ax axiom
  | FNC pt (('a,'b) sequent) (('a,'b) ruleApp)
  | Pro pt pt
  | Start (('a,'b) sequent)
  | Sub pt pt num`

val _ = overload_on ("%%a", ``Pvar``);

val _ = overload_on ("%%p", ``Prop``);

val _ = overload_on ("%%f", ``Function``);

val _ = overload_on ("%%F", ``Functional``);

val _ = overload_on ("&&", ``And``)
val _ = add_infix ("&&", 600, HOLgrammars.LEFT)

val _ = overload_on ("<->", ``Equiv``)
val _ = add_infix ("<->", 550, HOLgrammars.NONASSOC)

val _ = overload_on ("-->", ``Implies``)
val _ = add_infix ("-->", 560, HOLgrammars.RIGHT)

val _ = overload_on ("UU", ``Choice``)
val _ = add_infix ("UU", 561, HOLgrammars.LEFT)

val _ = overload_on (":=", ``Assign``)
val _ = add_infix (":=", 660, HOLgrammars.RIGHT)

val MEM_trm_size = Q.prove(`
  ∀ls a.
  MEM a ls ⇒
  trm_size f a < trm1_size f ls`,
  Induct>>rw[]>>EVAL_TAC>>fs[]>>
  first_x_assum drule>>fs[]);

val dfree_def = tDefine "dfree" `
  (dfree (Var i) ⇔ T) ∧
  (dfree (Const r) ⇔ T) ∧
  (dfree (Function f args) ⇔ EVERY dfree args) ∧
  (dfree (Neg t1) ⇔ dfree t1) ∧
  (dfree (Plus t1 t2) ⇔ dfree t1 ∧ dfree t2) ∧
  (dfree (Times t1 t2) ⇔ dfree t1 ∧ dfree t2) ∧
  (dfree _ ⇔ F)`
  (WF_REL_TAC `measure (trm_size ARB)`>>fs[]>>
  rw[]>>
  imp_res_tac MEM_trm_size>>
  pop_assum (qspec_then `ARB` assume_tac)>>fs[]);

val dsafe_def = tDefine "dsafe" `
  (dsafe (Var i) ⇔ T) ∧
  (dsafe (Const r) ⇔ T) ∧
  (dsafe (Function i args) ⇔ EVERY dsafe args) ∧
  (dsafe (Functional i) ⇔ T) ∧
  (dsafe (Neg theta) ⇔ dsafe theta) ∧
  (dsafe (Plus theta1 theta2) ⇔ dsafe theta1 ∧ dsafe theta2) ∧
  (dsafe (Times theta1 theta2) ⇔ dsafe theta1 ∧ dsafe theta2) ∧
  (dsafe (Differential theta) ⇔ dfree theta) ∧
  (dsafe (DiffVar i) ⇔ T) ∧
  (dsafe (Max theta1 theta2) ⇔ dsafe theta1 ∧ dsafe theta2) ∧
  (dsafe (Min theta1 theta2) ⇔ dsafe theta1 ∧ dsafe theta2) ∧
  (dsafe (Abs theta) ⇔ dsafe theta)`
  (WF_REL_TAC `measure (trm_size ARB)`>>fs[]>>
  rw[]>>
  imp_res_tac MEM_trm_size>>
  pop_assum (qspec_then `ARB` assume_tac)>>fs[])

val ODE_dom_def = Define`
  (ODE_dom (OVar c d) = []) ∧
  (ODE_dom (OSing x t) = [x]) ∧
  (ODE_dom (OProd o1 o2) = ODE_dom o1 ++ ODE_dom o2)`

val osafe_def = Define`
  (osafe (OVar c d) ⇔ T) ∧
  (osafe (OSing x t) ⇔ dfree t) ∧
  (osafe (OProd o1 o2) ⇔ osafe o1 ∧ osafe o2 ∧ list_inter (ODE_dom o1) (ODE_dom o2) = [])`

val fsafe_def = Define`
  (hpsafe (Pvar x) ⇔ T) ∧
  (hpsafe (Assign x e)⇔ dsafe e) ∧
  (hpsafe (AssignAny e)⇔T) ∧
  (hpsafe (DiffAssign x e)⇔dsafe e) ∧
  (hpsafe (Test P)⇔ fsafe P) ∧
  (hpsafe (EvolveODE ODE P)⇔osafe ODE ∧ fsafe P) ∧
  (hpsafe (Choice a b )⇔ hpsafe a ∧ hpsafe b) ∧
  (hpsafe (Sequence a b )⇔ hpsafe a ∧ hpsafe b) ∧
  (hpsafe (Loop a)⇔hpsafe a) ∧
  (fsafe (Geq t1 t2)⇔dsafe t1 ∧ dsafe t2) ∧
  (fsafe (Prop p args)⇔ EVERY dsafe args) ∧
  (fsafe (Not p)⇔fsafe p) ∧
  (fsafe (And p q)⇔fsafe p ∧ fsafe q) ∧
  (fsafe (Exists x p)⇔fsafe p) ∧
  (fsafe (Diamond a p)⇔hpsafe a ∧ fsafe p) ∧
  (fsafe (InContext C f)⇔fsafe f)`

(* Static Semantics.thy *)
val SIGT_def = tDefine "SIGT" `
  (SIGT (Var var) = []) ∧
  (SIGT (Const r) = []) ∧
  (SIGT (Function var f) = [var] ++ FLAT (MAP SIGT f)) ∧
  (SIGT (Functional var) = [var]) ∧
  (SIGT (Neg t1) = SIGT t1) ∧
  (SIGT (Plus t1 t2) = SIGT t1 ++ SIGT t2) ∧
  (SIGT (Times t1 t2) = SIGT t1 ++ SIGT t2) ∧
  (SIGT (Max t1 t2) = SIGT t1 ++ SIGT t2) ∧
  (SIGT (Min t1 t2) = SIGT t1 ++ SIGT t2) ∧
  (SIGT (Abs t1) = SIGT t1) ∧
  (SIGT (DiffVar x) = []) ∧
  (SIGT (Differential t) = SIGT t)`
  (WF_REL_TAC `measure (trm_size ARB)`>>fs[]>>
  rw[]>>
  imp_res_tac MEM_trm_size>>
  pop_assum (qspec_then `ARB` assume_tac)>>fs[])

val SIGO_def = Define`
  (SIGO (OVar c _) = [INR c]) ∧
  (SIGO (OSing x theta) =  MAP INL (SIGT theta)) ∧
  (SIGO (OProd ODE1 ODE2) = SIGO ODE1 ++ SIGO ODE2)`

val SIGP_def = Define`
  (SIGP (Pvar var) = [INR (INR var)]) ∧
  (SIGP (Assign var t) = MAP INL (SIGT t)) ∧
  (SIGP (AssignAny var) = []) ∧
  (SIGP (DiffAssign var t) = MAP INL (SIGT t)) ∧
  (SIGP (Test p) = SIGF p) ∧
  (SIGP (EvolveODE ODE p) = SIGF p ++
    MAP (λv.
      case v of INL x => INL x | INR x => INR (INR x)) (SIGO ODE)) ∧
  (SIGP (Choice a b) = SIGP a ++ SIGP b) ∧
  (SIGP (Sequence a b) = SIGP a ++ SIGP b) ∧
  (SIGP (Loop a) = SIGP a) ∧
  (SIGF (Geq t1 t2) = MAP INL (SIGT t1 ++ SIGT t2)) ∧
  (SIGF (Prop var args) = [INR (INR var)] ++ MAP INL (FLAT (MAP SIGT args))) ∧
  (SIGF (Not p) = SIGF p) ∧
  (SIGF (And p1 p2) = SIGF p1 ++ SIGF p2) ∧
  (SIGF (Exists var p) = SIGF p) ∧
  (SIGF (Diamond a p) = SIGP a ++ SIGF p) ∧
  (SIGF (InContext var p) = [INR (INL var)] ++ SIGF p)`

val primify_def = Define`
  (primify (INL x) = [INL x;INR x]) ∧
  (primify (INR x) = [INL x;INR x])`

val UNIVls_def = Define`
  UNIVls = MAP INL varls ++ MAP INR varls`

val FVT_def = tDefine "FVT"`
  (FVT (Var x) = [INL x]) ∧
  (FVT (Const x) = []) ∧
  (FVT (Function f args) = FLAT (MAP FVT args)) ∧
  (FVT (Functional f) = UNIVls) ∧
  (FVT (Neg f) = FVT f) ∧
  (FVT (Plus f g) = FVT f ++ FVT g) ∧
  (FVT (Times f g) = FVT f ++ FVT g) ∧
  (FVT (Max f g) = FVT f ++ FVT g) ∧
  (FVT (Min f g) = FVT f ++ FVT g) ∧
  (FVT (Abs f) = FVT f) ∧
  (FVT (Differential f) = FLAT (MAP primify (FVT f))) ∧
  (FVT (DiffVar x) = [INR x])`
  (WF_REL_TAC `measure (trm_size ARB)`>>fs[]>>
  rw[]>>
  imp_res_tac MEM_trm_size>>
  pop_assum (qspec_then `ARB` assume_tac)>>fs[]);

val list_minus_def = Define`
  list_minus l1 l2 = FILTER (λx. ¬MEM x l2) l1`;

val BVO_def = Define`
  (BVO (OVar c (SOME x)) = list_minus UNIVls [INL x; INR x]) ∧
  (BVO (OVar c NONE) = UNIVls) ∧
  (BVO (OSing x θ) = [INL x; INR x]) ∧
  (BVO (OProd ODE1 ODE2) = BVO ODE1 ++ BVO ODE2)`

val BVP_def = Define`
  (BVP (Pvar a) = UNIVls) ∧
  (BVP (Assign x t) = [INL x]) ∧
  (BVP (AssignAny x) = [INL x]) ∧
  (BVP (DiffAssign x t) = [INR x]) ∧
  (BVP (Test f) = []) ∧
  (BVP (EvolveODE ODE f) = BVO ODE) ∧
  (BVP (Choice a b) = BVP a ++ BVP b) ∧
  (BVP (Sequence a b) = BVP a ++ BVP b) ∧
  (BVP (Loop a) = BVP a) ∧
  (BVF (Geq f g) = []) ∧
  (BVF (Prop p dfun_args) = []) ∧
  (BVF (Not p) = BVF p) ∧
  (BVF (And p q) = BVF p ++ BVF q) ∧
  (BVF (Exists x p) = [INL x] ++ BVF p) ∧
  (BVF (Diamond a p) = BVP a ++ BVF p) ∧
  (BVF (InContext C p) = UNIVls)`

val MBV_def = Define`
  (MBV (Pvar a) = []) ∧
  (MBV (Choice a b) = list_inter (MBV a) (MBV b)) ∧
  (MBV (Sequence a b) = (MBV a) ++ (MBV b)) ∧
  (MBV (Loop a) = []) ∧
  (MBV (EvolveODE ODE _) = (MAP INL (ODE_dom ODE)) ++ (MAP INR (ODE_dom ODE))) ∧
  (MBV a = BVP a)`

val strip_INL_def = Define`
  (strip_INL (INL x::xs) = x :: strip_INL xs) ∧
  (strip_INL (INR x::xs) = strip_INL xs) ∧
  (strip_INL [] = [])`

val FVO_def = Define`
  (FVO (OVar c (SOME x)) = varls) ∧
  (FVO (OVar c NONE) = varls) ∧
  (FVO (OSing x t) = [x] ++ strip_INL (FVT t)) ∧
  (FVO (OProd ODE1 ODE2) = FVO ODE1 ++ FVO ODE2)`

val FVP_def = Define`
  (FVP (Pvar a) = UNIVls) ∧
  (FVP (Assign x t) = FVT t) ∧
  (FVP (AssignAny x) = []) ∧
  (FVP (DiffAssign x t) = FVT t) ∧
  (FVP (Test f) = FVF f) ∧
  (FVP (EvolveODE ODE f) = (MAP INL (FVO ODE)) ++ FVF f) ∧
  (FVP (Choice a b) = FVP a ++ FVP b) ∧
  (FVP (Sequence a b) = FVP a ++ (list_minus (FVP b) (MBV a))) ∧
  (FVP (Loop a) = FVP a) ∧
  (FVF (Geq f g) = FVT f ++ FVT g) ∧
  (FVF (Prop p args) = FLAT (MAP FVT args)) ∧
  (FVF (Not p) = FVF p) ∧
  (FVF (And p q) = FVF p ++ FVF q) ∧
  (FVF (Exists x p) = list_minus (FVF p) [INL x]) ∧
  (FVF (Diamond a p) = (FVP a ++ (list_minus (FVF p) (MBV a)))) ∧
  (FVF (InContext C p) = UNIVls)`

val FVSeq_def = Define`
  FVSeq ((A,S):('a,'b) sequent) = FOLDR (λx acc. (acc ++ (FVF x))) [] A  ++
                FOLDR (λx acc. (acc ++ (FVF x))) [] S`

(* Uniform Renaming.thy *)
val TRadmit_def = tDefine "TRadmit" `
  (TRadmit (Var z) ⇔ T) ∧
  (TRadmit (DiffVar z) ⇔ T) ∧
  (TRadmit (Const c) ⇔ T) ∧
  (TRadmit (Function f args) ⇔ EVERY TRadmit args) ∧
  (TRadmit (Neg t1) ⇔ TRadmit t1) ∧
  (TRadmit (Plus t1 t2) ⇔ TRadmit t1 ∧ TRadmit t2) ∧
  (TRadmit (Times t1 t2) ⇔ TRadmit t1 ∧ TRadmit t2) ∧
  (TRadmit (Max t1 t2) ⇔ TRadmit t1 ∧ TRadmit t2) ∧
  (TRadmit (Min t1 t2) ⇔ TRadmit t1 ∧ TRadmit t2) ∧
  (TRadmit (Abs t1) ⇔ TRadmit t1) ∧
  (TRadmit (Differential t) ⇔ TRadmit t ∧ dfree t) ∧
  (TRadmit _ ⇔ F)`
  (WF_REL_TAC `measure (trm_size ARB)`>>fs[]>>
  rw[]>>
  imp_res_tac MEM_trm_size>>
  pop_assum (qspec_then `ARB` assume_tac)>>fs[]);

val ORadmit_def = Define`
  (ORadmit (OSing x t) ⇔ TRadmit t ∧ dfree t) ∧
  (ORadmit (OProd o1 o2) ⇔ ORadmit o1 ∧ ORadmit o2) ∧
  (ORadmit _ ⇔ F)`

val PRadmit_def = Define`
  (PRadmit (Assign x t) ⇔ TRadmit t) ∧
  (PRadmit (AssignAny x) ⇔ T) ∧
  (PRadmit (DiffAssign x t) ⇔ TRadmit t) ∧
  (PRadmit (Test f) ⇔ FRadmit f) ∧
  (PRadmit (EvolveODE ode phi) ⇔ ORadmit ode ∧ FRadmit phi) ∧
  (PRadmit (Choice a b) ⇔ PRadmit a ∧ PRadmit b) ∧
  (PRadmit (Sequence a b) ⇔ PRadmit a ∧ PRadmit b) ∧
  (PRadmit (Loop a) ⇔ PRadmit a) ∧
  (PRadmit _ ⇔ F) ∧
  (FRadmit (Geq t1 t2) ⇔ TRadmit t1 ∧ TRadmit t2) ∧
  (FRadmit (Prop p args) ⇔ EVERY TRadmit args) ∧
  (FRadmit (Not f) ⇔ FRadmit f) ∧
  (FRadmit (And f1 f2) ⇔ FRadmit f1 ∧ FRadmit f2) ∧
  (FRadmit (Exists x phi) ⇔ FRadmit phi) ∧
  (FRadmit (Diamond a phi) ⇔ PRadmit a ∧ FRadmit phi) ∧
  (FRadmit _ = F)`

val swap_def = Define`
  swap x y z = if z = x then y else if z = y then x else z`

val TUrename_def = tDefine "TUrename" `
  (TUrename x y (Var z) = Var (swap x y z)) ∧
  (TUrename x y (DiffVar z) = DiffVar (swap x y z)) ∧
  (TUrename x y (Const r) = (Const r)) ∧
  (TUrename x y (Function f args) = Function f (MAP (TUrename x y) args)) ∧
  (TUrename x y (Neg t1) = Neg (TUrename x y t1)) ∧
  (TUrename x y (Plus t1 t2) = Plus (TUrename x y t1) (TUrename x y t2)) ∧
  (TUrename x y (Times t1 t2) = Times (TUrename x y t1) (TUrename x y t2)) ∧
  (TUrename x y (Max t1 t2) = Max (TUrename x y t1) (TUrename x y t2)) ∧
  (TUrename x y (Min t1 t2) = Min (TUrename x y t1) (TUrename x y t2)) ∧
  (TUrename x y (Abs t1) = Abs (TUrename x y t1)) ∧
  (TUrename x y (Differential t) = Differential (TUrename x y t)) ∧
  (TUrename x y t = t)` (*%%F undefined *)
  (WF_REL_TAC `measure (trm_size ARB o SND o SND)`>>fs[]>>
  rw[]>>
  imp_res_tac MEM_trm_size>>
  pop_assum (qspec_then `ARB` assume_tac)>>fs[])

val OUrename_def = Define`
  (OUrename x y (OSing z t) = OSing (swap x y z) (TUrename x y t)) ∧
  (OUrename x y (OProd ODE1 ODE2) = OProd (OUrename x y ODE1) (OUrename x y ODE2)) ∧
  (OUrename x y ov = ov)` (*OVar undefined*)

val PUrename_def = Define`
  (PUrename x y (Assign z t) = Assign (swap x y z) (TUrename x y t)) ∧
  (PUrename x y (AssignAny z) = AssignAny (swap x y z)) ∧
  (PUrename x y (DiffAssign z t) = DiffAssign (swap x y z) (TUrename x y t)) ∧
  (PUrename x y (Test f) = Test (FUrename x y f)) ∧
  (PUrename x y (EvolveODE ODE f) = EvolveODE (OUrename x y ODE) (FUrename x y f)) ∧
  (PUrename x y (Choice a b) = Choice (PUrename x y a) (PUrename x y b)) ∧
  (PUrename x y (Sequence a b) = Sequence (PUrename x y a) (PUrename x y b)) ∧
  (PUrename x y (Loop a) = Loop (PUrename x y a)) ∧
  (FUrename x y (Geq t1 t2) = Geq (TUrename x y t1) (TUrename x y t2)) ∧
  (FUrename x y (Prop p args) = Prop p (MAP (TUrename x y) args)) ∧
  (FUrename x y (Not f) = Not (FUrename x y f)) ∧
  (FUrename x y (And f psi) = And (FUrename x y f) (FUrename x y psi)) ∧
  (FUrename x y (Exists z f) = Exists (swap x y z) (FUrename x y f)) ∧
  (FUrename x y (Diamond a f) = Diamond (PUrename x y a) (FUrename x y f)) ∧
  (* last two cases undefined *)
  (PUrename x y (Pvar a) = Pvar a) ∧
  (FUrename x y (InContext C f) = InContext C f)`

val FBrename_def = Define`
  (FBrename x y (Not (Diamond(Assign z t) (Not f))) =
    (if(x = z) then
       (Box(Assign y t)  (FUrename x y f))
    else if (y = z) then
      (Box(Assign x t)  (FUrename x y f))
    else (Box(Assign z t) f))) ∧
  (FBrename x y (Not (Exists  z (Not f))) =
    (if(x = z) then
       (Forall y (FUrename x y f))
    else if (y = z) then
      (Forall x (FUrename x y f))
    else (Forall z  f))) ∧
  (FBrename x y f = f)`

(* USubst_Lemma.thy*)
val _ = Datatype`
  fin_univ = <|
    als : 'a list;
    bls : 'b list |>`

val pair_varls_space = rconc (EVAL``FLAT (MAP (λx. (x,NONE) :: MAP (λy. (x,SOME y)) varls) varls)``);

val pair_varls = rconc (EVAL``FLAT (MAP (λx. MAP (λy. (x,y)) varls) varls)``);

val pair_varls_space_def = Define`
  pair_varls_space = ^pair_varls_space`

val pair_varls_def = Define`
  pair_varls = ^pair_varls`

val ssafe_def = Define`
  ssafe fu sigma <=>
  EVERY (λx. case sigma.SFunctions x of SOME f => dfree f | NONE => T) fu.als ∧
  EVERY (λx. case sigma.SPredicates x of SOME f => fsafe f | NONE => T) varls ∧
  EVERY (λx. case sigma.SFunls x of SOME f => dsafe f | NONE => T) fu.als ∧
  EVERY (λx. case sigma.SPrograms x of SOME f => hpsafe f | NONE => T) varls ∧
  EVERY (λ(f,sp). case sigma.SODEs f sp of SOME f => osafe f | NONE => T) pair_varls_space ∧
  EVERY (λ(f,x). case sigma.SODEs f (SOME x) of SOME f => ¬ MEM (INL x) (BVO f) | NONE =>T) pair_varls ∧
  EVERY (λx. case sigma.SContexts x of SOME f => fsafe f | NONE => T) fu.bls`

(* USubst.thy *)
val SFV_def = Define`
  (SFV sigma (INL i) =
    (case sigma.SFunctions i of SOME f' => FVT f' | NONE => []) ++ (case sigma.SFunls i of SOME f' => FVT f' | NONE => [])) ∧
  (SFV sigma (INR (INL i)) = []) ∧
  (SFV sigma (INR (INR i)) = (case sigma.SPredicates i of SOME p' => FVF p' | NONE => []))`

val SDom_def = Define`
  SDom (fu:('a,'b) fin_univ) sigma =
  MAP INL (FILTER (IS_SOME o sigma.SFunctions) fu.als) ++
  MAP INL (FILTER (IS_SOME o sigma.SFunls) fu.als) ++
  MAP (INR o INL) (FILTER (IS_SOME o sigma.SContexts) fu.bls) ++
  MAP (INR o INR) (FILTER (IS_SOME o sigma.SPredicates) varls) ++
  MAP (INR o INR) (FILTER (IS_SOME o sigma.SPrograms) varls)`

val TsubstFO_def = tDefine "TsubstFO"`
  (TsubstFO (Var v) sigma = Var v) ∧
  (TsubstFO (DiffVar v) sigma = DiffVar v) ∧
  (TsubstFO (Const r) sigma = Const r) ∧
  (TsubstFO (%%F f) sigma = (case f of INL ff => (%%F ff) | INR ff => any_el (var_to_el ff) sigma (Const 0w))) ∧
  (TsubstFO (Function f args) sigma =
      (case f of
        INL f' => Function f' (MAP (λi. TsubstFO i sigma) args)
      | INR f' => any_el (var_to_el f') sigma (Const 0w))) ∧
  (TsubstFO (Neg theta1) sigma = Neg (TsubstFO theta1 sigma)) ∧
  (TsubstFO (Plus theta1 theta2) sigma = Plus (TsubstFO theta1 sigma) (TsubstFO theta2 sigma)) ∧
  (TsubstFO (Times theta1 theta2) sigma = Times (TsubstFO theta1 sigma) (TsubstFO theta2 sigma)) ∧
  (TsubstFO (Max theta1 theta2) sigma = Max (TsubstFO theta1 sigma) (TsubstFO theta2 sigma)) ∧
  (TsubstFO (Min theta1 theta2) sigma = Min (TsubstFO theta1 sigma) (TsubstFO theta2 sigma)) ∧
  (TsubstFO (Abs theta1) sigma = Abs (TsubstFO theta1 sigma)) ∧
  (TsubstFO (Differential theta) sigma = Differential (TsubstFO theta sigma))`
  (WF_REL_TAC `measure (trm_size ARB o FST)`>>fs[]>>
  rw[]>>
  imp_res_tac MEM_trm_size>>
  pop_assum (qspec_then `ARB` assume_tac)>>fs[])

val Tsubst_def = tDefine "Tsubst"`
  (Tsubst (Var x) sigma = Var x) ∧
  (Tsubst (DiffVar x) sigma = DiffVar x) ∧
  (Tsubst (Const r) sigma = Const r) ∧
  (Tsubst (Function f args) sigma =
    (case sigma.SFunctions f of
      SOME f' => TsubstFO f'
    | NONE => Function f) (MAP (λi. Tsubst i sigma) args)) ∧
  (Tsubst (%%F f) sigma = (case sigma.SFunls f of SOME f' =>  f' | NONE =>  (%%F f))) ∧
  (Tsubst (Neg theta1) sigma = Neg (Tsubst theta1 sigma)) ∧
  (Tsubst (Plus theta1 theta2) sigma = Plus (Tsubst theta1 sigma) (Tsubst theta2 sigma)) ∧
  (Tsubst (Times theta1 theta2) sigma = Times (Tsubst theta1 sigma) (Tsubst theta2 sigma)) ∧
  (Tsubst (Max theta1 theta2) sigma = Max (Tsubst theta1 sigma) (Tsubst theta2 sigma)) ∧
  (Tsubst (Min theta1 theta2) sigma = Min (Tsubst theta1 sigma) (Tsubst theta2 sigma)) ∧
  (Tsubst (Abs theta1) sigma = Abs (Tsubst theta1 sigma) ) ∧
  (Tsubst (Differential theta) sigma = Differential (Tsubst theta sigma))`
  (WF_REL_TAC `measure (trm_size ARB o FST)`>>fs[]>>
  rw[]>>
  imp_res_tac MEM_trm_size>>
  pop_assum (qspec_then `ARB` assume_tac)>>fs[])

val OsubstFO_def = Define`
  (OsubstFO (OVar c sp) sigma = OVar c sp) ∧
  (OsubstFO (OSing x theta) sigma = OSing x (TsubstFO theta sigma)) ∧
  (OsubstFO (OProd ODE1 ODE2) sigma = oprod (OsubstFO ODE1 sigma) (OsubstFO ODE2 sigma))`

val Osubst_def = Define`
  (Osubst (OVar c sp) sigma = (case sigma.SODEs c sp of SOME c' => c' | NONE => OVar c sp)) ∧
  (Osubst (OSing x theta) sigma = OSing x (Tsubst theta sigma)) ∧
  (Osubst (OProd ODE1 ODE2) sigma = oprod (Osubst ODE1 sigma) (Osubst ODE2 sigma))`

val PsubstFO_def = Define`
  (PsubstFO (Pvar a) sigma = Pvar a) ∧
  (PsubstFO (Assign x theta) sigma = Assign x (TsubstFO theta sigma)) ∧
  (PsubstFO (AssignAny x) sigma = AssignAny x) ∧
  (PsubstFO (DiffAssign x theta) sigma = DiffAssign x (TsubstFO theta sigma)) ∧
  (PsubstFO (Test phi) sigma = Test (FsubstFO phi sigma)) ∧
  (PsubstFO (EvolveODE ODE phi) sigma = EvolveODE (OsubstFO ODE sigma) (FsubstFO phi sigma)) ∧
  (PsubstFO (Choice alpha beta) sigma = Choice (PsubstFO alpha sigma) (PsubstFO beta sigma)) ∧
  (PsubstFO (Sequence alpha beta) sigma = Sequence (PsubstFO alpha sigma) (PsubstFO beta sigma)) ∧
  (PsubstFO (Loop alpha) sigma = Loop (PsubstFO alpha sigma)) ∧
  (FsubstFO (Geq theta1 theta2) sigma = Geq (TsubstFO theta1 sigma) (TsubstFO theta2 sigma)) ∧
  (FsubstFO (Prop p args) sigma = Prop p (MAP (λi. TsubstFO i sigma) args)) ∧
  (FsubstFO (Not phi) sigma = Not (FsubstFO phi sigma)) ∧
  (FsubstFO (And phi psi) sigma = And (FsubstFO phi sigma) (FsubstFO psi sigma)) ∧
  (FsubstFO (Exists x phi) sigma = Exists x (FsubstFO phi sigma)) ∧
  (FsubstFO (Diamond alpha phi) sigma = Diamond (PsubstFO alpha sigma) (FsubstFO phi sigma)) ∧
  (FsubstFO (InContext C phi) sigma = InContext C (FsubstFO phi sigma))`;

val PPsubst_def = Define`
  (PPsubst (Pvar a) sigma = Pvar a) ∧
  (PPsubst (Assign x theta) sigma = Assign x theta) ∧
  (PPsubst (AssignAny x) sigma = AssignAny x) ∧
  (PPsubst (DiffAssign x theta) sigma = DiffAssign x theta) ∧
  (PPsubst (Test phi) sigma = Test (PFsubst phi sigma)) ∧
  (PPsubst (EvolveODE ODE phi) sigma = EvolveODE ODE (PFsubst phi sigma)) ∧
  (PPsubst (Choice alpha beta) sigma = Choice (PPsubst alpha sigma) (PPsubst beta sigma)) ∧
  (PPsubst (Sequence alpha beta) sigma = Sequence (PPsubst alpha sigma) (PPsubst beta sigma)) ∧
  (PPsubst (Loop alpha) sigma = Loop (PPsubst alpha sigma)) ∧
  (PFsubst (Geq theta1 theta2) sigma = (Geq theta1 theta2)) ∧
  (PFsubst (Prop p args) sigma = Prop p args) ∧
  (PFsubst (Not phi) sigma = Not (PFsubst phi sigma)) ∧
  (PFsubst (And phi psi) sigma = And (PFsubst phi sigma) (PFsubst psi sigma)) ∧
  (PFsubst (Exists x phi) sigma = Exists x (PFsubst phi sigma)) ∧
  (PFsubst (Diamond alpha phi) sigma = Diamond (PPsubst alpha sigma) (PFsubst phi sigma)) ∧
  (PFsubst (InContext C phi) sigma = (case C of INL C' => InContext C' (PFsubst phi sigma) | INR p' => sigma))`

val Psubst_def = Define`
  (Psubst (Pvar a) sigma = (case sigma.SPrograms a of SOME a' => a' | NONE => Pvar a)) ∧
  (Psubst (Assign x theta) sigma = Assign x (Tsubst theta sigma)) ∧
  (Psubst (AssignAny x) sigma = AssignAny x) ∧
  (Psubst (DiffAssign x theta) sigma = DiffAssign x (Tsubst theta sigma)) ∧
  (Psubst (Test phi) sigma = Test (Fsubst phi sigma)) ∧
  (Psubst (EvolveODE ODE phi) sigma = EvolveODE (Osubst ODE sigma) (Fsubst phi sigma)) ∧
  (Psubst (Choice alpha beta) sigma = Choice (Psubst alpha sigma) (Psubst beta sigma)) ∧
  (Psubst (Sequence alpha beta) sigma = Sequence (Psubst alpha sigma) (Psubst beta sigma)) ∧
  (Psubst (Loop alpha) sigma = Loop (Psubst alpha sigma)) ∧
  (Fsubst (Geq theta1 theta2) sigma = Geq (Tsubst theta1 sigma) (Tsubst theta2 sigma)) ∧
  (Fsubst (Prop p args) sigma = (case sigma.SPredicates p of SOME p' => FsubstFO p' (MAP (λi. Tsubst i sigma) args) | NONE => Prop p (MAP (λi. Tsubst i sigma) args))) ∧
  (Fsubst (Not phi) sigma = Not (Fsubst phi sigma)) ∧
  (Fsubst (And phi psi) sigma = And (Fsubst phi sigma) (Fsubst psi sigma)) ∧
  (Fsubst (Exists x phi) sigma = Exists x (Fsubst phi sigma)) ∧
  (Fsubst (Diamond alpha phi) sigma = Diamond (Psubst alpha sigma) (Fsubst phi sigma)) ∧
  (Fsubst (InContext C phi) sigma = (case sigma.SContexts C of SOME C' => PFsubst C' (Fsubst phi sigma) | NONE =>  InContext C (Fsubst phi sigma)))`

val SFV_def = Define`
  (SFV sigma (INL i) =
    (case sigma.SFunctions i of SOME f' => FVT f' | None => []) ++
    (case sigma.SFunls i of SOME f' => FVT f' | None => [])) ∧
  (SFV sigma (INR (INL i)) = []) ∧
  (SFV sigma (INR (INR i)) = (case sigma.SPredicates i of SOME p' => FVF p' | NONE => []))`

val FVS_def = Define`
  FVS fu sigma =
  FLAT (MAP (SFV sigma) (MAP INL fu.als ++ MAP (INR o INL) fu.bls ++ MAP (INR o INR) varls))`

val TUadmit_def = Define`
  TUadmit sigma theta U ⇔
  list_inter
  (FLAT (
    MAP (λi. (case sigma.SFunctions i of SOME f' => FVT f' | NONE => []) ++
              (case sigma.SFunls i of SOME f' => FVT f' | NONE => []))
     (SIGT theta))) U = []`

val NTUadmit_def = Define`
  NTUadmit sigma theta U ⇔
  list_inter
  (FLAT (MAP (λi. case i of INR i => FVT (any_el (var_to_el i) sigma (Const 0w)) | INL i => []) (SIGT theta)))
  U = []`

val PUadmit_def = Define`
  PUadmit fu sigma theta U ⇔
  list_inter (FLAT (MAP (SFV sigma) (list_inter (SDom fu sigma) (SIGP theta)))) U = []`

val FUadmit_def = Define`
  FUadmit fu sigma theta U ⇔
  list_inter (FLAT (MAP (SFV sigma) (list_inter (SDom fu sigma) (SIGF theta)))) U = []`

val TadmitFFO_def = tDefine "TadmitFFO"`
  (TadmitFFO sigma (Differential theta) ⇔ TadmitFFO sigma theta ∧ NTUadmit sigma theta UNIVls) ∧
  (TadmitFFO sigma (Function fs args) ⇔
    case fs of INL f => EVERY (TadmitFFO sigma) args
             | INR f => EVERY (TadmitFFO sigma) args ∧ dfree (any_el (var_to_el f) sigma (Const 0w))) ∧
  (TadmitFFO sigma (Plus theta1 theta2) ⇔ TadmitFFO sigma theta1 ∧ TadmitFFO sigma theta2) ∧
  (TadmitFFO sigma (Times theta1 theta2) ⇔ TadmitFFO sigma theta1 ∧ TadmitFFO sigma theta2) ∧
  (TadmitFFO sigma (Max theta1 theta2) ⇔ TadmitFFO sigma theta1 ∧ TadmitFFO sigma theta2) ∧
  (TadmitFFO sigma (Min theta1 theta2) ⇔ TadmitFFO sigma theta1 ∧ TadmitFFO sigma theta2) ∧
  (TadmitFFO sigma (Abs theta1) ⇔ TadmitFFO sigma theta1) ∧
  (TadmitFFO sigma (Neg theta1) ⇔ TadmitFFO sigma theta1) ∧
  (TadmitFFO sigma (Var x) ⇔ T) ∧
  (TadmitFFO sigma (Const r) ⇔ T) ∧
  (TadmitFFO sigma _ ⇔ F)`
  (WF_REL_TAC `measure (trm_size ARB o SND)`>>fs[]>>
  rw[]>>
  imp_res_tac MEM_trm_size>>
  pop_assum (qspec_then `ARB` assume_tac)>>fs[])

val TadmitFO_def = tDefine "TadmitFO"`
  (TadmitFO sigma (Differential theta) ⇔
    TadmitFFO sigma theta ∧ NTUadmit sigma theta UNIVls ∧ dfree (TsubstFO theta sigma)) ∧
  (TadmitFO sigma (Function f args) ⇔
    EVERY (TadmitFO sigma) args) ∧
  (TadmitFO sigma (%%F fs) ⇔ case fs of INL f => T | _ => F) ∧
  (TadmitFO sigma (Neg theta1) ⇔ TadmitFO sigma theta1) ∧
  (TadmitFO sigma (Plus theta1 theta2) ⇔ TadmitFO sigma theta1 ∧ TadmitFO sigma theta2) ∧
  (TadmitFO sigma (Times theta1 theta2) ⇔ TadmitFO sigma theta1 ∧ TadmitFO sigma theta2) ∧
  (TadmitFO sigma (Max theta1 theta2) ⇔ TadmitFO sigma theta1 ∧ TadmitFO sigma theta2) ∧
  (TadmitFO sigma (Min theta1 theta2) ⇔ TadmitFO sigma theta1 ∧ TadmitFO sigma theta2) ∧
  (TadmitFO sigma (Abs theta1) ⇔ TadmitFO sigma theta1) ∧
  (TadmitFO sigma (DiffVar x) ⇔ T) ∧
  (TadmitFO sigma (Var x) ⇔ T) ∧
  (TadmitFO sigma (Const r) ⇔ T)`
  (WF_REL_TAC `measure (trm_size ARB o SND)`>>fs[]>>
  rw[]>>
  imp_res_tac MEM_trm_size>>
  pop_assum (qspec_then `ARB` assume_tac)>>fs[])

val TadmitF_def = tDefine "TadmitF"`
  (TadmitF sigma (Differential theta) ⇔
    TadmitF sigma theta ∧ TUadmit sigma theta UNIVls) ∧
  (TadmitF sigma (Function f args) ⇔
    EVERY (TadmitF sigma) args ∧
    case sigma.SFunctions f of
      SOME f' =>
        EVERY (λi. dfree (Tsubst i sigma)) args ∧
        TadmitFFO (MAP (λ i. Tsubst i sigma) args) f'
    | NONE => T) ∧
  (TadmitF sigma (Neg theta1) ⇔ TadmitF sigma theta1) ∧
  (TadmitF sigma (Plus theta1 theta2) ⇔ TadmitF sigma theta1 ∧ TadmitF sigma theta2) ∧
  (TadmitF sigma (Times theta1 theta2) ⇔ TadmitF sigma theta1 ∧ TadmitF sigma theta2) ∧
  (TadmitF sigma (Max theta1 theta2) ⇔ TadmitF sigma theta1 ∧ TadmitF sigma theta2) ∧
  (TadmitF sigma (Min theta1 theta2) ⇔ TadmitF sigma theta1 ∧ TadmitF sigma theta2) ∧
  (TadmitF sigma (Abs theta1) ⇔ TadmitF sigma theta1) ∧
  (TadmitF sigma (DiffVar x) ⇔ T) ∧
  (TadmitF sigma (Var x) ⇔ T) ∧
  (TadmitF sigma (Const r) ⇔ T) ∧
  (TadmitF sigma _ ⇔ F)`
  (WF_REL_TAC `measure (trm_size ARB o SND)`>>fs[]>>
  rw[]>>
  imp_res_tac MEM_trm_size>>
  pop_assum (qspec_then `ARB` assume_tac)>>fs[])

val Tadmit_def = tDefine "Tadmit"`
  (Tadmit sigma (Differential theta) ⇔
    Tadmit sigma theta ∧ TUadmit sigma theta UNIVls) ∧
  (Tadmit sigma (Function f args) ⇔
    EVERY (Tadmit sigma) args ∧
    case sigma.SFunctions f of
      SOME f' =>
        TadmitFO (MAP (λ i. Tsubst i sigma) args) f'
    | NONE => T) ∧
  (Tadmit sigma (%%F f) ⇔ (*NOTE: this is partial!*)
    case sigma.SFunls f of
      SOME f' => Tadmit sigma f'
    | NONE => F)  ∧
  (Tadmit sigma (Neg theta1) ⇔ Tadmit sigma theta1) ∧
  (Tadmit sigma (Plus theta1 theta2) ⇔ Tadmit sigma theta1 ∧ Tadmit sigma theta2) ∧
  (Tadmit sigma (Times theta1 theta2) ⇔ Tadmit sigma theta1 ∧ Tadmit sigma theta2) ∧
  (Tadmit sigma (Max theta1 theta2) ⇔ Tadmit sigma theta1 ∧ Tadmit sigma theta2) ∧
  (Tadmit sigma (Min theta1 theta2) ⇔ Tadmit sigma theta1 ∧ Tadmit sigma theta2) ∧
  (Tadmit sigma (Abs theta1) ⇔ Tadmit sigma theta1) ∧
  (Tadmit sigma (DiffVar x) ⇔ T) ∧
  (Tadmit sigma (Var x) ⇔ T) ∧
  (Tadmit sigma (Const r) ⇔ T)`
  cheat;

val Oadmit_def = Define`
  (Oadmit sigma (OVar c NONE) U ⇔ T) ∧
  (Oadmit sigma (OVar c (SOME x)) U ⇔
    (case sigma.SODEs c (SOME x) of SOME ode => ¬ MEM (INL x) (BVO ode) | NONE => F)) ∧
  (Oadmit sigma (OSing x theta) U ⇔
    TUadmit sigma theta U ∧ TadmitF sigma theta)  ∧
  (Oadmit sigma (OProd ODE1 ODE2) U ⇔
    Oadmit sigma ODE1 U ∧ Oadmit sigma ODE2 U ∧ list_inter (ODE_dom (Osubst ODE1 sigma)) (ODE_dom (Osubst ODE2 sigma)) = [])`

val PUadmitFO_def = Define`
  PUadmitFO sigma theta U ⇔
  list_inter
  (FLAT (MAP
  (λx. case x of (INL (INR i)) => FVT (any_el (var_to_el i) sigma (Const 0w))
       | _ => []) (SIGP theta))) U = []`

val OUadmitFO_def = Define`
  OUadmitFO sigma theta U ⇔
  list_inter
  (FLAT (MAP
  (λx. case x of (INL (INR i)) => FVT (any_el (var_to_el i) sigma (Const 0w))
       | _ => []) (SIGO theta))) U = []`

val OadmitFO_def = Define`
  (OadmitFO sigma (OSing x theta) U ⇔
    OUadmitFO sigma (OSing x theta) U ∧ TadmitFFO sigma theta) ∧
  (OadmitFO sigma (OProd ODE1 ODE2) U ⇔
    OadmitFO sigma ODE1 U ∧ OadmitFO sigma ODE2 U) ∧
  (OadmitFO sigma as U ⇔ OUadmitFO sigma as U)`

val FUadmitFO_def = Define`
  FUadmitFO sigma theta U ⇔
  list_inter
  (FLAT (MAP
  (λx. case x of (INL (INR i)) => FVT (any_el (var_to_el i) sigma (Const 0w))
       | _ => []) (SIGF theta))) U = []`

val NPadmit_def = Define`
  (NPadmit sigma (Pvar a) ⇔ T) ∧
  (NPadmit sigma (Sequence a b) ⇔
    NPadmit sigma a ∧ NPadmit sigma b ∧ PUadmitFO sigma b (BVP (PsubstFO a sigma))∧ hpsafe (PsubstFO a sigma)) ∧
  (NPadmit sigma (Loop a) ⇔
    NPadmit sigma a ∧ PUadmitFO sigma a (BVP (PsubstFO a sigma)) ∧ hpsafe (PsubstFO a sigma)) ∧
  (NPadmit sigma (EvolveODE ODE phi) ⇔
    OadmitFO sigma ODE (BVO ODE) ∧ NFadmit sigma phi ∧ FUadmitFO sigma phi (BVO ODE) ∧fsafe (FsubstFO phi sigma) ∧ osafe (OsubstFO ODE sigma)) ∧
  (NPadmit sigma (Choice a b) ⇔ NPadmit sigma a ∧ NPadmit sigma b) ∧
  (NPadmit sigma (Assign x theta) ⇔ TadmitFO sigma theta) ∧
  (NPadmit sigma (AssignAny x) ⇔ T) ∧
  (NPadmit sigma (DiffAssign x theta) ⇔ TadmitFO sigma theta) ∧
  (NPadmit sigma (Test phi) ⇔ NFadmit sigma phi) ∧
  (NFadmit sigma (Geq theta1 theta2) ⇔ TadmitFO sigma theta1 ∧ TadmitFO sigma theta2) ∧
  (NFadmit sigma (Prop f args) ⇔ EVERY (TadmitFO sigma) args) ∧
  (NFadmit sigma (Not phi) ⇔ NFadmit sigma phi) ∧
  (NFadmit sigma (And phi psi) ⇔ NFadmit sigma phi ∧NFadmit sigma psi) ∧
  (NFadmit sigma (Exists x phi) ⇔ NFadmit sigma phi ∧ FUadmitFO sigma phi [INL x]) ∧
  (NFadmit sigma (Diamond a phi) ⇔ NFadmit sigma phi ∧ NPadmit sigma a ∧ FUadmitFO sigma phi (BVP (PsubstFO a sigma)) ∧ hpsafe (PsubstFO a sigma)) ∧
  (NFadmit sigma (InContext C phi) ⇔ NFadmit sigma phi ∧ FUadmitFO sigma phi UNIVls)`

val PFUadmit_def = Define`
  PFUadmit sigma theta U ⇔ T`

val PPUadmit_def = Define`
  PPUadmit sigma theta U ⇔
  list_inter (FVF sigma) U = []`

val PPadmit_def = Define`
  (PPadmit sigma (Pvar a) ⇔ T) ∧
  (PPadmit sigma (Sequence a b) ⇔
    PPadmit sigma a ∧ PPadmit sigma b ∧ PPUadmit sigma b (BVP (PPsubst a sigma)) ∧ hpsafe (PPsubst a sigma )) ∧
  (PPadmit sigma (Loop a) ⇔
    PPadmit sigma a ∧ PPUadmit sigma a (BVP (PPsubst a sigma)) ∧ hpsafe (PPsubst a sigma)) ∧
  (PPadmit sigma (EvolveODE ODE phi) ⇔ PFadmit sigma phi (*∧ PFUadmit sigma phi (BVO ODE)*)) ∧
  (PPadmit sigma (Choice a b) ⇔ PPadmit sigma a ∧ PPadmit sigma b) ∧
  (PPadmit sigma (Assign x theta) ⇔ T) ∧
  (PPadmit sigma (AssignAny x) ⇔ T) ∧
  (PPadmit sigma (DiffAssign x theta) ⇔ T) ∧
  (PPadmit sigma (Test phi) ⇔ PFadmit sigma phi) ∧
  (PFadmit sigma (Geq theta1 theta2) ⇔ T) ∧
  (PFadmit sigma (Prop f args) ⇔ T) ∧
  (PFadmit sigma (Not phi) ⇔ PFadmit sigma phi) ∧
  (PFadmit sigma (And phi psi) ⇔ PFadmit sigma phi ∧ PFadmit sigma psi) ∧
  (PFadmit sigma (Exists x phi) ⇔ PFadmit sigma phi (*∧ PFUadmit sigma phi [INL x]*)) ∧
  (PFadmit sigma (Diamond a phi) ⇔ PFadmit sigma phi ∧ PPadmit sigma a ∧ PFUadmit sigma phi (BVP (PPsubst a sigma))) ∧
  (PFadmit sigma (InContext C phi) ⇔ PFadmit sigma phi (*∧ PFUadmit sigma phi UNIV*))`

val Padmit_def = Define`
  (Padmit fu sigma (Pvar a) ⇔ T) ∧
  (Padmit fu sigma (Sequence a b) ⇔
    Padmit fu sigma a ∧ Padmit fu sigma b ∧ PUadmit fu sigma b (BVP (Psubst a sigma)) ∧
    hpsafe (Psubst a sigma)) ∧
  (Padmit fu sigma (Loop a) ⇔
  Padmit fu sigma a ∧ PUadmit fu sigma a (BVP (Psubst a sigma)) ∧ hpsafe (Psubst a sigma)) ∧
  (Padmit fu sigma (EvolveODE ODE phi) ⇔
    Oadmit sigma ODE (BVO ODE) ∧ Fadmit fu sigma phi ∧ FUadmit fu sigma phi (BVO ODE)) ∧
  (Padmit fu sigma (Choice a b) ⇔ Padmit fu sigma a ∧ Padmit fu sigma b) ∧
  (Padmit fu sigma (Assign x theta) ⇔ Tadmit sigma theta) ∧
  (Padmit fu sigma (AssignAny x) ⇔ T) ∧
  (Padmit fu sigma (DiffAssign x theta) ⇔ Tadmit sigma theta) ∧
  (Padmit fu sigma (Test phi) ⇔ Fadmit fu sigma phi) ∧
  (Fadmit fu sigma (Geq theta1 theta2) ⇔ Tadmit sigma theta1 ∧ Tadmit sigma theta2) ∧
  (Fadmit fu sigma (Prop p args) ⇔
    EVERY (Tadmit sigma) args ∧
    case sigma.SPredicates p of
      SOME p' => NFadmit (MAP (λ i. Tsubst i sigma) args) p' ∧
                 (EVERY (λi. dsafe (Tsubst i sigma)) args)
    | NONE => T) ∧
  (Fadmit fu sigma (Not phi) ⇔ Fadmit fu sigma phi) ∧
  (Fadmit fu sigma (And phi psi) ⇔ Fadmit fu sigma phi ∧ Fadmit fu sigma psi) ∧
  (Fadmit fu sigma (Exists x phi) ⇔ Fadmit fu sigma phi ∧ FUadmit fu sigma phi [INL x]) ∧
  (Fadmit fu sigma (Diamond a phi) ⇔ Fadmit fu sigma phi ∧ Padmit fu sigma a ∧ FUadmit fu sigma phi (BVP (Psubst a sigma)) ∧ hpsafe (Psubst a sigma)) ∧
  (Fadmit fu sigma (InContext C phi) ⇔
    Fadmit fu sigma phi ∧ FUadmit fu sigma phi UNIVls ∧
    case sigma.SContexts C of
      SOME C' => PFadmit (Fsubst phi sigma) C' ∧ fsafe(Fsubst phi sigma)
    | NONE => T)`

val Ssubst_def = Define`
  Ssubst (Gamma,Delta) sigma =
   (MAP (λp. Fsubst p sigma) Gamma, MAP (λp. Fsubst p sigma) Delta)`

val Rsubst_def = Define`
  Rsubst (SG,C) sigma = (MAP (λp. Ssubst p sigma) SG, Ssubst C sigma)`

val Sadmit_def = Define`
 Sadmit fu sigma (A,S) ⇔
 EVERY (Fadmit fu sigma) A ∧
 EVERY (Fadmit fu sigma) S`

val Radmit_def = Define`
  Radmit fu sigma R ⇔
  EVERY (Sadmit fu sigma) (FST R) ∧ Sadmit fu sigma (SND R)`

val Ssafe_def = Define`
  Ssafe (A,S) ⇔
  EVERY fsafe A ∧ EVERY fsafe S`

val Rsafe_def = Define`
  Rsafe R ⇔
  Ssafe (SND R) ∧ EVERY Ssafe (FST R)`

(* --- *)

val loop_iterate_axiom_def = Define`
  loop_iterate_axiom ids =
  (Box (Loop (%%a ids.vid1)) (Pc ids.pid1))
  <-> ((Pc ids.pid1) && (Box (%%a ids.vid1) (Box (Loop (%%a ids.vid1)) (Pc ids.pid1) )))`

val Iaxiom_def = Define`
  Iaxiom ids =
  ((Pc ids.pid1) && (Box (Loop (%%a ids.vid1)) ((Pc ids.pid1) --> (Box (%%a ids.vid1) (Pc ids.pid1))))) --> (Box (Loop (%%a ids.vid1)) (Pc ids.pid1))`

val test_axiom_def = Define`
  test_axiom ids =
  Box(Test (%%p ids.vid2 empty)) (%%p ids.vid1 empty)
  <->
  (%%p ids.vid2 empty --> %%p ids.vid1 empty)`

val box_axiom_def = Define`
  box_axiom ids =
  Diamond (%%a ids.vid1) (Pc ids.pid1)
  <->
  Not(Box(%%a ids.vid1)(Not(Pc ids.pid1)))`

val choice_axiom_def = Define`
  choice_axiom ids =
  Box (%%a ids.vid1 UU %%a ids.vid2) (Pc ids.pid1)
  <->
  Box (%%a ids.vid1) (Pc ids.pid1) &&
  Box (%%a ids.vid2) (Pc ids.pid1)`

val Kaxiom_def = Define`
  Kaxiom ids =
  Box(%%a ids.vid1) (Pc ids.pid1 --> Pc ids.pid2)
  -->
  Box(%%a ids.vid1) (Pc ids.pid1)
  -->
  Box(%%a ids.vid1) (Pc ids.pid2)`

val Vaxiom_def = Define`
  Vaxiom ids =
  %%p ids.vid1 empty  --> Box (%%a ids.vid1)(%%p ids.vid1 empty)`

val assign_axiom_def = Define`
  assign_axiom ids =
  Box (ids.vid1 := (%%f ids.fid1 empty)) (%%p ids.vid1 (singleton ids (Var ids.vid1)))
  <->
  Prop ids.vid1 (singleton ids (%%f ids.fid1 empty))`

val diff_assign_axiom_def = Define`
  diff_assign_axiom ids =
  Box ( DiffAssign ids.vid1 (%%f ids.fid1 empty)) (%%p ids.vid1 (singleton ids (DiffVar ids.vid1)))
  <->
  Prop ids.vid1 (singleton ids (%%f ids.fid1 empty))`

val diff_const_axiom_def = Define`
  diff_const_axiom ids = Equals (Differential (%%f ids.fid1 empty)) (Const 0w)`

val diff_var_axiom_def = Define`
  diff_var_axiom ids = Equals (Differential (Var ids.vid1)) (DiffVar ids.vid1)`

val _ = overload_on("state_fun",``DFunl``);

val diff_plus_axiom_def = Define`
  diff_plus_axiom ids =
  Equals (Differential (Plus (state_fun ids.fid1) (state_fun ids.fid2)))
    (Plus (Differential (state_fun ids.fid1)) (Differential (state_fun ids.fid2)))`

val diff_times_axiom_def = Define`
  diff_times_axiom ids =
  Equals (Differential (Times (state_fun ids.fid1) (state_fun ids.fid2)))
    (Plus (Times (Differential (state_fun ids.fid1)) (state_fun ids.fid2))
          (Times (state_fun ids.fid1) (Differential (state_fun ids.fid2)) ))`

val DWaxiom_def = Define`
  DWaxiom ids =
  Box (EvolveODE (OVar ids.vid1 NONE) (Pc ids.pid2)) (Pc ids.pid1)
  <->
  Box (EvolveODE (OVar ids.vid1 NONE) (Pc ids.pid2)) (Pc ids.pid2 --> Pc ids.pid1)`

val f1_def = Define`
  f1 ids f x = Function f (singleton ids (Var x))`

val p1_def = Define`
  p1 ids p x = Prop p (singleton ids (Var x))`

val f0_def = Define`
  f0 f = Function f empty`

val DEaxiom_def = Define`
  DEaxiom ids =
((Box(EvolveODE (OSing ids.vid1 (f1 ids ids.fid1 ids.vid1)) (p1 ids ids.vid2 ids.vid1)) (Pc ids.pid1))
<->
 (Box(EvolveODE (OSing ids.vid1 (f1 ids ids.fid1 ids.vid1)) (p1 ids ids.vid2 ids.vid1))
    (Box(DiffAssign ids.vid1 (f1 ids ids.fid1 ids.vid1)) (Pc ids.pid1))))`

val DCaxiom_def = Define`
  DCaxiom ids =
  ((Box(EvolveODE (OVar ids.vid1 NONE) (Pc ids.pid2)))(Pc ids.pid3)) -->
(((Box(EvolveODE (OVar ids.vid1 NONE) (Pc ids.pid2)))(Pc ids.pid1))
  <->
   ((Box(EvolveODE (OVar ids.vid1 NONE) (And (Pc ids.pid2) (Pc ids.pid3))))(Pc ids.pid1)))`

val DSaxiom_def = Define`
  DSaxiom ids =
(((Box(EvolveODE (OSing ids.vid1 (f0 ids.fid1)) (p1 ids ids.vid2 ids.vid1)))(p1 ids ids.vid3 ids.vid1))
<->
(Forall ids.vid2
 (Implies (Geq (Var ids.vid2) (Const (0w)))
 (Implies
   (Forall ids.vid3
     (Implies (And (Geq (Var ids.vid3) (Const (0w))) (Geq (Var ids.vid2) (Var ids.vid3)))
        (Prop ids.vid2 (singleton ids (Plus (Var ids.vid1) (Times (f0 ids.fid1) (Var ids.vid3)))))))
   ((Box(Assign ids.vid1 (Plus (Var ids.vid1) (Times (f0 ids.fid1) (Var ids.vid2)))))(p1 ids ids.vid3 ids.vid1))))))`

val EquivReflexiveAxiom_def = Define`
  EquivReflexiveAxiom ids = (Prop ids.vid1 empty) <-> (Prop ids.vid1 empty)`

val DiffEffectSysAxiom_def = Define`
  DiffEffectSysAxiom ids = ((Box(EvolveODE (oprod (OSing ids.vid1 (DFunl ids.fid1)) (OVar ids.vid1 (SOME ids.vid1))) (Pc ids.pid2)))(Pc ids.pid1))
 <->
 ((Box(EvolveODE (oprod (OVar ids.vid1 (SOME ids.vid1)) (OSing ids.vid1 (DFunl ids.fid1))) (Pc ids.pid2)))((Box(DiffAssign ids.vid1 (DFunl ids.fid1)))(Pc ids.pid1)))`

val AllElimAxiom_def = Define`
  AllElimAxiom ids = (Forall ids.vid1 (Pc ids.pid1)) --> (Pc ids.pid1)`

val DiffLinearAxiom_def = Define`
  DiffLinearAxiom ids =
  Equals
  (Differential (Times (Function ids.fid2 empty) (DFunl ids.fid1)))
  (Times (Function ids.fid2 empty) (Differential (DFunl ids.fid1)))`

val BoxSplitAxiom_def = Define`
  BoxSplitAxiom ids =
  ((Box(Pvar ids.vid1))(And (Pc ids.pid1) (Pc ids.pid2)))
  <->  (And ((Box(Pvar ids.vid1))(Pc ids.pid1))
           ((Box(Pvar ids.vid1))(Pc ids.pid2)))`

val ImpSelfAxiom_def = Define`
  ImpSelfAxiom ids =
  Equiv
   ((Prop ids.vid1 empty) --> (Prop ids.vid1 empty))
   TT`

val compose_axiom_def = Define`
  compose_axiom ids =
  (Box( Sequence (%%a ids.vid1) (%%a ids.vid2))(Pc ids.pid1)) <->
  ((Box(%%a ids.vid1) ((Box( %%a ids.vid2)) (Pc ids.pid1))))`

val constFcongAxiom_def = Define`
  constFcongAxiom ids =
  Implies
   (Equals (Function ids.fid1 empty) (Function ids.fid2 empty))
   (Equiv
     (Prop ids.vid1 (singleton ids (Function ids.fid1 empty)))
     (Prop ids.vid1 (singleton ids (Function ids.fid2 empty))))`

val dMinusAxiom_def = Define`
  dMinusAxiom ids =
  Equals
   (Differential (Minus (DFunl ids.fid1) (DFunl ids.fid2)))
   (Minus (Differential (DFunl ids.fid1)) (Differential(DFunl  ids.fid2)))`

val assignEqAxiom_def = Define`
  assignEqAxiom ids =
  Equiv
    ((Box(Assign ids.vid1 (Function ids.fid1 empty)))(Pc ids.pid1))
    (Forall ids.vid1 (Implies (Equals (Var ids.vid1) (Function ids.fid1 empty)) (Pc ids.pid1)))`

val allInstAxiom_def = Define`
  allInstAxiom ids = Implies (Forall ids.vid1 (Prop ids.vid1 (singleton ids (Var ids.vid1)))) ( Prop ids.vid1(singleton ids (Function ids.fid1 empty)))`

val assignAnyAxiom_def = Define`
  assignAnyAxiom ids =
  Equiv
   (Box (AssignAny ids.vid1) (Pc ids.pid1))
   (Forall ids.vid1 (Pc ids.pid1))`

val equalCommuteAxiom_def = Define`
  equalCommuteAxiom ids =
  Equiv
  (Equals (f0 ids.fid1) (f0 ids.fid2))
  (Equals (f0 ids.fid2) (f0 ids.fid1))`

val get_axiom_def = Define`
  (get_axiom ids AloopIter = loop_iterate_axiom ids) ∧
  (get_axiom ids AI = Iaxiom ids) ∧
  (get_axiom ids Atest = test_axiom ids) ∧
  (get_axiom ids Abox = box_axiom ids) ∧
  (get_axiom ids Achoice = choice_axiom ids) ∧
  (get_axiom ids AK = Kaxiom ids) ∧
  (get_axiom ids AV = Vaxiom ids) ∧
  (get_axiom ids Aassign = assign_axiom ids) ∧
  (get_axiom ids Adassign = diff_assign_axiom ids) ∧
  (get_axiom ids AdConst = diff_const_axiom ids) ∧
  (get_axiom ids AdPlus = diff_plus_axiom ids) ∧
  (get_axiom ids AdMult = diff_times_axiom ids) ∧
  (get_axiom ids Advar = diff_var_axiom ids) ∧
  (get_axiom ids ADW = DWaxiom ids) ∧
  (get_axiom ids ADE = DEaxiom ids) ∧
  (get_axiom ids ADC = DCaxiom ids) ∧
  (get_axiom ids ADS = DSaxiom ids) ∧
  (get_axiom ids AEquivReflexive = EquivReflexiveAxiom ids) ∧
  (get_axiom ids ADiffEffectSys = DiffEffectSysAxiom ids) ∧
  (get_axiom ids AAllElim = AllElimAxiom ids) ∧
  (get_axiom ids ADiffLinear = DiffLinearAxiom ids) ∧
  (get_axiom ids AboxSplit = BoxSplitAxiom ids) ∧
  (get_axiom ids AImpSelf = ImpSelfAxiom ids) ∧
  (get_axiom ids Acompose = compose_axiom ids) ∧
  (get_axiom ids AconstFcong = constFcongAxiom ids) ∧
  (get_axiom ids AdMinus = dMinusAxiom ids) ∧
  (get_axiom ids AassignEq = assignEqAxiom ids) ∧
  (get_axiom ids AallInst = allInstAxiom ids) ∧
  (get_axiom ids AassignAny = assignAnyAxiom ids) ∧
  (get_axiom ids AequalCommute = equalCommuteAxiom ids)`
  (* TODO: complete the list! *)

val CQaxrule_def = Define`
  CQaxrule ids =
  ( [([],[Equals (%%F ids.fid1) (%%F ids.fid2)])],
    ([],[Prop ids.vid3 (singleton ids (%%F ids.fid1)) <-> Prop ids.vid3 (singleton ids (%%F ids.fid2))])): ('a,'b) rule`

val CEaxrule_def = Define`
  CEaxrule ids =
  ( [([],[Equiv (Pc ids.pid1) (Pc ids.pid2)])],
    ([],[InContext ids.pid3 (Pc ids.pid1) <-> InContext ids.pid3 (Pc ids.pid2)])): ('a,'b) rule`

val Gaxrule_def = Define`
  Gaxrule ids =
  ( [([],[Predicational ids.pid1])],
    ([],[Box (Pvar ids.vid1) (Predicational ids.pid1) ])): ('a,'b) rule`

val monbrule_def = Define`
  monbrule ids =
  ( [([Predicational ids.pid1],[Predicational ids.pid2])],
    ([Box (Pvar ids.vid1) (Predicational ids.pid1) ],[Box (Pvar ids.vid1) (Predicational ids.pid2) ])): ('a,'b) rule`

val get_axrule_def = Define`
  (get_axrule ids CQ = CQaxrule ids) ∧
  (get_axrule ids CE = CEaxrule ids) ∧
  (get_axrule ids G = Gaxrule ids) ∧
  (get_axrule ids monb = monbrule ids)`

val start_proof_def = Define`
  start_proof S = ([S],S):('a,'b)rule`

val closeI_def = Define`
  (closeI (x::xs) 0 = xs) ∧
  (closeI (x::xs) (SUC n) = x::(closeI xs n)) ∧
  (closeI [] _ = [])` (* Note, ARB replaced here *)

val replaceI_def = Define`
  (replaceI (x::xs) 0 y = y::xs) ∧
  (replaceI (x::xs) (SUC n) y = x::replaceI xs n y) ∧
  (replaceI [] _ y = [])` (* Note, ARB replaced here *)

val merge_rule_def = Define`
  (merge_rules (P1,C1) ([],C2) i =
    if (i < LENGTH P1 ∧ nth P1 i = C2) then
      SOME (closeI P1 i, C1)
    else NONE) ∧
  (merge_rules (P1,C1) (S::SS,C2) i =
    if (i < LENGTH P1 ∧ nth P1 i = C2) then
      SOME (replaceI P1 i S ++ SS, C1)
    else NONE)`

val _ = Parse.hide "S";

val LeftRule_result_def = Define`
  (LeftRule_result AndL j AS = case AS of (A,S) =>
    if j >= LENGTH A then NONE else
    (case (nth A j) of
      And p q => SOME [((closeI A j) ++ [p;q], S)]
      | _ => NONE)) ∧
  (LeftRule_result ImplyL j AS = case AS of (A,S) =>
    if j >= LENGTH A then NONE else
    (case (nth A j) of
      Not (And (Not q) (Not (Not p))) => SOME [(closeI A j, S ++ [p]); (replaceI A j q, S)]
    | _ => NONE)) ∧
  (LeftRule_result HideL j AS = case AS of (A,S) => SOME [(closeI A j, S)]) ∧
  (LeftRule_result (CutLeft f) j AS = case AS of (A,S) =>
    if j >= LENGTH A then NONE else
    SOME [((replaceI A j f),S); ((closeI A j), S ++[Implies (nth A j) f])]) ∧
  (LeftRule_result EquivL j AS = case AS of (A,S) =>
    if j >= LENGTH A then NONE else
    (case (nth A j) of
      Not(And (Not (And p q)) (Not (And (Not p') (Not q')))) =>
       (if (p = p' ∧ q = q') then SOME [(replaceI A j (And p q), S); (replaceI A j (And (Not p) (Not q)) , S)] else NONE)
    | _ => NONE)) ∧
  (LeftRule_result (BRenameL x y) j AS = case AS of (A,S) => (if x = y then NONE else
    if j >= LENGTH A then NONE else
  (case (nth A j) of
   Not(Diamond (Assign xvar theta) (Not phi)) =>
    (if
     x = xvar ∧
     (TRadmit theta ∧ FRadmit(Box (Assign xvar theta)phi) ∧ FRadmit phi ∧ fsafe (Box(Assign xvar theta) phi) ∧
     list_inter [INL y; INR y; INR x] (FVF (Box (Assign xvar theta)phi)) = [])
    then
        SOME [(replaceI A j (FBrename x y (nth A j)),S)]
    else NONE)
   | _ => NONE))) ∧
  (LeftRule_result NotL j AS = case AS of (A,S) =>
    if j >= LENGTH A then NONE else
   (case (nth A j) of (Not p) => SOME [(closeI A j , S ++ [p])] | _ => NONE))`

val RightRule_result_def = Define`
  (RightRule_result NotR j AS = case AS of (A,S) =>
    if j >= LENGTH S then NONE else
    (case (nth S j) of (Not p) => SOME [(A ++ [p], closeI S j)] | _ => NONE)) ∧
  (RightRule_result AndR j AS = case AS of (A,S) =>
    if j >= LENGTH S then NONE else
    (case (nth S j) of (And p q) => SOME [(A, replaceI S j p); (A, replaceI S j q)] | _ => NONE)) ∧
  (RightRule_result ImplyR j AS = case AS of (A,S) =>
    if j >= LENGTH S then NONE else
    (case (nth S j) of Not (And (Not q) (Not (Not p))) =>
    SOME [(A ++ [p], (closeI S j) ++ [q])] | _ => NONE)) ∧
  (RightRule_result EquivR j AS = case AS of (A,S) =>
    if j >= LENGTH S then NONE else
    (case (nth S j) of Not(And (Not (And p q)) (Not (And (Not p') (Not q')))) =>
                (if (p = p' ∧ q = q') then (SOME [(A ++ [p], (closeI S j) ++ [q]); ( A ++ [q], (closeI S j) ++ [p])])
                else (NONE)) | _ => NONE)) ∧
  (RightRule_result CohideRR j AS = case AS of (A,S) =>
    if j >= LENGTH S then NONE else
    SOME [([], [nth S j])]) ∧
  (RightRule_result TrueR j AS = case AS of (A,S) =>
    if j >= LENGTH S then NONE else
    (case (nth S j) of (Geq (Const x) (Const y)) =>
    (if (x = y ∧ (x = 0w)) then(SOME []) else NONE) | _ => NONE)) ∧
  (RightRule_result Skolem j AS = case AS of (A,S) =>
    if j >= LENGTH S then NONE else
    (case (nth S j) of (Not (Exists x (Not p)))  =>
    (if (¬ MEM (INL x) (FVSeq (A,S))) ∧ fsafe (FOLDR (And) TT A) ∧ fsafe (FOLDR (Or) FF (closeI S j))then
      SOME [(A, replaceI S j p)]
    else NONE)
  | _ => NONE)) ∧
  (RightRule_result (BRenameR x y) j AS = case AS of (A,S) => (if x = y then NONE else
    if j >= LENGTH S then NONE else
    (case (nth S j) of
     Not(Diamond (Assign xvar theta) (Not phi)) =>
      (if
        x = xvar ∧
       (TRadmit theta ∧  FRadmit(Box (Assign xvar theta) phi) ∧ FRadmit phi ∧ fsafe ( Box(Assign xvar theta)phi) ∧
       list_inter [INL y; INR y; INR x] (FVF (Box(Assign xvar theta)phi)) = [])  ∧
          FRadmit (Box(y := theta) (FUrename xvar  y phi)) ∧
        FRadmit (FUrename xvar y phi) ∧
      fsafe (Box(y := theta)(FUrename xvar y phi)) ∧
    list_inter [INL xvar; INR xvar; INR y] (FVF (Box(y := theta)(FUrename xvar y phi))) = []

      then
          SOME [(A, replaceI S j (FBrename x y (nth S j)))]
      else NONE)
     | Not(Exists xvar (Not phi)) =>
      (if
        x = xvar ∧
       (FRadmit(Forall xvar phi) ∧ FRadmit phi ∧ fsafe (Forall xvar phi) ∧
       list_inter [INL y; INR y; INR x] (FVF (Forall xvar phi)) = []) ∧
        FRadmit (Forall  y (FUrename xvar  y phi)) ∧
        FRadmit (FUrename xvar y phi) ∧
       fsafe (Forall y (FUrename xvar y phi)) ∧
       list_inter [INL xvar; INR xvar; INR y] (FVF (Forall y (FUrename xvar y phi))) = []
      then
          SOME [(A, replaceI S j (FBrename x y (nth S j)))]
      else NONE)
     | _ => NONE))) ∧
  (RightRule_result HideR j AS = case AS of (A,S) => SOME [(A, closeI S j)]) ∧
  (RightRule_result (CutRight v) j AS = case AS of (A,S) =>
    if j >= LENGTH S then NONE else
    SOME [(A, replaceI S j v); (A,replaceI S j (Implies v (nth S j)))]) ∧
  (RightRule_result EquivifyR j AS = case AS of (A,S) =>
    if j >= LENGTH S then NONE else
    (case (nth S j) of Not (And (Not q) (Not (Not p))) =>
SOME [(A, replaceI S j (Equiv p q))] | _ => NONE)) ∧
  (RightRule_result CommuteEquivR j AS = case AS of (A,S) =>
    if j >= LENGTH S then NONE else
    (case nth S j of
Not(And (Not (And p q)) (Not (And (Not p') (Not q')))) =>
                (if (p = p' ∧ q = q') then (SOME[(A, replaceI S j (Equiv q p))])
                else NONE)| _ => NONE))`

val seq2fml_def = Define`
  seq2fml (ante,succ) = Implies (FOLDR And TT ante) (FOLDR Or FF succ)`

val SUrename_def = Define`
  SUrename x y AS = case AS of (A,S) => (MAP (FUrename x y) A, MAP (FUrename x y) S)`

val rule_result_def = Define`
  (rule_result ids SGC (i,LeftRule L j) = case SGC of (SG,C) =>
    if i >= LENGTH SG then NONE else
   (if j ≥ LENGTH (FST (nth SG i)) then NONE else
   (case (LeftRule_result L j (nth SG i)) of
     SOME a => merge_rules (SG,C) (a, nth SG i) i
   | NONE => NONE))) ∧
  (rule_result ids SGC (i,RightRule R j) = case SGC of (SG,C) =>
    if i >= LENGTH SG then NONE else
   (if j ≥ LENGTH (SND (nth SG i)) then NONE else
   (case (RightRule_result R j (nth SG i)) of
     SOME a => merge_rules (SG,C) (a, nth SG i) i
   | NONE => NONE(* [(SG,C)]*)))) ∧
  (rule_result ids SGC (i,Cut phi) = case SGC of (SG,C) =>
    if i >= LENGTH SG then NONE else
    (if(fsafe phi) then
      (let (A,S)= nth SG i in  (merge_rules (SG,C) ([(A ++ [phi], S); (A,  S ++ [phi])], (A,S)) i))
    else NONE)) ∧
  (rule_result ids SGC (i,CloseId j k) = case SGC of (SG,C) =>
    if i >= LENGTH SG then NONE else
  (if (j < LENGTH (FST (nth SG i))) ∧ (k < LENGTH (SND (nth SG i))) ∧ nth (FST (nth SG i)) j = nth (SND (nth SG i)) k then
    SOME (closeI SG i, C)
   else NONE)) ∧
  (rule_result ids SGC (i, URename x y) = case SGC of (SG,C) =>
    if i >= LENGTH SG then NONE else
    (if(FRadmit (seq2fml (nth SG i)) ∧ FRadmit (seq2fml (SUrename x y (nth SG i))) ∧ fsafe (seq2fml (SUrename x y (nth SG i)))) then
      merge_rules (SG,C) ([SUrename x y (nth SG i)],nth SG i) i
    else NONE)) ∧
  (rule_result ids SGC (i, Cohide2 j k) = case SGC of (SG,C) =>
    if i >= LENGTH SG then NONE else
  (if ((j ≥ LENGTH (FST (nth SG i))) ∨ (k ≥ LENGTH (SND (nth SG i)))) then NONE
   else
    (merge_rules (SG,C) ([([nth (FST(nth SG i)) j],[nth (SND(nth SG i)) k])], (nth SG i)) i))) ∧
  (rule_result ids SGC (i, DIGeqSchema ODE theta1 theta2) = case SGC of (SG,C) =>
    if i >= LENGTH SG then NONE else
  (let proved =
      ([],[Implies
        (Implies (DPredl ids.vid1) (And (Geq theta1 theta2) (Box(EvolveODE ODE (DPredl ids.vid1))(Geq (Differential theta1) (Differential theta2)))))
        (Box(EvolveODE ODE (DPredl ids.vid1))(Geq theta1 theta2))])
     in
   let wanted = nth SG i in
   if (proved = wanted ∧
    osafe ODE ∧
    dfree theta1 ∧
    dfree theta2 ∧
    list_subset (FVT theta1) (MAP INL (ODE_dom ODE)) ∧
    list_subset (FVT theta2) (MAP INL (ODE_dom ODE))) then
        SOME (closeI SG i,C)
     else NONE)) ∧
  (rule_result ids SGC (i, DIGrSchema ODE theta1 theta2) = case SGC of (SG,C) =>
    if i >= LENGTH SG then NONE else
  (let proved =
    ([],[Implies
      (Implies (DPredl ids.vid1) (And (Greater theta1 theta2) (Box(EvolveODE ODE (DPredl ids.vid1))(Geq (Differential theta1) (Differential theta2)))))
      (Box(EvolveODE ODE (DPredl ids.vid1))(Greater theta1 theta2))])
   in
   let wanted = nth SG i in
   if (proved = wanted ∧
    osafe ODE ∧
    dfree theta1 ∧
    dfree theta2 ∧
    list_subset (FVT theta1) (MAP INL (ODE_dom ODE)) ∧
    list_subset (FVT theta2) (MAP INL (ODE_dom ODE))) then
        SOME (closeI SG i,C)
   else NONE)) ∧
  (rule_result ids SGC (i, DIEqSchema ODE theta1 theta2) = case SGC of (SG,C) =>
    if i >= LENGTH SG then NONE else
  (let proved =
    ([],[Implies
      (Implies (DPredl ids.vid1) (And (Equals theta1 theta2) (Box(EvolveODE ODE (DPredl ids.vid1))(Equals (Differential theta1) (Differential theta2)))))
      (Box(EvolveODE ODE (DPredl ids.vid1))(Equals theta1 theta2))])
   in
   let wanted = nth SG i in
   if (proved = wanted ∧
    osafe ODE ∧
    dfree theta1 ∧
    dfree theta2 ∧
    list_subset (FVT theta1) (MAP INL (ODE_dom ODE)) ∧
    list_subset (FVT theta2) (MAP INL (ODE_dom ODE))) then
        SOME (closeI SG i,C)
   else NONE))`;

val fnc_def = Define`
  fnc ids r s ra =
  (case (rule_result ids (start_proof s) (0,ra))   of
    SOME rule => merge_rules rule r 0
  | NONE  => NONE)`

val pro_def = Define`
  pro r1 r2 = merge_rules r2 r1 0`

val pt_result_def = Define`
  (pt_result fu ids (FOLRConstant f) = SOME ([], ([],[f]))) ∧
  (pt_result fu ids (RuleApplication pt ra i) =
    case pt_result fu ids pt of
    SOME res => if i ≥ LENGTH (FST res) then NONE else rule_result ids res (i,ra)
  | NONE => NONE) ∧
  (pt_result fu ids (AxiomaticRule ar) = SOME(get_axrule ids ar)) ∧
  (pt_result fu ids (PrUSubst pt sub) =
    case pt_result fu ids pt of
    SOME res =>
      if ssafe fu sub ∧ Radmit fu sub res ∧ Rsafe res ∧
        (FVS fu sub = [] ∨ FST res = [] ∨ res = CQaxrule ids)
      then
        SOME (Rsubst res sub)
      else NONE
  | NONE => NONE) ∧
  (pt_result fu ids (Ax a) = SOME ([],([],[get_axiom ids a]))) ∧
  (pt_result fu ids (FNC pt s ra) =
    case pt_result fu ids pt of
      SOME res => fnc ids res s ra
      | NONE => NONE) ∧
  (pt_result fu ids (Pro pt1 pt2) =
    case pt_result fu ids pt2 of
      SOME res2 =>
      if LENGTH (FST res2) ≠ 1 then NONE else
      (case pt_result fu ids pt1 of
        SOME res1 => pro res1 res2
      | NONE => NONE)
    | NONE => NONE) ∧
  (pt_result fu ids (Start f) = SOME (start_proof f)) ∧
  (pt_result fu ids (Sub pt1 pt2 i) =
    case pt_result fu ids pt1 of
      SOME res1 =>
      if (i ≥ LENGTH (FST res1)) then NONE else
      (case pt_result fu ids pt2 of
        SOME res2 => merge_rules res1 res2 i
      | NONE => NONE)
    | NONE => NONE)`

val _ = export_theory();
