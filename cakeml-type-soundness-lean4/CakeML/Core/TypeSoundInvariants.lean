/-
  A type system for values, and the invariants for type soundness.
  Translated from: hol4_sources/typeSoundInvariantsScript.sml
-/
import CakeML.Core.TypeSystem
import CakeML.Core.NamespaceProps

namespace CakeML

open HOL4
open mlstring

-- ============================================================
-- Datatypes
-- ============================================================

inductive store_t where
  | Ref_t : sem_t → store_t
  | W8array_t : store_t
  | Varray_t : sem_t → store_t

instance : Inhabited store_t := ⟨store_t.W8array_t⟩

-- ============================================================
-- Type aliases
-- ============================================================

abbrev tenv_store := fmap Nat store_t
abbrev ctMap := fmap stamp (List tvarN × List sem_t × type_ident)

-- Heterogeneous version of nsAll2 (relates namespaces with different value types)
-- Needed because env.c has stamp values while tenv.c has type info
def nsAll2_het [BEq m] [BEq n] (_ : id m n → α → β → Prop) : ns m n α → ns m n β → Prop := sorry

-- ============================================================
-- Definitions
-- ============================================================

def tenv_abbrev_ok (tenvT : tenv_abbrev) : Prop :=
  nsAll (fun _ (tvs, t') => check_freevars 0 tvs t') tenvT

def tenv_ctor_ok (tenvC : tenv_ctor) : Prop :=
  nsAll (fun _ (tvs, ts, _) => ∀ t' ∈ ts, check_freevars 0 tvs t') tenvC

def tenv_val_ok (tenvV : tenv_val) : Prop :=
  nsAll (fun _ (tvs, t') => check_freevars tvs [] t') tenvV

def tenv_ok (tenv : type_env) : Prop :=
  tenv_val_ok tenv.v ∧
  tenv_ctor_ok tenv.c ∧
  tenv_abbrev_ok tenv.t

def tenv_val_exp_ok : tenv_val_exp → Prop
  | tenv_val_exp.Empty => True
  | tenv_val_exp.Bind_tvar _ tenv => tenv_val_exp_ok tenv
  | tenv_val_exp.Bind_name _ tvs t' tenv =>
    check_freevars (tvs + num_tvs tenv) [] t' ∧ tenv_val_exp_ok tenv

def ctMap_ok (ctMap' : ctMap) : Prop :=
  -- No free variables in the range
  (∀ stamp' tvs ts ti, FLOOKUP ctMap' stamp' = some (tvs, ts, ti) →
    ∀ t' ∈ ts, check_freevars 0 tvs t') ∧
  -- Exceptions have type exception, and no type variables
  (∀ ex tvs ts ti, FLOOKUP ctMap' (stamp.ExnStamp ex) = some (tvs, ts, ti) →
    tvs = [] ∧ ti = Texn_num) ∧
  -- Primitive, non-constructor types are not mapped
  (∀ cn x tvs ts ti, FLOOKUP ctMap' (stamp.TypeStamp cn x) = some (tvs, ts, ti) →
    ti ∉ prim_type_nums) ∧
  -- If type identities are equal then the stamps are from the same type
  (∀ stamp1 tvs1 ts1 ti stamp2 tvs2 ts2,
    FLOOKUP ctMap' stamp1 = some (tvs1, ts1, ti) →
    FLOOKUP ctMap' stamp2 = some (tvs2, ts2, ti) →
    same_type stamp1 stamp2)

def type_ctor (ctMap' : ctMap) (_ : id modN conN)
    (nc : Nat × stamp) (tvs_ts_ti : List tvarN × List sem_t × type_ident) : Prop :=
  let (_, stmp) := nc
  let (tvs, ts, ti) := tvs_ts_ti
  FLOOKUP ctMap' stmp = some (tvs, ts, ti) ∧ ts.length = nc.1

def add_tenvE : tenv_val_exp → tenv_val → tenv_val
  | tenv_val_exp.Empty, tenvV => tenvV
  | tenv_val_exp.Bind_tvar _ tenvE, tenvV => add_tenvE tenvE tenvV
  | tenv_val_exp.Bind_name x tvs t' tenvE, tenvV =>
    nsBind x (tvs, t') (add_tenvE tenvE tenvV)

-- ============================================================
-- type_v: typing relation on values
-- Axiomatized because the HOL4 inductive definition has
-- occurrences (EVERY2, list membership, heterogeneous nsAll2)
-- that violate Lean 4's strict positivity checker.
-- ============================================================

axiom type_v : Nat → ctMap → tenv_store → v → sem_t → Prop

-- ============================================================
-- More definitions
-- ============================================================

def type_sv (ctMap' : ctMap) (tenvS : tenv_store) : store_v v → store_t → Prop
  | store_v.Refv v', store_t.Ref_t t' => type_v 0 ctMap' tenvS v' t'
  | store_v.W8array _, store_t.W8array_t => True
  | store_v.Varray vs, store_t.Varray_t t' =>
    ∀ v' ∈ vs, type_v 0 ctMap' tenvS v' t'
  | _, _ => False

def type_s (ctMap' : ctMap) (envS : List (store_v v)) (tenvS : tenv_store) : Prop :=
  ∀ l,
    ((∃ st, FLOOKUP tenvS l = some st) ↔ (∃ v', store_lookup l envS = some v')) ∧
    (∀ st sv, FLOOKUP tenvS l = some st → store_lookup l envS = some sv →
      type_sv ctMap' tenvS sv st)

def ctMap_has_exns (ctMap' : ctMap) : Prop :=
  FLOOKUP ctMap' bind_stamp = some ([], [], Texn_num) ∧
  FLOOKUP ctMap' chr_stamp = some ([], [], Texn_num) ∧
  FLOOKUP ctMap' div_stamp = some ([], [], Texn_num) ∧
  FLOOKUP ctMap' subscript_stamp = some ([], [], Texn_num)

def ctMap_has_lists (ctMap' : ctMap) : Prop :=
  FLOOKUP ctMap' (stamp.TypeStamp (strlit "[]".toList) list_type_num) =
    some ([strlit "'a".toList], [], Tlist_num) ∧
  FLOOKUP ctMap' (stamp.TypeStamp (strlit "::".toList) list_type_num) =
    some ([strlit "'a".toList],
          [sem_t.Tvar (strlit "'a".toList), Tlist (sem_t.Tvar (strlit "'a".toList))],
          Tlist_num) ∧
  (∀ cn, cn ≠ strlit "::".toList → cn ≠ strlit "[]".toList →
    FLOOKUP ctMap' (stamp.TypeStamp cn list_type_num) = none)

def ctMap_has_bools (ctMap' : ctMap) : Prop :=
  FLOOKUP ctMap' (stamp.TypeStamp (strlit "True".toList) bool_type_num) =
    some ([], [], Tbool_num) ∧
  FLOOKUP ctMap' (stamp.TypeStamp (strlit "False".toList) bool_type_num) =
    some ([], [], Tbool_num) ∧
  (∀ cn, cn ≠ strlit "True".toList → cn ≠ strlit "False".toList →
    FLOOKUP ctMap' (stamp.TypeStamp cn bool_type_num) = none)

def good_ctMap (ctMap' : ctMap) : Prop :=
  ctMap_ok ctMap' ∧
  ctMap_has_bools ctMap' ∧
  ctMap_has_exns ctMap' ∧
  ctMap_has_lists ctMap'

def consistent_ctMap (st : state ffi_ty) (type_ids : Nat → Prop) (ctMap' : ctMap) : Prop :=
  sorry -- involves DISJOINT, FRANGE, FDOM conditions

def type_all_env (ctMap' : ctMap) (tenvS : tenv_store) (env : sem_env) (tenv : type_env) : Prop :=
  nsAll2_het (type_ctor ctMap') env.c tenv.c ∧
  nsAll2_het (fun (_ : id modN varN) (v' : v) (p : Nat × sem_t) => type_v p.1 ctMap' tenvS v' p.2) env.v_field tenv.v

def type_sound_invariant (st : state ffi_ty) (env : sem_env)
    (ctMap' : ctMap) (tenvS : tenv_store) (type_idents : Nat → Prop)
    (tenv : type_env) : Prop :=
  tenv_ok tenv ∧
  good_ctMap ctMap' ∧
  consistent_ctMap st type_idents ctMap' ∧
  type_all_env ctMap' tenvS env tenv ∧
  type_s ctMap' st.refs tenvS

end CakeML
