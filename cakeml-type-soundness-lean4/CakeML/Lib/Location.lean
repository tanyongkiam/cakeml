/-
  Location types from HOL4's locationTheory.
  Source locations for the CakeML AST.
-/

namespace CakeML

inductive locn where
  | UNKNOWNpt : locn
  | EOFpt : locn
  | POSN : Nat → Nat → locn
deriving Repr, BEq, Inhabited, DecidableEq

namespace locn

def row : locn → Nat
  | POSN r _ => r
  | _ => 0

def col : locn → Nat
  | POSN _ c => c
  | _ => 0

end locn

inductive locs where
  | Locs : locn → locn → locs
deriving Repr, BEq, Inhabited, DecidableEq

def default_loc : locn := locn.POSN 0 0

def start_locs : locs := locs.Locs default_loc default_loc

def unknown_loc : locs := locs.Locs locn.UNKNOWNpt locn.UNKNOWNpt

def locnle (l1 l2 : locn) : Bool :=
  l1 == l2 ||
  l1 == locn.UNKNOWNpt ||
  l2 == locn.EOFpt ||
  (l2 != locn.UNKNOWNpt && l1 != locn.EOFpt &&
    (l1.row < l2.row || (l1.row == l2.row && l1.col < l2.col)))

variable {l l1 l2 l3 : locn} in
section
theorem locnle_REFL : locnle l l = true := by sorry
theorem locnle_total : locnle l1 l2 = true ∨ locnle l2 l1 = true := by sorry
theorem locnle_ANTISYM : locnle l1 l2 = true → locnle l2 l1 = true → l1 = l2 := by sorry
theorem locnle_TRANS : locnle l1 l2 = true → locnle l2 l3 = true → locnle l1 l3 = true := by sorry
end

def locsle : locs → locs → Bool
  | locs.Locs l1 _, locs.Locs l2 _ => locnle l1 l2

variable {l l1 l2 l3 : locs} in
section
theorem locsle_REFL : locsle l l = true := by sorry
theorem locsle_total : locsle l1 l2 = true ∨ locsle l2 l1 = true := by sorry
theorem locsle_TRANS : locsle l1 l2 = true → locsle l2 l3 = true → locsle l1 l3 = true := by sorry
end

def merge_locs : locs → locs → locs
  | locs.Locs l1 _, locs.Locs _ l4 => locs.Locs l1 l4

def merge_list_locs : List locs → locs
  | [] => unknown_loc
  | [h] => h
  | [h1, h2] => merge_locs h1 h2
  | h1 :: _ :: t => merge_list_locs (h1 :: t)

variable {α : Type}

def map_loc : List α → Nat → List (α × locs)
  | [], _ => []
  | h :: t, n => (h, locs.Locs (locn.POSN 0 n) (locn.POSN 0 n)) :: map_loc t (n + 1)

variable {h : locs} {l1 l2 l3 : locs}

theorem merge_locs_assoc :
  merge_locs (merge_locs l1 l2) l3 = merge_locs l1 l3 ∧
  merge_locs l1 (merge_locs l2 l3) = merge_locs l1 l3 := by sorry

theorem merge_list_locs_sing : merge_list_locs [h] = h := by sorry

theorem merge_locs_idem : merge_locs l1 l1 = l1 := by sorry

end CakeML
