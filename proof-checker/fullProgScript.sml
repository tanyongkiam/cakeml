open preamble ml_progLib ml_translatorLib
open proofCheckerProgTheory
open ml_translatorTheory ml_translatorLib
open proofCheckerTheory astPP2

val _ = new_theory "fullProg";

val _ = translation_extends "proofCheckerProg";

(*
local
  val ths = ml_translatorLib.eq_lemmas();
in
  fun find_equality_type_thm tm =
    first (can (C match_term tm) o rand o snd o strip_imp o concl) ths
end

val EqualityType_PROOFCHECKER_VARS_TYPE = find_equality_type_thm``PROOFCHECKER_VARS_TYPE``;
val EqualityType_WORD = find_equality_type_thm``WORD``;

val EqualityType_PROOFCHECKER_TRM_TYPE

val PROOFCHECKER_TRM_TYPE_no_closures = Q.prove(
  `∀a b c.
  EqualityType a ⇒
  PROOFCHECKER_TRM_TYPE a b c ⇒ no_closures c`,
  ho_match_mp_tac PROOFCHECKER_TRM_TYPE_ind \\
  rw[PROOFCHECKER_TRM_TYPE_def] \\
  rw[no_closures_def] \\
    TRY (
    qmatch_assum_rename_tac`LIST_TYPE _ x y` \\
    qhdtm_x_assum`LIST_TYPE`mp_tac \\
    last_x_assum mp_tac \\
    map_every qid_spec_tac[`y`,`x`] \\
    Induct \\ rw[LIST_TYPE_def] \\
    rw[no_closures_def] \\
    metis_tac[] ) \\
  fs[EqualityType_def] \\ TRY (metis_tac[])>>
  metis_tac[EqualityType_def,EqualityType_PROOFCHECKER_VARS_TYPE,EqualityType_WORD]);

val ctor_same_type_def = semanticPrimitivesTheory.ctor_same_type_def;

*)

val fu_inst_def = Define`
  fu_inst = fin_univ varls varls`

val fu_inst_def = Define`
  fu_inst = fin_univ varls varls`

val ids_loc_inst_def = Define`
  ids_loc_inst =
  ids_loc
  i1 i2 i3 (\x. x = i1)
  i1 i2 i3
  i1 i2 i3 i4`

val pt_result_full_def = Define`
  pt_result_full pt = pt_result fu_inst ids_loc_inst pt`

val res = translate fu_inst_def;
val res = translate ids_loc_inst_def;
val res = translate pt_result_full_def;

val ML_code_prog =
  get_ml_prog_state ()
  |> clean_state |> remove_snocs
  |> get_thm

val prog = ML_code_prog |> concl |> strip_comb |> #2 |> el 3

val _ = enable_astPP()

val _ = trace("pp_avoids_symbol_merges",0)

val t = TextIO.openOut("pt_result.sml")
val _ = TextIO.output(t,term_to_string prog)
val _ = TextIO.closeOut(t)


val _ = export_theory();
