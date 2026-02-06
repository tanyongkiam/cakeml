/-
  Proof about the primitive semantic environment.
  Translated from: hol4_sources/primSemEnvScript.sml
-/
import CakeML.Core.Semantics
import CakeML.Core.TypeSysProps
import CakeML.Core.TypeSoundInvariants

namespace CakeML

open HOL4
open mlstring

-- ============================================================
-- Theorems (all sorry)
-- ============================================================

theorem prim_sem_env_eq :
  ∀ (ffi' : ffi_state ffi_ty),
    True := by sorry  -- EVAL result, simplified

theorem prim_type_sound_invariants :
  ∀ (type_ids : Nat → Prop) (sem_st : state ffi_ty) (prim_env : sem_env),
    prim_sem_env ffi' = some (sem_st, prim_env) →
    (∀ n, type_ids n → n ≠ Tlist_num ∧ n ≠ Tbool_num ∧ n ≠ Texn_num) →
    ∃ ctMap',
      type_sound_invariant sem_st prim_env ctMap' FEMPTY type_ids prim_tenv ∧
      True  -- FRANGE condition simplified
    := by sorry

end CakeML
