open preamble ml_progLib ml_translatorLib
open proofCheckerTheory
open ml_translatorTheory

val _ = new_theory "proofCheckerProg";

val _ = translation_extends "basisProg";

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

val _ = register_type ``:('a,'b) pt``;
val _ = register_type ``:('a,'b) ids_loc``;
val _ = register_type ``:('a,'b) fin_univ``;

(* mutrec defs are sometimes hidden *)
val res = translate PRadmit_def;
val res = translate hpsafe_def;
val res = translate BVP_def;
val res = translate FVP_def;

val res = translate (SDom_def |> SIMP_RULE std_ss [o_DEF])
val res = translate PUadmit_def;
val res = translate Tsubst_def;

val res = translate PUrename_def;
val res = translate FBrename_def;
val res = translate LeftRule_result_def;

val leftrule_result_side = Q.prove(`
  y < LENGTH (FST z) ⇒
  (proofchecker_leftrule_result_side x y z ⇔ T)`,
  EVAL_TAC>>fs[]>>rw[]>>fs[])|> update_precondition

val res = translate (RightRule_result_def |>RW (!extra_preprocessing) );

val rightrule_result_side = Q.prove(`
  y < LENGTH (SND z) ⇒
  proofchecker_rightrule_result_side x y z ⇔ T`,
  EVAL_TAC>>rw[]>>fs[])|> update_precondition

val res = translate rule_result_def;

val rule_result_side = Q.prove(`
  proofchecker_rule_result_side x y z ⇔ T`,
  EVAL_TAC>>fs[]>>rw[]>>fs[])|> update_precondition

val res = translate get_axrule_def;

val res = translate fnc_def;
val res = translate pro_def;

val res = translate get_axiom_def;

(* subst*)

val res = translate Rsafe_def;

val res = translate (FVS_def |> SIMP_RULE std_ss [o_DEF]);

val res = translate proofCheckerTheory.PsubstFO_def;

val res = translate proofCheckerTheory.PPsubst_def

val res = translate proofCheckerTheory.Psubst_def

val res = translate Rsubst_def

val res = translate TadmitFFO_def;

val res = translate TadmitFO_def;

val res = translate Tadmit_def;
val res = translate proofCheckerTheory.NPadmit_def
val res = translate proofCheckerTheory.PPadmit_def

val res = translate TadmitF_def;
val res = translate (Oadmit_def |> RW (!extra_preprocessing));
val res = translate Padmit_def;

val res = translate Radmit_def;

val res = translate pt_result_def;

val () = Feedback.set_trace "TheoryPP.include_docs" 0;
val _ = (ml_translatorLib.clean_on_exit := true);

val _ = export_theory();
