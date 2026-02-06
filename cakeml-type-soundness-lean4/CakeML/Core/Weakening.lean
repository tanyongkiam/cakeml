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
    Uses fmap (association list) representation from FiniteMap.
    HOL4 uses `tenvS' SUBMAP tenvS`; Lean uses pointwise implication. -/
def weakS [BEq α] (tenvS tenvS' : fmap α β) : Prop :=
  ∀ k v', FLOOKUP tenvS' k = some v' → FLOOKUP tenvS k = some v'

/-- Overall type environment weakening: abbreviations equal,
    value/constructor sub-typing. -/
def weak (tenv' tenv : type_env) : Prop :=
  tenv'.t = tenv.t ∧ weak_tenv tenv' tenv

/-- Constructor type map weakening: cenv_spec is a sub-map of cenv_impl.
    HOL4 uses `cenv_spec SUBMAP cenv_impl`; Lean uses pointwise implication. -/
def weakCT [BEq α] (cenv_impl cenv_spec : fmap α β) : Prop :=
  ∀ k v', FLOOKUP cenv_spec k = some v' → FLOOKUP cenv_impl k = some v'

-- ============================================================
-- Theorems
-- ============================================================

theorem weak_tenvE_refl :
  ∀ tenvE, weak_tenvE tenvE tenvE := by sorry

/- Omitted: Theorem weak_tenvT_refl (commented out in HOL4).
   HOL4: ∀n x. weak_tenvT n x x
   Reason: Commented out in HOL4; relates to the old module-system type
   abbreviation weakening which was removed. -/

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

/- Omitted: Theorem weakE_lookup [local] (commented out in HOL4).
   HOL4: ALOOKUP env n = SOME (tvs, t) ⟹ ∃ subst. ALOOKUP env' n = SOME (tvs', t') ∧ ...
   Reason: Commented out in HOL4; uses old flat environment model (ALOOKUP on alists). -/

/- Omitted: Theorem weak_tenvM_lookup_lem [local] (commented out in HOL4).
   HOL4: EVERY (λx. check_freevars tvs [] (Tvar_db x)) (COUNT_LIST tvs)
   Reason: Commented out in HOL4; helper for the old module environment model. -/

/- Omitted: Theorem weak_tenvM_lookup [local] (commented out in HOL4).
   HOL4: weakM tenvM' tenvM ∧ FLOOKUP tenvM mn = SOME tenv ⟹ ∃ tenv'. ...
   Reason: Commented out in HOL4; uses old weakM/module environment model. -/

/-- Pattern typing is monotone in the type environment and number of type
    variables: weakening the environment or increasing tvs preserves typing. -/
theorem type_p_weakening :
  (∀ tvs tenv p t' bindings,
    type_p tvs tenv p t' bindings →
    ∀ tenv' tvs', tvs' >= tvs → weak tenv' tenv →
    type_p tvs' tenv' p t' bindings) ∧
  (∀ tvs tenv ps ts bindings,
    type_ps tvs tenv ps ts bindings →
    ∀ tenv' tvs', tvs' >= tvs → weak tenv' tenv →
    type_ps tvs' tenv' ps ts bindings) := by sorry

/-- Expression typing weakening (mutual): weakening both the outer type
    environment and the de Bruijn expression environment preserves typing
    for expressions, expression lists, and function definitions. -/
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

/- Substantially edited: HOL4 has precondition `DISJOINT (FDOM ctMap') (FDOM ctMap)`.
   Lean simplifies to `True` because DISJOINT on fmap domains requires HOL4
   set operations (FDOM, DISJOINT) not present in the Lean fmap model. -/
theorem disjoint_env_weakCT [BEq α] :
  ∀ (ctMap1 ctMap2 : fmap α β),
    True → -- simplified: DISJOINT (FDOM ctMap2) (FDOM ctMap1)
    weakCT (FUNION ctMap2 ctMap1) ctMap1 := by sorry

theorem weakCT2 [BEq α] :
  ∀ (ctMap1 ctMap2 : fmap α β),
    weakCT (FUNION ctMap2 ctMap1) ctMap2 := by sorry

/-- Constructor environment typing is monotone in the constructor type map:
    strengthening ctMap preserves the `type_ctor` relation.
    Substantially edited: HOL4 uses `nsAll2 (type_ctor ctMap)` (homogeneous),
    Lean uses `nsAll2_het` (heterogeneous) because envC and tenvC have
    different value types in the Lean model. -/
theorem type_tenv_ctor_weakening :
  ∀ (ctMap1 ctMap2 : ctMap)
    (envC : ns modN conN (Nat × stamp))
    (tenvC : ns modN conN (List tvarN × List sem_t × type_ident)),
    weakCT ctMap2 ctMap1 →
    nsAll2_het (type_ctor ctMap1) envC tenvC →
    nsAll2_het (type_ctor ctMap2) envC tenvC := by sorry

/- Local helper in HOL4. States that if nsAll2_het holds with a universally
   quantified weakening property, it can be specialized to concrete weakening. -/
theorem type_tenv_val_weakening_lemma :
  ∀ (ctMap1 : ctMap) (tenvS : tenv_store)
    (envV : ns modN varN v) (tenvV : ns modN varN (Nat × sem_t))
    (ctMap2 : ctMap) (tenvS' : tenv_store),
    weakCT ctMap2 ctMap1 →
    weakS tenvS' tenvS →
    nsAll2_het (fun (_ : id modN varN) (v' : v) (p : Nat × sem_t) =>
      ∀ tvs' (ctMap' : ctMap) (tenvS'' : tenv_store),
        (p.1 = 0 ∨ p.1 = tvs') → weakCT ctMap' ctMap1 → weakS tenvS'' tenvS →
        type_v tvs' ctMap' tenvS'' v' p.2) envV tenvV →
    nsAll2_het (fun (_ : id modN varN) (v' : v) (p : Nat × sem_t) =>
      type_v p.1 ctMap2 tenvS' v' p.2) envV tenvV := by sorry

/- HOL4 remove_lambda_prod: (λ(x,y). P x y) = (λxy. P (FST xy) (SND xy)).
   Unnecessary in Lean 4 (native pair pattern matching). Kept as placeholder. -/
theorem remove_lambda_prod : True := by sorry

/-- Value typing weakening: a well-typed value remains well-typed when
    the ctMap and store typing are strengthened, and tvs is either 0 or
    unchanged. This is proved by induction on the `type_v` derivation. -/
theorem type_v_weakening :
  ∀ tvs (ctMap1 : ctMap) (tenvS : tenv_store) (val : v) (t : sem_t),
    type_v tvs ctMap1 tenvS val t →
    ∀ tvs' (ctMap2 : ctMap) (tenvS' : tenv_store),
      (tvs = 0 ∨ tvs = tvs') →
      weakCT ctMap2 ctMap1 →
      weakS tenvS' tenvS →
      type_v tvs' ctMap2 tenvS' val t := by sorry

/-- Whole environment weakening: strengthening ctMap and store typing
    preserves the `type_all_env` relation (both value and constructor parts). -/
theorem type_all_env_weakening :
  ∀ (ctMap1 : ctMap) (tenvS : tenv_store) (env : sem_env) (tenv : type_env)
    (ctMap2 : ctMap) (tenvS' : tenv_store),
    weakCT ctMap2 ctMap1 →
    weakS tenvS' tenvS →
    type_all_env ctMap1 tenvS env tenv →
    type_all_env ctMap2 tenvS' env tenv := by sorry

/-- Store value weakening: a well-typed store value remains well-typed
    under strengthened ctMap and store typing.
    Substantially edited: HOL4 also quantifies over `tenvS` (store typing
    environment) for both sv and st parameters; Lean simplifies the
    statement by making tenvS/tenvS' explicit parameters. -/
theorem type_sv_weakening :
  ∀ (ctMap1 : ctMap) (tenvS : tenv_store) (sv : store_v v) (st : store_t)
    (ctMap2 : ctMap) (tenvS' : tenv_store),
    type_sv ctMap1 tenvS sv st →
    weakCT ctMap2 ctMap1 →
    weakS tenvS' tenvS →
    type_sv ctMap2 tenvS' sv st := by sorry

/-- Store weakening: a well-typed store remains well-typed under
    strengthened ctMap.
    Substantially edited: HOL4 also passes `tenvS` as part of `type_s ctMap
    tenvS st`; Lean drops the `weakS` hypothesis since store typing is
    internal to `type_s` (weakening follows from `weakS_refl`). -/
theorem type_s_weakening :
  ∀ (ctMap1 : ctMap) (envS : List (store_v v)) (tenvS : tenv_store) (ctMap2 : ctMap),
    type_s ctMap1 envS tenvS →
    weakCT ctMap2 ctMap1 →
    type_s ctMap2 envS tenvS := by sorry

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

/-- Declaration typing weakening (mutual): weakening the type environment
    preserves declaration and declaration-list typing when extra checks are
    disabled (`check = false`). -/
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

/- Omitted: The following definitions and theorems are all commented out in
   HOL4 (old module-system infrastructure, no longer used):

   - Definition weakCT_only_other_mods_def
     weakCT restricted to other modules.

   - Theorem weakCT_only_other_mods_merge [local]
     weakCT_only_other_mods is preserved under FUNION.

   - Theorem weak_decls_only_mods_union
     weak_decls_only_mods preserved under union_decls.

   - Theorem weak_decls_only_mods_union2
     Two-sided weak_decls_only_mods union.

   - Theorem weak_decls_refl
     weak_decls is reflexive.

   - Theorem weak_decls_trans
     weak_decls is transitive.

   - Definition weak_decls_other_mods_def
     Weakening restricted to other modules' type/exception declarations.

   - Theorem weak_decls_other_mods_refl
     weak_decls_other_mods is reflexive.

   - Theorem weak_tenv_extend_dec_tenv (duplicate, commented out)
     Duplicate of the non-commented version above.

   - Theorem weak_decls_union (two copies)
     weak_decls preserved under union_decls.

   - Theorem weak_decls_union2
     union_decls with empty defined_mods weakens.

   - Theorem weak_decls_union3
     weak_decls preserved under union_decls (other direction).

   - Theorem weak_decls_other_mods_union
     weak_decls_other_mods preserved under union_decls.

   - Theorem weak_decls_other_mods_only_mods_NIL
     weak_decls_other_mods for NIL module path.

   - Theorem weak_decls_other_mods_only_mods_SOME
     weak_decls_other_mods for SOME module path.

   - Theorem type_ds_weak_decls_only_mods
     type_ds implies weak_decls_only_mods.

   - Theorem type_ds_weakening
     Declaration-list weakening (old module system version).

   - Theorem consistent_decls_weakening
     consistent_decls is monotone in weak_decls.

   - Theorem consistent_ctMap_weakening
     consistent_ctMap is monotone in weak_decls.

   All of these relate to the old CakeML module system (weak_decls,
   union_decls, consistent_decls, defined_mods, etc.) which was removed
   in the current development. -/

end CakeML
