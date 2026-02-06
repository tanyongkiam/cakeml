/-
  Lazy lists, from HOL4's llistTheory.
  We use an inductive type as a stand-in; the actual HOL4 type is coinductive.
  For our purposes (stating theorems as sorry), this suffices.
-/

namespace HOL4

/-- Lazy list (modeled as potentially infinite via partial functions) -/
inductive llist (α : Type) where
  | lnil : llist α
  | lcons : α → llist α → llist α
deriving Repr, BEq, Inhabited

namespace llist

variable {α : Type} {β : Type}

def LHD : llist α → Option α
  | lnil => none
  | lcons x _ => some x

def LTL : llist α → Option (llist α)
  | lnil => none
  | lcons _ xs => some xs

def fromList : List α → llist α
  | [] => lnil
  | x :: xs => lcons x (fromList xs)

def LTAKE : Nat → llist α → Option (List α)
  | 0, _ => some []
  | _ + 1, lnil => none
  | n + 1, lcons x xs => do
    let rest ← LTAKE n xs
    return x :: rest

def LNTH : Nat → llist α → Option α
  | 0, lcons x _ => some x
  | n + 1, lcons _ xs => LNTH n xs
  | _, lnil => none

def LAPPEND : llist α → llist α → llist α
  | lnil, l2 => l2
  | lcons x xs, l2 => lcons x (LAPPEND xs l2)

def LMAP (f : α → β) : llist α → llist β
  | lnil => lnil
  | lcons x xs => lcons (f x) (LMAP f xs)

def toList : llist α → List α
  | lnil => []
  | lcons x xs => x :: toList xs

end llist

/-- LPREFIX: l1 is a prefix of l2 -/
def LPREFIX (l1 l2 : llist α) : Prop :=
  ∀ (n : Nat) (xs : List α), l1.LTAKE n = some xs → l2.LTAKE n = some xs

end HOL4
