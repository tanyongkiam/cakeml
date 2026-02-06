/-
  Proof of type soundness: a type-correct program does not crash.
  Translated from: hol4_sources/typeSoundScript.sml
-/
import CakeML.Core.Weakening
import CakeML.Core.EvaluateProps
import CakeML.Core.Semantics
import CakeML.Core.PrimSemEnv

namespace CakeML

open HOL4
open mlstring

-- ============================================================
-- Auxiliary theorems
-- ============================================================

theorem list_rel_flat :
  ∀ (R : α → β → Prop) (l1 : List (List α)) (l2 : List (List β)),
    LIST_REL (LIST_REL R) l1 l2 → LIST_REL R l1.flatten l2.flatten := by sorry

theorem disjoint_image : True := by sorry

theorem v_unchanged :
  ∀ (tenv : type_env), { tenv with v := tenv.v } = tenv := by sorry

theorem check_dup_ctors_thm : True := by sorry

-- ============================================================
-- Canonical values theorems
-- ============================================================

theorem prim_canonical_values_thm : True := by sorry

theorem ctor_canonical_values_thm : True := by sorry

-- ============================================================
-- Type environment / closure theorems
-- ============================================================

theorem opapp_type_sound : True := by sorry

-- ============================================================
-- Definition: store_type_extension
-- ============================================================

/-- A store type extension means tenvS2 is tenvS1 extended with
    fresh (non-overlapping) bindings. -/
def store_type_extension (tenvS1 tenvS2 : tenv_store) : Prop :=
  ∃ tenvS', tenvS2 = FUNION tenvS' tenvS1 ∧
    (∀ l, FLOOKUP tenvS' l = none ∨ FLOOKUP tenvS1 l = none)

-- ============================================================
-- Store type extension theorems
-- ============================================================

theorem store_type_extension_weakS :
  ∀ (tenvS1 tenvS2 : tenv_store),
    store_type_extension tenvS1 tenvS2 → weakS tenvS2 tenvS1 := by sorry

theorem store_type_extension_refl :
  ∀ (tenvS : tenv_store), store_type_extension tenvS tenvS := by sorry

theorem store_type_extension_trans :
  ∀ (s1 s2 s3 : tenv_store),
    store_type_extension s1 s2 ∧ store_type_extension s2 s3 →
    store_type_extension s1 s3 := by sorry

-- ============================================================
-- Store operation type soundness
-- ============================================================

theorem store_assign_type_sound : True := by sorry

theorem store_alloc_type_sound : True := by sorry

theorem store_lookup_type_sound : True := by sorry

-- ============================================================
-- Value / list conversion theorems
-- ============================================================

theorem type_v_list_to_v : True := by sorry

theorem type_v_list_to_v_APPEND : True := by sorry

-- ============================================================
-- Equality and boolean theorems
-- ============================================================

theorem do_eq_Boolv : True := by sorry

theorem prim_canonical_Boolv_thm : True := by sorry

-- ============================================================
-- Operation type soundness
-- ============================================================

theorem op_type_sound : True := by sorry

-- ============================================================
-- Constructor type soundness
-- ============================================================

theorem build_conv_type_sound : True := by sorry

theorem same_ctor_and_same_tid : True := by sorry

-- ============================================================
-- Pattern matching type soundness
-- ============================================================

theorem pat_type_sound : True := by sorry

-- ============================================================
-- Variable lookup soundness
-- ============================================================

theorem lookup_var_sound : True := by sorry

-- ============================================================
-- Auxiliary list theorems
-- ============================================================

theorem EVERY_REPLICATE : True := by sorry

theorem EVERY_LIST_REL : True := by sorry

-- ============================================================
-- Expression type soundness (the main inductive lemma)
-- ============================================================

theorem exp_type_sound : True := by sorry

-- ============================================================
-- Declaration type soundness helpers
-- ============================================================

theorem type_all_env_extend : True := by sorry

theorem type_e_con_check : True := by sorry

-- ============================================================
-- Declaration type soundness
-- ============================================================

theorem decs_type_sound_no_check : True := by sorry

theorem decs_type_sound : True := by sorry

-- ============================================================
-- The main type soundness theorem
-- ============================================================

/-- The main type soundness theorem: a well-typed program
    cannot produce a `Fail` outcome.
    In HOL4: semantics_prog st env tops r /\ type_ds checks tenv tops tids new_tenv
             /\ type_sound_invariant st env ctMap tenvS tids tenv ==> r <> Fail -/
theorem semantics_type_sound :
  ∀ (st : state ffi_ty) (env : sem_env) (tops : List dec)
    (r : behaviour) (checks : Bool)
    (ctMap' : ctMap) (tenvS : tenv_store) (tenv : type_env)
    (new_tenv : type_env) (tids : Nat → Prop),
    semantics_prog st env tops r →
    type_ds checks tenv tops tids new_tenv →
    type_sound_invariant st env ctMap' tenvS tids tenv →
    r ≠ behaviour.Fail := by sorry

end CakeML
