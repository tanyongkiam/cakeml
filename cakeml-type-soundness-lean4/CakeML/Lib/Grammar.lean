/-
  Grammar types from HOL4's grammarTheory.
  Defines symbols, parse trees, and grammars.
-/

namespace HOL4

/-- Terminal or nonterminal symbol -/
inductive symbol (τ : Type) (ν : Type) where
  | TOK : τ → symbol τ ν
  | NT : ν → symbol τ ν
deriving Repr, BEq, Inhabited

/-- Parse tree -/
inductive parsetree (τ : Type) (ν : Type) where
  | Lf : symbol τ ν → parsetree τ ν
  | Nd : ν → List (parsetree τ ν) → parsetree τ ν
deriving Repr, Inhabited

/-- A grammar maps nonterminals to sets of production rules -/
structure grammar (τ : Type) (ν : Type) where
  rules : ν → List (List (symbol τ ν))
  start : ν

end HOL4
