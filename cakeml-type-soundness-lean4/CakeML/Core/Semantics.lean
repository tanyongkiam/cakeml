/-
  The top-level semantics of CakeML programs.
  Translated from: hol4_sources/semanticsScript.sml
-/
import CakeML.Core.LexerFun
import CakeML.Core.CmlPtreeConversion
import CakeML.Core.PrimTypes

namespace CakeML

open HOL4
open mlstring

-- ============================================================
-- Definitions
-- ============================================================

/-- Non-deterministic parse: given tokens, try to parse as TopLevelDecs -/
def parse (toks : List (token × locs)) : Option (List dec) :=
  sorry -- involves valid_lptree, ptree_TopLevelDecs

-- ============================================================
-- Datatypes
-- ============================================================

/-- Top-level state combining type system and semantics -/
structure sem_state (ffi : Type) where
  tenv : type_env
  type_ids : Nat → Prop  -- Set of type identifiers
  sem_st : state ffi
  sem_env_field : sem_env

inductive semantics_outcome where
  | CannotParse : semantics_outcome
  | IllTyped : semantics_outcome
  | Execute : (behaviour → Prop) → semantics_outcome  -- Set of behaviours

-- ============================================================
-- More definitions
-- ============================================================

def can_type_prog (st : sem_state ffi) (prog : List dec) : Prop :=
  ∃ new_tids new_tenv,
    (∀ n, st.type_ids n → ¬ new_tids n) ∧  -- Disjoint
    type_ds true st.tenv prog new_tids new_tenv

def evaluate_prog_with_clock (st : state ffi) (env : sem_env)
    (k : Nat) (prog : List dec)
    : ffi_state ffi × result sem_env v :=
  let (st', r) := evaluate_decs { st with clock := k } env prog
  (st'.ffi_field, r)

def semantics_prog (st : state ffi) (env : sem_env)
    (prog : List dec) : behaviour → Prop :=
  sorry -- complex definition involving Terminate, Diverge, Fail

open Classical in
noncomputable def semantics (st : sem_state ffi) (prelude : List dec) (input : List Char)
    : semantics_outcome :=
  match parse (lexer_fun input) with
  | none => semantics_outcome.CannotParse
  | some prog =>
    if can_type_prog st (prelude ++ prog)
    then semantics_outcome.Execute (semantics_prog st.sem_st st.sem_env_field (prelude ++ prog))
    else semantics_outcome.IllTyped

def semantics_init (ffi' : ffi_state ffi) : List dec → List Char → semantics_outcome :=
  sorry -- involves prim_sem_env, prim_tenv, prim_type_ids

end CakeML
