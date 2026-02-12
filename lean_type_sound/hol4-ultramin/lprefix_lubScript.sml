Theory lprefix_lub
Ancestors
  list rich_list llist pred_set option
Libs
  BasicProvers

val _ = set_trace "Goalstack.print_goal_at_top" 0;
val _ = ParseExtras.temp_tight_equality();

Definition less_opt_def:
  (less_opt n NONE ⇔ T) ∧
  (less_opt n (SOME m) ⇔ n < m)
End

Theorem lnth_some_length:
   !ll n x. LNTH n ll = SOME x ⇒ less_opt n (LLENGTH ll)
Proof
  Induct_on `n` >>
  srw_tac[][] >>
  `ll = [||] ∨ ?h t. ll = h:::t` by metis_tac [llist_CASES] >>
  full_simp_tac(srw_ss())[less_opt_def]
  >- (
    Cases_on `LLENGTH t` >>
    full_simp_tac(srw_ss())[less_opt_def])
  >- (
    first_x_assum (qspec_then `t` mp_tac) >>
    simp [] >>
    Cases_on `LLENGTH t` >>
    full_simp_tac(srw_ss())[less_opt_def])
QED

Definition llist_shorter_def:
  llist_shorter ll1 ll2 ⇔
    case (LLENGTH ll1, LLENGTH ll2) of
    | (NONE, NONE) => T
    | (SOME x, NONE) => T
    | (NONE, SOME x) => F
    | (SOME x, SOME y) => x ≤ y
End

val llist_shorter_lnth = Q.prove (
`!ll1 ll2.
  llist_shorter ll1 ll2
  ⇔
  !n x. LNTH n ll1 = SOME x ⇒ ?y. LNTH n ll2 = SOME y`,
 srw_tac[][llist_shorter_def] >>
 every_case_tac >>
 full_simp_tac(srw_ss())[]
 >- metis_tac [NOT_SOME_NONE, LFINITE_LLENGTH, LFINITE_LNTH_NONE, option_nchotomy]
 >- metis_tac [NOT_SOME_NONE, LFINITE_LLENGTH, LFINITE_LNTH_NONE, option_nchotomy]
 >- metis_tac [NOT_SOME_NONE, LFINITE_LLENGTH, LFINITE_LNTH_NONE, option_nchotomy]
 >- (
   eq_tac >>
   srw_tac[][]
   >- (
     imp_res_tac lnth_some_length >>
     rev_full_simp_tac(srw_ss())[less_opt_def] >>
     `n < x'` by decide_tac >>
     metis_tac [LTAKE_LNTH_EL, LTAKE_LLENGTH_SOME])
   >- (
     imp_res_tac LTAKE_LLENGTH_SOME >>
     Cases_on `x = 0` >>
     full_simp_tac(srw_ss())[] >>
     first_x_assum (qspecl_then [`x-1`, `EL (x-1) l'`] mp_tac) >>
     srw_tac[][] >>
     `x-1 < x` by decide_tac >>
     imp_res_tac LTAKE_LNTH_EL >>
     full_simp_tac(srw_ss())[lnth_fromList_some] >>
     imp_res_tac lnth_some_length >>
     rev_full_simp_tac(srw_ss())[less_opt_def] >>
     simp [])));

Definition lprefix_chain_def:
  lprefix_chain ls ⇔
    !ll1 ll2. ll1 ∈ ls ∧ ll2 ∈ ls ⇒ LPREFIX ll1 ll2 ∨ LPREFIX ll2 ll1
End

Theorem lprefix_chain_LNTHs_agree:
   lprefix_chain ls ∧
   l1 ∈ ls ∧ l2 ∈ ls ∧
   LNTH n l1 = SOME x1 ∧
   LNTH n l2 = SOME x2 ⇒
   x1 = x2
Proof
  srw_tac[][] >>
  full_simp_tac(srw_ss())[lprefix_chain_def] >>
  first_x_assum(qspecl_then[`l1`,`l2`]mp_tac) >>
  srw_tac[][] >> full_simp_tac(srw_ss())[LPREFIX_APPEND] >> srw_tac[][] >>
  full_simp_tac(srw_ss())[LNTH_LAPPEND] >>
  every_case_tac >>
  full_simp_tac(srw_ss())[arithmeticTheory.NOT_LESS,arithmeticTheory.LESS_EQ_EXISTS] >>
  srw_tac[][] >> fsrw_tac[ARITH_ss][] >>
  metis_tac[LNTH_LLENGTH_NONE,arithmeticTheory.ADD_SYM,arithmeticTheory.LESS_EQ_ADD,optionTheory.NOT_NONE_SOME]
QED

Definition lprefix_chain_nth_def:
  lprefix_chain_nth n ls =
    some x. ?l. l ∈ ls ∧ LNTH n l = SOME x
End

Theorem exists_lprefix_chain_nth:
   !ls n x.
    lprefix_chain ls ∧
    (?l. l ∈ ls ∧ LNTH n l = SOME x) ⇒
    lprefix_chain_nth n ls = SOME x
Proof
  srw_tac[][some_def, lprefix_chain_nth_def] >>
  metis_tac [lprefix_chain_LNTHs_agree, SELECT_THM]
QED

Theorem not_exists_lprefix_chain_nth:
   !ls n.
    lprefix_chain ls ∧
    (!l. l ∈ ls ⇒ LNTH n l = NONE) ⇒
    lprefix_chain_nth n ls = NONE
Proof
  srw_tac[][some_def, lprefix_chain_nth_def] >>
  metis_tac [NOT_SOME_NONE]
QED

Theorem lprefix_chain_nth_none_mono:
   !m n ls.
    lprefix_chain ls ∧
    m ≤ n ∧
    lprefix_chain_nth m ls = NONE
    ⇒
    lprefix_chain_nth n ls = NONE
Proof
 srw_tac[][] >>
 match_mp_tac not_exists_lprefix_chain_nth >>
 srw_tac[][] >>
 CCONTR_TAC >>
 full_simp_tac(srw_ss())[] >>
 `LNTH m l ≠ NONE` by metis_tac [LNTH_NONE_MONO] >>
 metis_tac [exists_lprefix_chain_nth, NOT_SOME_NONE, option_nchotomy]
QED

Definition equiv_lprefix_chain_def:
  equiv_lprefix_chain ls1 ls2 ⇔
    !n. lprefix_chain_nth n ls1 = lprefix_chain_nth n ls2
End

Definition lprefix_lub_def:
  lprefix_lub ls lub ⇔
    (!ll. ll ∈ ls ⇒ LPREFIX ll lub) ∧
    (∀ub. (!ll. ll ∈ ls ⇒ LPREFIX ll ub) ⇒ LPREFIX lub ub)
End

Definition build_lprefix_lub_f_def:
  build_lprefix_lub_f ls n =
    OPTION_MAP (λx. (n+1, x)) (lprefix_chain_nth n ls)
End

Definition build_lprefix_lub_def:
  build_lprefix_lub ls =
    LUNFOLD (build_lprefix_lub_f ls) 0
End

val build_lprefix_lub_lem = Q.prove (
  `!ls. lprefix_chain ls ⇒ !m n. LNTH n (LUNFOLD (build_lprefix_lub_f ls) m) = lprefix_chain_nth (m + n) ls`,
  rpt gen_tac >>
  DISCH_TAC >>
  Induct_on `n` >>
  srw_tac[][Once LUNFOLD, build_lprefix_lub_f_def] >>
  Cases_on `lprefix_chain_nth m ls` >>
  full_simp_tac(srw_ss())[]
  >- metis_tac [lprefix_chain_nth_none_mono, DECIDE ``m ≤ m + SUC n``]
  >- simp [arithmeticTheory.ADD1]);

Definition prefix_chain_def:
  prefix_chain ls ⇔
    ∀l1 l2. l1 ∈ ls ∧ l2 ∈ ls ⇒ l1 ≼ l2 ∨ l2 ≼ l1
End

Definition lprefix_rel_def:
  lprefix_rel s1 s2 ⇔ ∀l1. l1 IN s1 ⇒ ∃l2. l2 IN s2 ∧ LPREFIX l1 l2
End

Overload LUB = “build_lprefix_lub”;

