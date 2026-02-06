/-
  HOL4 Prelude: basic primitives used throughout the CakeML development.
  Provides shims for HOL4 library functions.
-/

namespace HOL4

/-- HOL4's THE: extract from Option, with junk value for NONE -/
noncomputable def the [Inhabited α] : Option α → α
  | some x => x
  | none => default

/-- HOL4's opt_bind -/
def opt_bind : Option α → (α → Option β) → Option β :=
  Option.bind

/-- Association list lookup (ALOOKUP) -/
def ALOOKUP [BEq α] : List (α × β) → α → Option β
  | [], _ => none
  | (k, v) :: rest, key => if k == key then some v else ALOOKUP rest key

/-- LUPDATE: update element at index -/
def LUPDATE (x : α) : Nat → List α → List α
  | _, [] => []
  | 0, _ :: rest => x :: rest
  | n + 1, y :: rest => y :: LUPDATE x n rest

/-- EL: element at index (0-based) -/
def EL [Inhabited α] : Nat → List α → α
  | _, [] => default
  | 0, x :: _ => x
  | n + 1, _ :: rest => EL n rest

/-- SEG len start xs: take len elements starting at position start -/
def SEG (len start : Nat) (xs : List α) : List α :=
  (xs.drop start).take len

/-- FLAT: flatten list of lists -/
def FLAT : List (List α) → List α
  | [] => []
  | xs :: rest => xs ++ FLAT rest

/-- GENLIST f n = [f 0, f 1, ..., f (n-1)] -/
def GENLIST (f : Nat → α) : Nat → List α
  | 0 => []
  | n + 1 => GENLIST f n ++ [f n]

/-- ZIP: pair up two lists -/
def ZIP : List α × List β → List (α × β)
  | ([], _) => []
  | (_, []) => []
  | (x :: xs, y :: ys) => (x, y) :: ZIP (xs, ys)

/-- UNZIP: split list of pairs -/
def UNZIP : List (α × β) → List α × List β
  | [] => ([], [])
  | (a, b) :: rest =>
    let (as_, bs) := UNZIP rest
    (a :: as_, b :: bs)

/-- REPLICATE n x -/
def REPLICATE : Nat → α → List α
  | 0, _ => []
  | n + 1, x => x :: REPLICATE n x

/-- ALL_DISTINCT -/
def ALL_DISTINCT [BEq α] : List α → Bool
  | [] => true
  | x :: rest => !rest.any (· == x) && ALL_DISTINCT rest

/-- EVERY: check predicate on all elements -/
def EVERY (P : α → Bool) : List α → Bool
  | [] => true
  | x :: xs => P x && EVERY P xs

/-- EXISTS: check predicate on some element -/
def EXISTS (P : α → Bool) : List α → Bool
  | [] => false
  | x :: xs => P x || EXISTS P xs

/-- FIND -/
def FIND (P : α → Bool) : List α → Option α
  | [] => none
  | x :: xs => if P x then some x else FIND P xs

/-- MAP2: map a binary function over two lists -/
def MAP2 (f : α → β → γ) : List α → List β → List γ
  | [], _ => []
  | _, [] => []
  | x :: xs, y :: ys => f x y :: MAP2 f xs ys

/-- FOLDR -/
def FOLDR (f : α → β → β) (b : β) : List α → β
  | [] => b
  | x :: xs => f x (FOLDR f b xs)

/-- FOLDL -/
def FOLDL (f : β → α → β) (b : β) : List α → β
  | [] => b
  | x :: xs => FOLDL f (f b x) xs

/-- COUNT_LIST n = [0, 1, ..., n-1] -/
def COUNT_LIST : Nat → List Nat
  | 0 => []
  | n + 1 => COUNT_LIST n ++ [n]

/-- PAD_LEFT: pad list on the left -/
def PAD_LEFT (c : α) (n : Nat) (xs : List α) : List α :=
  REPLICATE (n - xs.length) c ++ xs

/-- PAD_RIGHT: pad list on the right -/
def PAD_RIGHT (c : α) (n : Nat) (xs : List α) : List α :=
  xs ++ REPLICATE (n - xs.length) c

/-- SPLITP: split at first element satisfying predicate -/
def SPLITP (P : α → Bool) : List α → List α × List α
  | [] => ([], [])
  | x :: xs =>
    if P x then ([], x :: xs)
    else let (l, r) := SPLITP P xs; (x :: l, r)

/-- FRONT: all but last element -/
def FRONT : List α → List α
  | [] => []
  | [_] => []
  | x :: rest => x :: FRONT rest

/-- SNOC: append to end -/
def SNOC (x : α) : List α → List α
  | [] => [x]
  | y :: rest => y :: SNOC x rest

/-- OPTION_MAP -/
def OPTION_MAP (f : α → β) : Option α → Option β :=
  Option.map f

/-- OPTION_JOIN -/
def OPTION_JOIN : Option (Option α) → Option α
  | some x => x
  | none => none

/-- IS_SOME -/
def IS_SOME : Option α → Bool
  | some _ => true
  | none => false

/-- IS_NONE -/
def IS_NONE : Option α → Bool
  | some _ => false
  | none => true

/-- IS_PREFIX -/
def IS_PREFIX [BEq α] : List α → List α → Bool
  | _, [] => true
  | [], _ :: _ => false
  | x :: xs, y :: ys => x == y && IS_PREFIX xs ys

/-- OPTION_CHOICE -/
def OPTION_CHOICE : Option α → Option α → Option α
  | some x, _ => some x
  | none, y => y

/-- FST / SND -/
abbrev FST (p : α × β) : α := p.1
abbrev SND (p : α × β) : β := p.2

end HOL4
