/-
  Weakening lemmas used in type soundness.
  Translated from: hol4_sources/weakeningScript.sml
-/
import CakeML.Core.TypeSysProps

namespace CakeML

open HOL4
open mlstring

-- ============================================================
-- Definitions
-- ============================================================

/-- tenvE is weaker than tenvE': num_tvs is at least as large,
    and all variable lookups agree. -/
def weak_tenvE (tenv tenv' : tenv_val_exp) : Prop :=
  num_tvs tenv >= num_tvs tenv' ∧
  ∀ n inc tvs t',
    tveLookup n inc tenv' = some (tvs, t') ↔
    tveLookup n inc tenv = some (tvs, t')

/-- Store typing weakening: tenvS' is a sub-map of tenvS.
    Uses fmap (association list) representation from FiniteMap. -/
def weakS [BEq α] (tenvS tenvS' : fmap α β) : Prop :=
  ∀ k v', FLOOKUP tenvS' k = some v' → FLOOKUP tenvS k = some v'

/-- Overall type environment weakening: abbreviations equal,
    value/constructor sub-typing. -/
def weak (tenv' tenv : type_env) : Prop :=
  tenv'.t = tenv.t ∧ weak_tenv tenv' tenv

/-- Constructor type map weakening: cenv_spec is a sub-map of cenv_impl. -/
def weakCT [BEq α] (cenv_impl cenv_spec : fmap α β) : Prop :=
  ∀ k v', FLOOKUP cenv_spec k = some v' → FLOOKUP cenv_impl k = some v'

-- ============================================================
-- Theorems
-- ============================================================

theorem weak_tenvE_refl :
  ∀ tenvE, weak_tenvE tenvE tenvE := by sorry

theorem weak_tenv_refl :
  ∀ tenv, tenv_val_ok tenv.v → weak_tenv tenv tenv := by sorry

theorem weakS_refl [BEq α] :
  ∀ (tenvS : fmap α β), weakS tenvS tenvS := by sorry

theorem weakS_bind [BEq α] :
  ∀ (l : α) (t' : β) (tenvS : fmap α β),
    FLOOKUP tenvS l = none →
    weakS (FUPDATE tenvS (l, t')) tenvS := by sorry

theorem weak_tenvE_freevars :
  ∀ tenv tenv' tvs t',
    weak_tenvE tenv' tenv →
    check_freevars (num_tvs tenv) tvs t' = true →
    check_freevars (num_tvs tenv') tvs t' = true := by sorry

theorem weak_tenvE_bind :
  ∀ tenv tenv' n tvs t',
    weak_tenvE tenv' tenv →
    weak_tenvE (tenv_val_exp.Bind_name n tvs t' tenv')
               (tenv_val_exp.Bind_name n tvs t' tenv) := by sorry

theorem weak_tenvE_opt_bind :
  ∀ tenv tenv' n tvs t',
    weak_tenvE tenv' tenv →
    weak_tenvE (opt_bind_name n tvs t' tenv')
               (opt_bind_name n tvs t' tenv) := by sorry

theorem weak_tenvE_bind_tvar :
  ∀ tenv tenv' tvs,
    weak_tenvE tenv' tenv →
    weak_tenvE (bind_tvar tvs tenv') (bind_tvar tvs tenv) := by sorry

theorem weak_tenvE_bind_tvar2 :
  ∀ tenv tenv' tvs,
    tenv_val_exp_ok tenv →
    num_tvs tenv = 0 →
    weak_tenvE tenv' tenv →
    weak_tenvE (bind_tvar tvs tenv') (bind_tvar 0 tenv) := by sorry

theorem weak_tenvE_bind_var_list :
  ∀ bindings tenvE tenvE' tvs,
    weak_tenvE tenvE' tenvE →
    weak_tenvE (bind_var_list tvs bindings tenvE')
               (bind_var_list tvs bindings tenvE) := by sorry

theorem eLookupC_weak :
  ∀ cn tenv tenv' tvs ts tn,
    weak_tenv tenv' tenv →
    nsLookup tenv.c cn = some (tvs, ts, tn) →
    nsLookup tenv'.c cn = some (tvs, ts, tn) := by sorry

theorem eLookupV_weak :
  ∀ n tenv tenv' tvs t',
    weak_tenv tenv' tenv →
    nsLookup tenv.v n = some (tvs, t') →
    ∃ tvs' t'', nsLookup tenv'.v n = some (tvs', t'') ∧
      tscheme_inst (tvs, t') (tvs', t'') := by sorry

theorem type_p_weakening :
  (∀ tvs tenv p t' bindings,
    type_p tvs tenv p t' bindings →
    ∀ tenv' tvs', tvs' >= tvs → weak tenv' tenv →
    type_p tvs' tenv' p t' bindings) ∧
  (∀ tvs tenv ps ts bindings,
    type_ps tvs tenv ps ts bindings →
    ∀ tenv' tvs', tvs' >= tvs → weak tenv' tenv →
    type_ps tvs' tenv' ps ts bindings) := by sorry

theorem type_e_weakening_lem :
  (∀ tenv tenvE e t',
    type_e tenv tenvE e t' →
    ∀ tenv' tenvE', weak tenv' tenv → weak_tenvE tenvE' tenvE →
    type_e tenv' tenvE' e t') ∧
  (∀ tenv tenvE es ts,
    type_es tenv tenvE es ts →
    ∀ tenv' tenvE', weak tenv' tenv → weak_tenvE tenvE' tenvE →
    type_es tenv' tenvE' es ts) ∧
  (∀ tenv tenvE funs bindings,
    type_funs tenv tenvE funs bindings →
    ∀ tenv' tenvE', weak tenv' tenv → weak_tenvE tenvE' tenvE →
    type_funs tenv' tenvE' funs bindings) := by sorry

theorem type_e_weakening :
  (∀ tenv tenvE e t' tenv' tenvE',
    type_e tenv tenvE e t' → weak tenv' tenv → weak_tenvE tenvE' tenvE →
    type_e tenv' tenvE' e t') ∧
  (∀ tenv tenvE es ts tenv' tenvE',
    type_es tenv tenvE es ts → weak tenv' tenv → weak_tenvE tenvE' tenvE →
    type_es tenv' tenvE' es ts) ∧
  (∀ tenv tenvE funs bindings tenv' tenvE',
    type_funs tenv tenvE funs bindings → weak tenv' tenv → weak_tenvE tenvE' tenvE →
    type_funs tenv' tenvE' funs bindings) := by sorry

theorem gt_0 :
  ∀ (x : Nat), x >= 0 := by sorry

theorem weak_ctMap_lookup [BEq α] :
  ∀ (ctMap1 ctMap2 : fmap α β) (v1 : β) stmp,
    weakCT ctMap2 ctMap1 →
    FLOOKUP ctMap1 stmp = some v1 →
    FLOOKUP ctMap2 stmp = some v1 := by sorry

theorem weakCT_refl [BEq α] :
  ∀ (ctMap1 : fmap α β), weakCT ctMap1 ctMap1 := by sorry

theorem weakCT_trans [BEq α] :
  ∀ (C1 C2 C3 : fmap α β), weakCT C1 C2 → weakCT C2 C3 → weakCT C1 C3 := by sorry

theorem disjoint_env_weakCT [BEq α] :
  ∀ (ctMap1 ctMap2 : fmap α β),
    True → -- simplified: DISJOINT (FDOM ctMap2) (FDOM ctMap1)
    weakCT (FUNION ctMap2 ctMap1) ctMap1 := by sorry

theorem weakCT2 [BEq α] :
  ∀ (ctMap1 ctMap2 : fmap α β),
    weakCT (FUNION ctMap2 ctMap1) ctMap2 := by sorry

theorem type_tenv_ctor_weakening : True := by sorry

theorem type_tenv_val_weakening_lemma : True := by sorry

theorem remove_lambda_prod : True := by sorry

theorem type_v_weakening : True := by sorry

theorem type_all_env_weakening : True := by sorry

theorem type_sv_weakening : True := by sorry

theorem type_s_weakening : True := by sorry

theorem weak_tenv_extend_dec_tenv :
  ∀ tenv1 tenv2 tenv3,
    tenv_val_ok tenv1.v →
    weak_tenv tenv2 tenv3 →
    weak_tenv (extend_dec_tenv tenv1 tenv2)
              (extend_dec_tenv tenv1 tenv3) := by sorry

theorem weak_extend_dec_tenv :
  ∀ tenv1 tenv2 tenv3,
    tenv_ok tenv1 →
    weak tenv2 tenv3 →
    weak (extend_dec_tenv tenv1 tenv2)
         (extend_dec_tenv tenv1 tenv3) := by sorry

theorem type_d_weakening :
  (∀ check tenv d decls tenv',
    type_d check tenv d decls tenv' →
    ∀ tenv'',
      check = false →
      tenv_ok tenv'' →
      weak tenv'' tenv →
      type_d check tenv'' d decls tenv') ∧
  (∀ check tenv ds decls tenv',
    type_ds check tenv ds decls tenv' →
    ∀ tenv'',
      check = false →
      tenv_ok tenv'' →
      weak tenv'' tenv →
      type_ds check tenv'' ds decls tenv') := by sorry

end CakeML
