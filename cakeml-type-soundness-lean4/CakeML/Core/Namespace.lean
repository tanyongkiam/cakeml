/-
  Defines a datatype for nested namespaces where names can be either
  short (e.g. foo) or long (e.g. ModuleA.InnerB.bar).
  Translated from: hol4_sources/namespaceScript.sml

  Note: HOL4's `namespace` type stores `(m, namespace) alist` in its second
  component, which is `List (m × namespace)`. Lean's kernel accepts this
  as strictly positive because `List` and `Prod` are both inductive containers.
-/
import CakeML.Lib.HOL4Prelude

namespace CakeML

open HOL4

/-- Association list type alias -/
abbrev alist (κ : Type) (ν : Type) := List (κ × ν)

/-- Identifiers: short or qualified with module paths -/
inductive id (m : Type) (n : Type) where
  | Short : n → id m n
  | Long : m → id m n → id m n
deriving Repr, BEq, Inhabited, DecidableEq

def mk_id : List m → n → id m n
  | [], n => id.Short n
  | mn :: mns, n => id.Long mn (mk_id mns n)

def id_to_n : id m n → n
  | id.Short n => n
  | id.Long _ i => id_to_n i

def id_to_mods : id m n → List m
  | id.Short _ => []
  | id.Long mn i => mn :: id_to_mods i

/-- Nested namespace: binds short names to values and module names to sub-namespaces.
    Named `ns` to avoid conflict with Lean keyword `namespace`. -/
inductive ns (m : Type) (n : Type) (v : Type) where
  | Bind : List (n × v) → List (m × ns m n v) → ns m n v
deriving Inhabited

def nsLookup [BEq m] [BEq n] : ns m n v → id m n → Option v
  | ns.Bind vals _, id.Short name =>
    ALOOKUP vals name
  | ns.Bind _ mods, id.Long mn rest =>
    match ALOOKUP mods mn with
    | none => none
    | some env => nsLookup env rest

def nsLookupMod [BEq m] : ns m n v → List m → Option (ns m n v)
  | e, [] => some e
  | ns.Bind _ mods, mn :: path =>
    match ALOOKUP mods mn with
    | none => none
    | some env => nsLookupMod env path

def nsEmpty : ns m n v := ns.Bind [] []

def nsAppend : ns m n v → ns m n v → ns m n v
  | ns.Bind v1 m1, ns.Bind v2 m2 => ns.Bind (v1 ++ v2) (m1 ++ m2)

def nsLift (mn : m) (env : ns m n v) : ns m n v :=
  ns.Bind [] [(mn, env)]

def alist_to_ns (a : List (n × v)) : ns m n v :=
  ns.Bind a []

def nsBind (k : n) (x : v) : ns m n v → ns m n v
  | ns.Bind vals mods => ns.Bind ((k, x) :: vals) mods

def nsBindList (l : List (n × v)) (e : ns m n v) : ns m n v :=
  l.foldr (fun ⟨x, v⟩ e => nsBind x v e) e

def nsOptBind [BEq n] (name : Option n) (x : v) (env : ns m n v) : ns m n v :=
  match name with
  | none => env
  | some n => nsBind n x env

def nsSing (n : n_ty) (x : v) : ns m n_ty v :=
  ns.Bind [(n, x)] []

def nsSub [BEq m] [BEq n] (r : id m n → v → v → Prop) (env1 env2 : ns m n v) : Prop :=
  (∀ i v1, nsLookup env1 i = some v1 →
    ∃ v2, nsLookup env2 i = some v2 ∧ r i v1 v2) ∧
  (∀ path, nsLookupMod env2 path = none → nsLookupMod env1 path = none)

def nsAll [BEq m] [BEq n] (f : id m n → v → Prop) (env : ns m n v) : Prop :=
  ∀ i val, nsLookup env i = some val → f i val

def nsAll2 [BEq m] [BEq n] (r : id m n → v → v → Prop) (env1 env2 : ns m n v) : Prop :=
  nsSub r env1 env2 ∧ nsSub (fun x y z => r x z y) env2 env1

def nsDom [BEq m] [BEq n] (env : ns m n v) : id m n → Prop :=
  fun name => ∃ val, nsLookup env name = some val

def nsDomMod [BEq m] (env : ns m n v) : List m → Prop :=
  fun path => ∃ e, nsLookupMod env path = some e

partial def nsMap (f : v → w) : ns m n v → ns m n w
  | ns.Bind vals mods =>
    ns.Bind
      (vals.map (fun ⟨name, x⟩ => (name, f x)))
      (mods.map (fun ⟨mn, e⟩ => (mn, nsMap f e)))

end CakeML
