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

           pid1 : 'c;
           pid2 : 'c;
           pid3 : 'c;
           pid4 : 'c|>`

(* More defs from Syntax.thy *)
val Predicational_def = Define`
  Predicational P = InContext P (Geq (Const 0w) (Const 0w))`

val _ = Parse.overload_on ("Pc",``Predicational``);

val singleton_def = Define`
  singleton ids t = MAP (λi. if ids.is_vid1 i then t else Const 0w) varls`

val empty_def = Define`
  empty = MAP (λv. Const 0w) varls`

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

val dfree_def = tDefine "dfree_def" `
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

val dsafe_def = tDefine "dsafe_def" `
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
val primify_def = Define`
  (primify (INL x) = [INL x;INR x]) ∧
  (primify (INR x) = [INL x;INR x])`

val UNIVls_def = Define`
  UNIVls = MAP INL varls ++ MAP INR varls`

val FVT_def = tDefine "FVT_def"`
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

val BVF_def = Define`
  (BVF (Geq f g) = []) ∧
  (BVF (Prop p dfun_args) = []) ∧
  (BVF (Not p) = BVF p) ∧
  (BVF (And p q) = BVF p ++ BVF q) ∧
  (BVF (Exists x p) = [INL x] ++ BVF p) ∧
  (BVF (Diamond a p) = BVP a ++ BVF p) ∧
  (BVF (InContext C p) = UNIVls) ∧
  (BVP (Pvar a) = UNIVls) ∧
  (BVP (Assign x t) = [INL x]) ∧
  (BVP (AssignAny x) = [INL x]) ∧
  (BVP (DiffAssign x t) = [INR x]) ∧
  (BVP (Test f) = []) ∧
  (BVP (EvolveODE ODE f) = BVO ODE) ∧
  (BVP (Choice a b) = BVP a ++ BVP b) ∧
  (BVP (Sequence a b) = BVP a ++ BVP b) ∧
  (BVP (Loop a) = BVP a)`

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

val FVF_def = Define`
  (FVF (Geq f g) = FVT f ++ FVT g) ∧
  (FVF (Prop p args) = FLAT (MAP FVT args)) ∧
  (FVF (Not p) = FVF p) ∧
  (FVF (And p q) = FVF p ++ FVF q) ∧
  (FVF (Exists x p) = list_minus (FVF p) [INL x]) ∧
  (FVF (Diamond a p) = (FVP a ++ (list_minus (FVF p) (MBV a)))) ∧
  (FVF (InContext C p) = UNIVls) ∧
  (FVP (Pvar a) = UNIVls) ∧
  (FVP (Assign x t) = FVT t) ∧
  (FVP (AssignAny x) = []) ∧
  (FVP (DiffAssign x t) = FVT t) ∧
  (FVP (Test f) = FVF f) ∧
  (FVP (EvolveODE ODE f) = (MAP INL (FVO ODE)) ++ FVF f) ∧
  (FVP (Choice a b) = FVP a ++ FVP b) ∧
  (FVP (Sequence a b) = FVP a ++ (list_minus (FVP b) (MBV a))) ∧
  (FVP (Loop a) = FVP a)`

val FVSeq_def = Define`
  FVSeq ((A,S):('a,'b) sequent) = FOLDR (λx acc. (acc ++ (FVF x))) [] A  ++
                FOLDR (λx acc. (acc ++ (FVF x))) [] S`

(* Uniform Renaming.thy *)
val TRadmit_def = tDefine "TRadmit_def" `
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

val TUrename_def = tDefine "TUrename_def" `
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

val diff_var_axiom_def = Define`
  diff_var_axiom ids =
  Equals (Differential (Var ids.vid1)) (DiffVar ids.vid1)`

val DWaxiom_def = Define`
  DWaxiom ids =
  Box (EvolveODE (OVar ids.vid1 NONE) (Pc ids.pid2)) (Pc ids.pid1)
  <->
  Box (EvolveODE (OVar ids.vid1 NONE) (Pc ids.pid2)) (Pc ids.pid2 --> Pc ids.pid1)`

val f1_def = Define`
  f1 ids f x = Function f (singleton ids (Var x))`

val p1_def = Define`
  p1 ids p x = Prop p (singleton ids (Var x))`

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
  (get_axiom ids Advar = diff_var_axiom ids)`
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

val LeftRule_result_def = Define`
  (LeftRule_result AndL j (A,S) =
    (case (nth A j) of
      And p q => SOME [((closeI A j) ++ [p;q], S)]
      | _ => NONE)) ∧
  (LeftRule_result ImplyL j (A,S) =
    (case (nth A j) of
      Not (And (Not q) (Not (Not p))) => SOME [(closeI A j, S ++ [p]); (replaceI A j q, S)]
    | _ => NONE)) ∧
  (LeftRule_result HideL j (A,S) = SOME [(closeI A j, S)]) ∧
  (LeftRule_result (CutLeft f) j (A,S) = SOME [((replaceI A j f),S); ((closeI A j), S ++[Implies (nth A j) f])]) ∧
  (LeftRule_result EquivL j (A,S) =
    (case (nth A j) of
      Not(And (Not (And p q)) (Not (And (Not p') (Not q')))) =>
       (if (p = p' ∧ q = q') then SOME [(replaceI A j (And p q), S); (replaceI A j (And (Not p) (Not q)) , S)] else NONE)
    | _ => NONE)) ∧
  (LeftRule_result (BRenameL x y) j (A,S) = (if x = y then NONE else
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
  (LeftRule_result NotL j (A,S) = (case (nth A j) of (Not p) => SOME [(closeI A j , S ++ [p])] | _ => NONE))`

val RightRule_result_def = Define`
  (RightRule_result NotR j (A,S) = (case (nth S j) of (Not p) => SOME [(A ++ [p], closeI S j)] | _ => NONE)) ∧
  (RightRule_result AndR j (A,S) = (case (nth S j) of (And p q) => SOME [(A, replaceI S j p); (A, replaceI S j q)] | _ => NONE)) ∧
  (RightRule_result ImplyR j (A,S) = (case (nth S j) of Not (And (Not q) (Not (Not p))) =>
    SOME [(A ++ [p], (closeI S j) ++ [q])] | _ => NONE)) ∧
  (RightRule_result EquivR j (A,S) =
   (case (nth S j) of Not(And (Not (And p q)) (Not (And (Not p') (Not q')))) =>
                (if (p = p' ∧ q = q') then (SOME [(A ++ [p], (closeI S j) ++ [q]); ( A ++ [q], (closeI S j) ++ [p])])
                else (NONE)) | _ => NONE)) ∧
  (RightRule_result CohideRR j (A,S) = SOME [([], [nth S j])]) ∧
  (RightRule_result TrueR j (A,S) = (case (nth S j) of (Geq (Const x) (Const y)) =>
    (if (x = y ∧ (x = 0w)) then(SOME []) else NONE) | _ => NONE)) ∧
  (RightRule_result Skolem j (A,S) = (case (nth S j) of (Not (Exists x (Not p)))  =>
    (if (¬ MEM (INL x) (FVSeq (A,S))) ∧ fsafe (FOLDR (And) TT A) ∧ fsafe (FOLDR (Or) FF (closeI S j))then
      SOME [(A, replaceI S j p)]
    else NONE)
  | _ => NONE)) ∧
  (RightRule_result (BRenameR x y) j (A,S) = (if x = y then NONE else
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
  (RightRule_result HideR j (A,S) = SOME [(A, closeI S j)]) ∧
  (RightRule_result (CutRight v) j (A,S) = SOME [(A, replaceI S j v); (A,replaceI S j (Implies v (nth S j)))]) ∧
  (RightRule_result EquivifyR j (A,S) = (case (nth S j) of Not (And (Not q) (Not (Not p))) =>
SOME [(A, replaceI S j (Equiv p q))] | _ => NONE)) ∧
  (RightRule_result CommuteEquivR j (A,S) = (case nth S j of
Not(And (Not (And p q)) (Not (And (Not p') (Not q')))) =>
                (if (p = p' ∧ q = q') then (SOME[(A, replaceI S j (Equiv q p))])
                else NONE)| _ => NONE))`

val seq2fml_def = Define`
  seq2fml (ante,succ) = Implies (FOLDR And TT ante) (FOLDR Or FF succ)`

val SUrename_def = Define`
  SUrename x y (A,S) = (MAP (FUrename x y) A, MAP (FUrename x y) S)`

val rule_result_def = Define`
  (rule_result ids (SG,C) (i,LeftRule L j) =
   (if j ≥ LENGTH (FST (nth SG i)) then NONE else
   (case (LeftRule_result L j (nth SG i)) of
     SOME a => merge_rules (SG,C) (a, nth SG i) i
   | NONE => NONE))) ∧
  (rule_result ids (SG,C) (i,RightRule R j) =
   (if j ≥ LENGTH (SND (nth SG i)) then NONE else
   (case (RightRule_result R j (nth SG i)) of
     SOME a => merge_rules (SG,C) (a, nth SG i) i
   | NONE => NONE(* [(SG,C)]*)))) ∧
  (rule_result ids (SG,C) (i,Cut phi) =
    (if(fsafe phi) then
      (let (A,S)= nth SG i in  (merge_rules (SG,C) ([(A ++ [phi], S); (A,  S ++ [phi])], (A,S)) i))
    else NONE)) ∧
  (rule_result ids (SG,C) (i,CloseId j k) =
  (if (j < LENGTH (FST (nth SG i))) ∧ (k < LENGTH (SND (nth SG i))) ∧ nth (FST (nth SG i)) j = nth (SND (nth SG i)) k then
    SOME (closeI SG i, C)
   else NONE)) ∧
  (rule_result ids (SG, C) (i, URename x y) =
    (if(FRadmit (seq2fml (nth SG i)) ∧ FRadmit (seq2fml (SUrename x y (nth SG i))) ∧ fsafe (seq2fml (SUrename x y (nth SG i)))) then
      merge_rules (SG,C) ([SUrename x y (nth SG i)],nth SG i) i
    else NONE)) ∧
  (rule_result ids (SG, C) (i, Cohide2 j k) =
  (if ((j ≥ LENGTH (FST (nth SG i))) ∨ (k ≥ LENGTH (SND (nth SG i)))) then NONE
   else
    (merge_rules (SG,C) ([([nth (FST(nth SG i)) j],[nth (SND(nth SG i)) k])], (nth SG i)) i))) ∧
  (rule_result ids (SG,C) (i, DIGeqSchema ODE theta1 theta2) =
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
  (rule_result ids (SG,C) (i, DIGrSchema ODE theta1 theta2) =
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
  (rule_result ids (SG,C) (i, DIEqSchema ODE theta1 theta2) =
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
  (pt_result ids (FOLRConstant f) = SOME ([], ([],[f]))) ∧
  (pt_result ids (RuleApplication pt ra i) =
    case pt_result ids pt of
    SOME res => if i ≥ LENGTH (FST res) then NONE else rule_result ids res (i,ra)
  | NONE => NONE) ∧
  (pt_result ids (AxiomaticRule ar) = SOME(get_axrule ids ar)) ∧
  (*(pt_result (PrUSubst pt sub) = NONE) ∧ *)
  (pt_result ids (Ax a) = SOME ([],([],[get_axiom ids a]))) ∧
  (pt_result ids (FNC pt s ra) =
    case pt_result ids pt of
      SOME res => fnc ids res s ra
      | NONE => NONE) ∧
  (pt_result ids (Pro pt1 pt2) =
    case pt_result ids pt2 of
      SOME res2 =>
      if LENGTH (FST res2) ≠ 1 then NONE else
      (case pt_result ids pt1 of
        SOME res1 => pro res1 res2
      | NONE => NONE)
    | NONE => NONE) ∧
  (pt_result ids (Start f) = SOME (start_proof f)) ∧
  (pt_result ids (Sub pt1 pt2 i) =
    case pt_result ids pt1 of
      SOME res1 =>
      if (i ≥ LENGTH (FST res1)) then NONE else
      (case pt_result ids pt2 of
        SOME res2 => merge_rules res1 res2 i
      | NONE => NONE)
    | NONE => NONE)`

val _ = export_theory();
