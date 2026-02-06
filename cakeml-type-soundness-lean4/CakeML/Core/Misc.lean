/-
  Miscellaneous definitions and minor lemmas used throughout the
  CakeML development.
  Translated from: hol4_sources/miscScript.sml
-/
import CakeML.Lib.HOL4Prelude
import CakeML.Lib.FiniteMap
import CakeML.Lib.Words
import CakeML.Lib.Llist
import CakeML.Lib.LprefixLub

namespace CakeML

open HOL4

-- ============================================================
-- the_def: total version of THE
-- ============================================================

/-- Total version of HOL4's THE: the x (SOME y) = y, the x NONE = x -/
def the_def (x : α) : Option α → α
  | some y => y
  | none => x

-- ============================================================
-- opt_bind
-- ============================================================

/-- opt_bind: bind an optional name into an environment -/
def opt_bind (n : Option α) (v : β) (e : List (α × β)) : List (α × β) :=
  match n with
  | none => e
  | some n' => (n', v) :: e

-- ============================================================
-- app_list datatype
-- ============================================================

/-- Application list: a tree-structured append list -/
inductive app_list (α : Type) where
  | List : List α → app_list α
  | Append : app_list α → app_list α → app_list α
  | Nil : app_list α
deriving Repr, BEq, Inhabited, DecidableEq

-- ============================================================
-- append_aux, append
-- ============================================================

/-- Auxiliary for flattening an app_list with an accumulator -/
def append_aux : app_list α → List α → List α
  | app_list.Nil, aux => aux
  | app_list.List xs, aux => xs ++ aux
  | app_list.Append l1 l2, aux => append_aux l1 (append_aux l2 aux)

/-- Flatten an app_list to a regular list -/
def append (l : app_list α) : List α :=
  append_aux l []

-- ============================================================
-- SmartAppend
-- ============================================================

/-- Smart append that avoids creating Append nodes with Nil -/
def SmartAppend : app_list α → app_list α → app_list α
  | app_list.Nil, l2 => l2
  | l1, app_list.Nil => l1
  | l1, l2 => app_list.Append l1 l2

end CakeML
