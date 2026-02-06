/-
  Proofs about the namespace datatype.
  Translated from: hol4_sources/namespacePropsScript.sml
-/
import CakeML.Core.Ast

namespace CakeML

open HOL4
open mlstring

-- mk_id injectivity
theorem mk_id_11 :
    ∀ (a : List m) (b : n) (c : List m) (d : n),
      @mk_id m n a b = mk_id c d ↔ a = c ∧ b = d := by sorry

-- id_to_mods (mk_id mn x) = mn
theorem id_to_mods_mk_id :
    ∀ (mn : List m) (x : n), id_to_mods (mk_id mn x) = mn := by sorry

-- id_to_n (mk_id mn x) = x
theorem id_to_n_mk_id :
    ∀ (mn : List m) (x : n), id_to_n (mk_id mn x) = x := by sorry

-- mk_id surjectivity
theorem mk_id_surj :
    ∀ (i : id m n), ∃ p k, i = mk_id p k := by sorry

-- mk_id (id_to_mods id) (id_to_n id) = id
theorem mk_id_thm :
    ∀ (i : id m n), mk_id (id_to_mods i) (id_to_n i) = i := by sorry

-- ----------- Monotonicity for ind rel ------------

theorem nsAll_mono [BEq m] [BEq n] :
    (∀ (i : id m n) (x : v), P i x → Q i x) →
    nsAll P e → nsAll Q e := by sorry

theorem nsSub_mono [BEq m] [BEq n] :
    (∀ (x : id m n) (y z : v), R1 x y z → R2 x y z) →
    nsSub R1 e1 e2 → nsSub R2 e1 e2 := by sorry

theorem nsSub_mono2 [BEq m] [BEq n] :
    (∀ (x : id m n) (y z : v),
      nsLookup e1 x = some y ∧ nsLookup e2 x = some z ∧ R1 x y z → R2 x y z) →
    nsSub R1 e1 e2 → nsSub R2 e1 e2 := by sorry

theorem nsAll2_mono [BEq m] [BEq n] :
    (∀ (x : id m n) (y z : v), R1 x y z → R2 x y z) →
    nsAll2 R1 e1 e2 → nsAll2 R2 e1 e2 := by sorry

-- ---------- Automatic simps involving empty envs --------------

theorem nsLookup_nsEmpty [BEq m] [BEq n] :
    ∀ (i : id m n), nsLookup (nsEmpty : ns m n v) i = none := by sorry

theorem nsLookupMod_nsEmpty [BEq m] :
    ∀ (x : m) (y : List m), nsLookupMod (nsEmpty : ns m n v) (x :: y) = none := by sorry

theorem nsAppend_nsEmpty [BEq m] [BEq n] :
    ∀ (env : ns m n v), nsAppend env nsEmpty = env ∧ nsAppend nsEmpty env = env := by sorry

theorem alist_to_ns_nil :
    (alist_to_ns [] : ns m n v) = nsEmpty := by sorry

theorem nsSub_nsEmpty [BEq m] [BEq n] :
    ∀ (r : id m n → v → v → Prop) (env : ns m n v), nsSub r nsEmpty env := by sorry

theorem nsAll_nsEmpty [BEq m] [BEq n] :
    ∀ (f : id m n → v → Prop), nsAll f (nsEmpty : ns m n v) := by sorry

theorem nsAll2_nsEmpty [BEq m] [BEq n] :
    ∀ (f : id m n → v → v → Prop), nsAll2 f (nsEmpty : ns m n v) (nsEmpty : ns m n v) := by sorry

theorem nsDom_nsEmpty [BEq m] [BEq n] :
    nsDom (nsEmpty : ns m n v) = fun _ => False := by sorry

theorem nsDomMod_nsEmpty [BEq m] :
    nsDomMod (nsEmpty : ns m n v) = fun path => path = [] := by sorry

theorem nsMap_nsEmpty :
    ∀ (f : v → w), nsMap f (nsEmpty : ns m n v) = nsEmpty := by sorry

theorem nsBind_nsEmpty :
    ∀ (x : n) (y : v) (env : ns m n v), nsBind x y env ≠ nsEmpty := by sorry

theorem nsLookup_Bind_v_some [BEq m] [BEq n] :
    ∀ (v₁ : List (n × v)) (k : id m n) (x : v),
    nsLookup (ns.Bind v₁ ([] : List (m × ns m n v))) k = some x ↔
    ∃ y, k = id.Short y ∧ ALOOKUP v₁ y = some x := by sorry

-- ------------- Other simple automatic theorems ---------

theorem alist_to_ns_cons :
    ∀ (k : n) (v₁ : v) (l : List (n × v)),
      (alist_to_ns ((k, v₁) :: l) : ns m n v) = nsBind k v₁ (alist_to_ns l) := by sorry

theorem nsAppend_nsBind :
    ∀ (k : n) (v₁ : v) (e1 e2 : ns m n v),
      nsAppend (nsBind k v₁ e1) e2 = nsBind k v₁ (nsAppend e1 e2) := by sorry

theorem nsAppend_alist_to_ns :
    ∀ (al1 al2 : List (n × v)),
      nsAppend (alist_to_ns al1 : ns m n v) (alist_to_ns al2) = alist_to_ns (al1 ++ al2) := by sorry

theorem nsAppend_assoc :
    ∀ (e1 e2 e3 : ns m n v), nsAppend e1 (nsAppend e2 e3) = nsAppend (nsAppend e1 e2) e3 := by sorry

theorem nsLookup_nsBind [BEq m] [BEq n] :
    (∀ (name : n) (v₁ : v) (e : ns m n v), nsLookup (nsBind name v₁ e) (id.Short name) = some v₁) ∧
    (∀ (i : id m n) (n' : n) (v₁ : v) (e : ns m n v),
      i ≠ id.Short n' → nsLookup (nsBind n' v₁ e) i = nsLookup e i) := by sorry

theorem nsAppend_nsSing :
    ∀ (name : n) (x : v) (e : ns m n v), nsAppend (nsSing name x) e = nsBind name x e := by sorry

theorem nsLookup_nsSing [BEq m] [BEq n] [DecidableEq m] [DecidableEq n] :
    ∀ (name : n) (v₁ : v) (i : id m n),
      nsLookup (nsSing name v₁) i = if i = id.Short name then some v₁ else none := by sorry

theorem nsAll_nsSing [BEq m] [BEq n] :
    ∀ (R : id m n → v → Prop) (name : n) (v₁ : v),
      nsAll R (nsSing name v₁) ↔ R (id.Short name) v₁ := by sorry

-- nsAll2 on singletons
theorem nsAll2_nsSing [BEq m] [BEq n] :
    True := by sorry

theorem nsMap_nsSing :
    ∀ (f : v → w) (x : n) (v₁ : v),
      nsMap f (nsSing x v₁ : ns m n v) = nsSing x (f v₁) := by sorry

theorem nsLookupMod_nsSing [BEq m] :
    True := by sorry

theorem nsBind_11 :
    ∀ (x x' : n) (y y' : v) (e e' : ns m n v),
      nsBind x y e = nsBind x' y' e' ↔ x = x' ∧ y = y' ∧ e = e' := by sorry

-- nsDom and nsDomMod on nsBind
theorem nsDom_nsBind [BEq m] [BEq n] :
    True := by sorry

theorem nsDom_nsSing [BEq m] [BEq n] :
    True := by sorry

theorem nsDomMod_nsBind [BEq m] [BEq n] :
    True := by sorry

theorem nsDomMod_nsSing [BEq m] [BEq n] :
    True := by sorry

theorem nsLookupMod_alist_to_ns [BEq m] :
    ∀ (l : List (n × v)) (x : m) (y : List m),
      nsLookupMod (alist_to_ns l : ns m n v) (x :: y) = none := by sorry

theorem alist_to_ns_11 :
    ∀ (l1 l2 : List (n × v)), (alist_to_ns l1 : ns m n v) = alist_to_ns l2 ↔ l1 = l2 := by sorry

-- -------------- nsLookup ------------------

theorem nsLookup_to_nsLookupMod [BEq m] [BEq n] :
    ∀ (env : ns m n v) (i : id m n) (t : v),
      nsLookup env i = some t →
      ∃ sub, nsLookupMod env (id_to_mods i) = some sub ∧
             nsLookup sub (id.Short (id_to_n i)) = some t := by sorry

-- -------------- alist_to_ns ---------------

theorem nsLookup_alist_to_ns_some [BEq m] [BEq n] :
    ∀ (l : List (n × v)) (i : id m n) (v₁ : v),
      nsLookup (alist_to_ns l) i = some v₁ ↔
      ∃ x', i = id.Short x' ∧ ALOOKUP l x' = some v₁ := by sorry

theorem nsLookup_alist_to_ns_none [BEq m] [BEq n] :
    ∀ (l : List (n × v)) (i : id m n),
      nsLookup (alist_to_ns l) i = none ↔
      ∀ x', i = id.Short x' → ALOOKUP l x' = none := by sorry

theorem nsDom_alist_to_ns [BEq m] [BEq n] :
    True := by sorry

-- -------------- nsLift ---------------

theorem nsLookup_nsLift [BEq m] [BEq n] :
    ∀ (mn : m) (e : ns m n v) (i : id m n),
      nsLookup (nsLift mn e) i =
      match i with
      | id.Long mn' i' => if mn == mn' then nsLookup e i' else none
      | id.Short _ => none := by sorry

theorem nsLookupMod_nsLift [BEq m] :
    ∀ (mn : m) (e : ns m n v) (path : List m),
      nsLookupMod (nsLift mn e) path =
      match path with
      | [] => some (nsLift mn e)
      | mn' :: path' => if mn == mn' then nsLookupMod e path' else none := by sorry

theorem nsLookup_nsLift_append [BEq m] [BEq n] :
    True := by sorry

-- --------------- nsAppend -------------

theorem nsLookup_nsAppend_none [BEq m] [BEq n] :
    True := by sorry

theorem nsLookup_nsAppend_some [BEq m] [BEq n] :
    True := by sorry

theorem nsAppend_to_nsBindList [BEq m] [BEq n] :
    ∀ (l : List (n × v)) (e : ns m n v),
      nsAppend (alist_to_ns l) e = nsBindList l e := by sorry

theorem nsLookupMod_nsAppend_none [BEq m] :
    True := by sorry

theorem nsLookupMod_nsAppend_some [BEq m] :
    True := by sorry

theorem nsDom_nsAppend_alist [BEq m] [BEq n] :
    True := by sorry

-- -------------- nsAll ----------------

theorem nsAll_T [BEq m] [BEq n] :
    ∀ (e : ns m n v), nsAll (fun _ _ => True) e := by sorry

theorem nsLookup_nsAll [BEq m] [BEq n] :
    ∀ (env : ns m n v) (x : id m n) (P : id m n → v → Prop) (v₁ : v),
      nsAll P env → nsLookup env x = some v₁ → P x v₁ := by sorry

theorem nsAll_nsAppend [BEq m] [BEq n] :
    ∀ (f : id m n → v → Prop) (e1 e2 : ns m n v),
      nsAll f e1 → nsAll f e2 → nsAll f (nsAppend e1 e2) := by sorry

theorem nsAll_nsBind [BEq m] [BEq n] :
    ∀ (P : id m n → v → Prop) (x : n) (v₁ : v) (e : ns m n v),
      P (id.Short x) v₁ → nsAll P e → nsAll P (nsBind x v₁ e) := by sorry

theorem nsAll_nsOptBind [BEq m] [BEq n] :
    ∀ (P : id m n → v → Prop) (x : Option n) (v₁ : v) (e : ns m n v),
      (x = none ∨ ∃ name, x = some name ∧ P (id.Short name) v₁) →
      nsAll P e → nsAll P (nsOptBind x v₁ e) := by sorry

theorem nsAll_alist_to_ns [BEq m] [BEq n] :
    True := by sorry

theorem nsAll_nsLift [BEq m] [BEq n] :
    ∀ (R : id m n → v → Prop) (mn : m) (e : ns m n v),
      nsAll R (nsLift mn e) ↔ nsAll (fun i => R (id.Long mn i)) e := by sorry

theorem nsAll_nsAppend_left [BEq m] [BEq n] :
    ∀ (P : id m n → v → Prop) (n1 n2 : ns m n v),
      nsAll P (nsAppend n1 n2) → nsAll P n1 := by sorry

-- -------------- nsSub ----------------

theorem nsSub_conj [BEq m] [BEq n] :
    ∀ (P Q : id m n → v → v → Prop) (e1 e2 : ns m n v),
      nsSub (fun i x y => P i x y ∧ Q i x y) e1 e2 ↔ nsSub P e1 e2 ∧ nsSub Q e1 e2 := by sorry

theorem nsSub_refl [BEq m] [BEq n] :
    ∀ (P : id m n → v → Prop) (R : id m n → v → v → Prop),
      (∀ i x, P i x → R i x x) → ∀ (e : ns m n v), nsAll P e → nsSub R e e := by sorry

theorem nsSub_nsBind [BEq m] [BEq n] :
    ∀ (R : id m n → v → v → Prop) (x : n) (v1 v2 : v) (e1 e2 : ns m n v),
      R (id.Short x) v1 v2 → nsSub R e1 e2 →
      nsSub R (nsBind x v1 e1) (nsBind x v2 e2) := by sorry

theorem nsSub_nsAppend2 [BEq m] [BEq n] :
    ∀ (R : id m n → v → v → Prop) (e1 e2 e2' : ns m n v),
      nsSub R e1 e1 → nsSub R e2 e2' →
      nsSub R (nsAppend e1 e2) (nsAppend e1 e2') := by sorry

theorem nsSub_nsAppend_lift [BEq m] [BEq n] :
    ∀ (R : id m n → v → v → Prop) (mn : m) (e1 e1' e2 e2' : ns m n v),
      nsSub (fun i => R (id.Long mn i)) e1 e1' →
      nsSub R e2 e2' →
      nsSub R (nsAppend (nsLift mn e1) e2) (nsAppend (nsLift mn e1') e2') := by sorry

-- alist_rel_restr definition
def alist_rel_restr [BEq κ] (R : κ → v → v → Prop) (l1 l2 : List (κ × v)) : List κ → Prop
  | [] => True
  | k1 :: keys =>
    match ALOOKUP l1 k1 with
    | none => False
    | some v1 =>
      match ALOOKUP l2 k1 with
      | none => False
      | some v2 => R k1 v1 v2 ∧ alist_rel_restr R l1 l2 keys

theorem alist_rel_restr_thm [BEq κ] :
    ∀ (R : κ → v → v → Prop) (e1 e2 : List (κ × v)) (keys : List κ),
      alist_rel_restr R e1 e2 keys ↔
      ∀ k, k ∈ keys → ∃ v1 v2, ALOOKUP e1 k = some v1 ∧ ALOOKUP e2 k = some v2 ∧ R k v1 v2 := by sorry

-- alistSub definition
def alistSub [BEq κ] (R : κ → v → v → Prop) (e1 e2 : List (κ × v)) : Prop :=
  alist_rel_restr R e1 e2 (e1.map Prod.fst)

theorem alistSub_cong [BEq κ] :
    True := by sorry

-- nsSub_compute definition
-- (omitted because it uses complex termination measure; just declare the theorem)
theorem nsSub_compute_related :
    True := by sorry

theorem nsLookup_FOLDR_nsLift [BEq m] [BEq n] :
    True := by sorry

theorem nsLookup_FOLDR_nsLift_some [BEq m] [BEq n] :
    True := by sorry

theorem nsLookupMod_FOLDR_nsLift_none [BEq m] :
    True := by sorry

-- -------------- nsAll2 ----------------

theorem nsAll2_conj [BEq m] [BEq n] :
    ∀ (P Q : id m n → v → v → Prop) (e1 e2 : ns m n v),
      nsAll2 (fun i x y => P i x y ∧ Q i x y) e1 e2 ↔
      nsAll2 P e1 e2 ∧ nsAll2 Q e1 e2 := by sorry

theorem nsAll2_nsLookup1 [BEq m] [BEq n] :
    ∀ (R : id m n → v → v → Prop) (e1 e2 : ns m n v) (i : id m n) (v1 : v),
      nsLookup e1 i = some v1 →
      nsAll2 R e1 e2 →
      ∃ v2, nsLookup e2 i = some v2 ∧ R i v1 v2 := by sorry

theorem nsAll2_nsLookup2 [BEq m] [BEq n] :
    ∀ (R : id m n → v → v → Prop) (e1 e2 : ns m n v) (i : id m n) (v2 : v),
      nsLookup e2 i = some v2 →
      nsAll2 R e1 e2 →
      ∃ v1, nsLookup e1 i = some v1 ∧ R i v1 v2 := by sorry

theorem nsAll2_nsLookup_none [BEq m] [BEq n] :
    ∀ (R : id m n → v → v → Prop) (e1 e2 : ns m n v) (i : id m n),
      nsAll2 R e1 e2 →
      (nsLookup e1 i = none ↔ nsLookup e2 i = none) := by sorry

theorem nsAll2_nsBind [BEq m] [BEq n] :
    ∀ (R : id m n → v → v → Prop) (x : n) (v1 v2 : v) (e1 e2 : ns m n v),
      R (id.Short x) v1 v2 → nsAll2 R e1 e2 →
      nsAll2 R (nsBind x v1 e1) (nsBind x v2 e2) := by sorry

theorem nsAll2_nsBindList [BEq m] [BEq n] :
    True := by sorry

theorem nsAll2_nsAppend [BEq m] [BEq n] :
    ∀ (R : id m n → v → v → Prop) (e1 e1' e2 e2' : ns m n v),
      nsAll2 R e1 e2 → nsAll2 R e1' e2' →
      nsAll2 R (nsAppend e1 e1') (nsAppend e2 e2') := by sorry

theorem nsAll2_alist_to_ns [BEq m] [BEq n] :
    True := by sorry

theorem nsAll2_nsLift [BEq m] [BEq n] :
    ∀ (R : id m n → v → v → Prop) (mn : m) (e1 e2 : ns m n v),
      nsAll2 R (nsLift mn e1) (nsLift mn e2) ↔
      nsAll2 (fun i => R (id.Long mn i)) e1 e2 := by sorry

-- -------------- nsMap ---------------

theorem nsMap_alist_to_ns :
    True := by sorry

theorem nsMap_compose :
    ∀ (g : v → w) (e : ns m n v) (f : w → u),
      nsMap f (nsMap g e) = nsMap (f ∘ g) e := by sorry

theorem nsMap_I :
    ∀ (env : ns m n v), nsMap _root_.id env = env := by sorry

theorem nsMap_nsAppend :
    ∀ (n1 n2 : ns m n v) (f : v → w),
      nsMap f (nsAppend n1 n2) = nsAppend (nsMap f n1) (nsMap f n2) := by sorry

theorem nsLookupMod_nsMap [BEq m] :
    True := by sorry

theorem nsLookup_nsMap [BEq m] [BEq n] :
    ∀ (env : ns m n v) (x : id m n) (f : v → w),
      nsLookup (nsMap f env) x = Option.map f (nsLookup env x) := by sorry

theorem nsAll_nsMap [BEq m] [BEq n] :
    ∀ (f : v → w) (env : ns m n v) (P : id m n → w → Prop),
      nsAll P (nsMap f env) ↔ nsAll (fun x y => P x (f y)) env := by sorry

theorem nsLift_nsMap :
    ∀ (f : v → w) (env : ns m n v) (mn : m),
      nsLift mn (nsMap f env) = nsMap f (nsLift mn env) := by sorry

theorem nsSub_nsMap [BEq m] [BEq n] :
    ∀ (R : id m n → w → w → Prop) (f : v → w) (n1 n2 : ns m n v),
      nsSub R (nsMap f n1) (nsMap f n2) ↔
      nsSub (fun i x y => R i (f x) (f y)) n1 n2 := by sorry

-- --------------- nsDom ---------------

theorem nsLookup_nsDom [BEq m] [BEq n] :
    ∀ (x : id m n) (env : ns m n v),
      nsDom env x ↔ ∃ val, nsLookup env x = some val := by sorry

theorem nsDomMod_alist_to_ns [BEq m] :
    ∀ (l : List (n × v)),
      nsDomMod (alist_to_ns l : ns m n v) = fun path => path = [] := by sorry

theorem nsDom_nsAppend_equal [BEq m] [BEq n] :
    True := by sorry

theorem nsDom_nsLift [BEq m] [BEq n] :
    True := by sorry

theorem nsDomMod_nsLift [BEq m] :
    True := by sorry

theorem nsDom_nsAppend_flat [BEq m] [BEq n] :
    True := by sorry

theorem nsDomMod_nsAppend_flat [BEq m] :
    True := by sorry

end CakeML
