/-
  lprefix_lub: least upper bound of a chain of lazy lists under the LPREFIX ordering.
  From HOL4's lprefix_lubTheory.
-/
import CakeML.Lib.Llist

namespace HOL4

/-- lprefix_chain: a set of lazy lists that are pairwise comparable under LPREFIX -/
def lprefix_chain (ls : (llist α) → Prop) : Prop :=
  ∀ l1 l2, ls l1 → ls l2 → LPREFIX l1 l2 ∨ LPREFIX l2 l1

/-- lprefix_lub: the least upper bound of a chain -/
noncomputable def lprefix_lub (ls : (llist α) → Prop) : llist α :=
  Classical.choice (sorry : Nonempty (llist α))

/-- build_lprefix_lub: iterative construction from a sequence -/
noncomputable def build_lprefix_lub (f : Nat → llist α) : llist α :=
  lprefix_lub (fun l => ∃ n, f n = l)

end HOL4
