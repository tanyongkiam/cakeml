open preamble ml_progLib ml_translatorLib
open proofCheckerTheory proofCheckerProg1Theory
open ml_translatorTheory

val _ = new_theory "proofCheckerProg2";

val _ = translation_extends "proofCheckerProg1";

val RW = REWRITE_RULE
val RW1 = ONCE_REWRITE_RULE
fun list_dest f tm =
  let val (x,y) = f tm in list_dest f x @ list_dest f y end
  handle HOL_ERR _ => [tm];
val dest_fun_type = dom_rng
val mk_fun_type = curry op -->;
fun list_mk_fun_type [ty] = ty
  | list_mk_fun_type (ty1::tys) =
      mk_fun_type ty1 (list_mk_fun_type tys)
  | list_mk_fun_type _ = fail()

val _ = add_preferred_thy "-";
val _ = add_preferred_thy "proofChecker";

val NOT_NIL_AND_LEMMA = Q.prove(
  `(b <> [] /\ x) = if b = [] then F else x`,
  Cases_on `b` THEN FULL_SIMP_TAC std_ss []);

val extra_preprocessing = ref [MEMBER_INTRO,MAP];

fun def_of_const tm = let
  val res = dest_thy_const tm handle HOL_ERR _ =>
              failwith ("Unable to translate: " ^ term_to_string tm)
  val name = (#Name res)
  fun def_from_thy thy name =
    DB.fetch thy (name ^ "_pmatch") handle HOL_ERR _ =>
    DB.fetch thy (name ^ "_def") handle HOL_ERR _ =>
    DB.fetch thy (name ^ "_DEF") handle HOL_ERR _ =>
    DB.fetch thy name
  val def = def_from_thy "termination" name handle HOL_ERR _ =>
            def_from_thy (#Thy res) name handle HOL_ERR _ =>
            failwith ("Unable to find definition of " ^ name)
  val def = def |> RW (!extra_preprocessing)
                |> CONV_RULE (DEPTH_CONV BETA_CONV)
                (* TODO: This ss messes up defs containing if-then-else
                with constant branches
                |> SIMP_RULE bool_ss [IN_INSERT,NOT_IN_EMPTY]*)
                |> REWRITE_RULE [NOT_NIL_AND_LEMMA]
  in def end

val _ = (find_def_for_const := def_of_const);

val _ = use_long_names:=true;

val Diamond_func_def = Define`
  Diamond_func x y = Diamond x y `

val _ = translate Diamond_func_def;

val _ = translate (box_axiom_def |> RW [GSYM Diamond_func_def])

val Prop_func_def = Define`
  Prop_func x y = Prop x y `

val _ = translate Prop_func_def;

val Function_func_def = Define`
  Function_func x y = Function x y `

val _ = translate Function_func_def;

val _ = translate (singleton_def |> INST_TYPE[beta|->alpha,gamma|->beta]);

val res = translate empty_def;

val res = translate (assign_axiom_def |> RW [GSYM Prop_func_def,GSYM Function_func_def] |> INST_TYPE [gamma |-> beta]);

val _ = translate (diff_assign_axiom_def |> RW[GSYM Prop_func_def]);

val _ = translate (DEaxiom_def)

val _ = translate (DSaxiom_def |> RW [GSYM Prop_func_def,GSYM Function_func_def])

val res = translate get_axiom_def;


(* subst*)

val res = translate (ssafe_def |> RW (!extra_preprocessing));

val res = translate Rsafe_def;

val res = translate (FVS_def |> SIMP_RULE std_ss [o_DEF]);

val res = translate proofCheckerTheory.PsubstFO_def;

val res = translate proofCheckerTheory.PPsubst_def

val res = translate proofCheckerTheory.Tsubst_def

val res = translate proofCheckerTheory.Psubst_def

val res = translate Rsubst_def



val TadmitFFO_alt = prove(
  ``TadmitFFO sigma x =
    case x of
    | Var _ => T
    | a => TadmitFFO sigma a``,
  Cases_on `x` \\ fs [] \\ fs [TadmitFFO_def])
  |> CONV_RULE (RAND_CONV (ONCE_REWRITE_CONV [TadmitFFO_def]));

val res = translate_no_ind TadmitFFO_alt;

val ind_lemma = Q.prove(
  `^(first is_forall (hyp res))`,
  rpt gen_tac
  \\ rpt (disch_then strip_assume_tac)
  \\ match_mp_tac (latest_ind ())
  \\ rpt strip_tac
  \\ last_x_assum match_mp_tac
  \\ rpt strip_tac
  \\ fs [FORALL_PROD] \\ cheat) (* argh! bad ind goal.. *)
  |> update_precondition;

val TadmitFO_alt = prove(
  ``TadmitFO sigma x =
    case x of
    | Var _ => T
    | a => TadmitFO sigma a``,
  Cases_on `x` \\ fs [] \\ fs [TadmitFO_def])
  |> CONV_RULE (RAND_CONV (ONCE_REWRITE_CONV [TadmitFO_def]));

val res = translate_no_ind TadmitFO_alt;

val ind_lemma = Q.prove(
  `^(first is_forall (hyp res))`,
  rpt gen_tac
  \\ rpt (disch_then strip_assume_tac)
  \\ match_mp_tac (latest_ind ())
  \\ rpt strip_tac
  \\ last_x_assum match_mp_tac
  \\ rpt strip_tac
  \\ fs [FORALL_PROD] \\ cheat) (* argh! bad ind goal.. *)
  |> update_precondition;

val res = translate Tadmit_def;
val res = translate proofCheckerTheory.NPadmit_def
val res = translate proofCheckerTheory.PPadmit_def

(* broken *)

val def = Padmit_def;
val res = translate def

val res = translate Radmit_def;



(* untested from here onwards *)


val _ = register_type ``:('a,'b) hp``
val _ = register_type ``:('a,'b) hp option``
val Psubst2_def = Define`
  (Psubst2 (m:('a,'b) hp) (sigma:('a,'b)subst) =
  case m of
  (Pvar a) => (
    let subst = sigma.SPrograms a in case subst of SOME a' => a' | NONE => Pvar a)
  | (Assign x theta) => Assign x (Tsubst theta sigma))`

  | (AssignAny x) => AssignAny x
  | (DiffAssign x theta) => DiffAssign x (Tsubst theta sigma)
  | (Test phi) => Test (Fsubst2 phi sigma)
  | (EvolveODE ODE phi) => EvolveODE (Osubst ODE sigma) (Fsubst2 phi sigma)
  | (Choice alpha beta) => Choice (Psubst2 alpha sigma) (Psubst2 beta sigma)
  | (Sequence alpha beta) => Sequence (Psubst2 alpha sigma) (Psubst2 beta sigma)
  | (Loop alpha) => Loop (Psubst2 alpha sigma)) ∧
  (Fsubst2 f sigma =
  case f of (Geq theta1 theta2) => Geq (Tsubst theta1 sigma) (Tsubst theta2 sigma)
  | (Prop p args) => (case sigma.SPredicates p of SOME p' => FsubstFO p' (MAP (λi. Tsubst i sigma) args) | NONE => Prop p (MAP (λi. Tsubst i sigma) args))
  | (Not phi) => Not (Fsubst2 phi sigma)
  | (And phi psi) => And (Fsubst2 phi sigma) (Fsubst2 psi sigma)
  | (Exists x phi) => Exists x (Fsubst2 phi sigma)
  | (Diamond alpha phi) => Diamond (Psubst2 alpha sigma) (Fsubst2 phi sigma)
  | (InContext C phi) => (case sigma.SContexts C of SOME C' => PFsubst C' (Fsubst2 phi sigma) | NONE =>  InContext C (Fsubst2 phi sigma)))`

val res = translate PPsubst_def;
val res = translate PsubstFO_def;

val res = translate Psubst2_def

(* broken
val res = translate Padmit_def;
val res = translate Radmit_def;
*)
val _ = translate foo_def;

val foo_def = Define`
  (foo fu sigma (Pvar a) ⇔ T) ∧
  (foo fu sigma (Sequence a b) ⇔
    foo fu sigma a ∧ foo fu sigma b ∧ PUadmit fu sigma b (BVP (Psubst a sigma)) ∧
    hpsafe (Psubst a sigma))`

    ∧
  (foo fu sigma (Loop a) ⇔
  foo fu sigma a ∧ PUadmit fu sigma a (BVP (Psubst a sigma)) ∧ hpsafe (Psubst a sigma)) ∧
  (foo fu sigma (EvolveODE ODE phi) ⇔
    Oadmit sigma ODE (BVO ODE) ∧ goo fu sigma phi ∧ FUadmit fu sigma phi (BVO ODE)) ∧
  (foo fu sigma (Choice a b) ⇔ foo fu sigma a ∧ foo fu sigma b) ∧
  (foo fu sigma (Assign x theta) ⇔ Tadmit sigma theta) ∧
  (foo fu sigma (AssignAny x) ⇔ T) ∧
  (foo fu sigma (DiffAssign x theta) ⇔ Tadmit sigma theta) ∧
  (foo fu sigma (Test phi) ⇔ goo fu sigma phi) ∧
  (goo fu sigma (Geq theta1 theta2) ⇔ Tadmit sigma theta1 ∧ Tadmit sigma theta2) ∧
  (goo fu sigma (Prop p args) ⇔
    EVERY (Tadmit sigma) args ∧
    case sigma.SPredicates p of
      SOME p' => Ngoo (MAP (λ i. Tsubst i sigma) args) p' ∧
                 (EVERY (λi. dsafe (Tsubst i sigma)) args)
    | NONE => T) ∧
  (goo fu sigma (Not phi) ⇔ goo fu sigma phi) ∧
  (goo fu sigma (And phi psi) ⇔ goo fu sigma phi ∧ goo fu sigma psi) ∧
  (goo fu sigma (Exists x phi) ⇔ goo fu sigma phi ∧ FUadmit fu sigma phi [INL x]) ∧
  (goo fu sigma (Diamond a phi) ⇔ goo fu sigma phi ∧ foo fu sigma a ∧ FUadmit fu sigma phi (BVP (Psubst a sigma)) ∧ hpsafe (Psubst a sigma)) ∧
  (goo fu sigma (InContext C phi) ⇔
    goo fu sigma phi ∧ FUadmit fu sigma phi UNIVls ∧
    case sigma.SContexts C of
      SOME C' => Pgoo (Fsubst phi sigma) C' ∧ fsafe(Fsubst phi sigma)
    | NONE => T)`






(*
FOLR OK
rule_result OK
get_axrule OK
USUBST ??
get_axiom ??
fnc OK
pro OK
start_proof,sub OK
val res = translate pt_result_def;
*)

val _ = export_theory();
