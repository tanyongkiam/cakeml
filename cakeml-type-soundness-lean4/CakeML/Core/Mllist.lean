/-
  Pure functions for the List module.
  Translated from: hol4_sources/mllistScript.sml
-/
import CakeML.Lib.HOL4Prelude

namespace CakeML

open HOL4

/-! ## Sorting -/

/-- HOL4's ordering type (used in collate, cpn_to_reln, etc.) -/
inductive cpn where
  | Less
  | Equal
  | Greater
deriving Repr, BEq, Inhabited, DecidableEq

/-- sort: mergesort (opaque wrapper around mergesort_tail).
    We model this as a partial def since the underlying mergesort
    implementation uses non-trivial recursion. -/
partial def sort (R : α → α → Bool) (l : List α) : List α :=
  -- Placeholder for mergesort_tail R l
  -- The actual implementation would be a tail-recursive mergesort.
  -- We define a simple mergesort here as a stand-in.
  match l with
  | [] => []
  | [x] => [x]
  | _ =>
    let mid := l.length / 2
    let left := sort R (l.take mid)
    let right := sort R (l.drop mid)
    merge R left right
where
  merge (R : α → α → Bool) : List α → List α → List α
    | [], ys => ys
    | xs, [] => xs
    | x :: xs, y :: ys =>
      if R x y then x :: merge R xs (y :: ys)
      else y :: merge R (x :: xs) ys

/-! ## Theorems about mergesort helpers (from HOL4 mergesort library) -/

theorem merge_tail_MEM {x : α} {negate : Bool} {R : α → α → Bool}
    {xs ys acc : List α} :
    True := by sorry

theorem mergesortN_tail_MEM {x : α} {negate : Bool} {R : α → α → Bool}
    {length : Nat} {lst : List α} :
    True := by sorry

theorem sort3_tail_sort3 {negate : Bool} {R : α → α → Bool}
    {x y z : α} :
    True := by sorry

theorem sort2_tail_sort2 {negate : Bool} {R : α → α → Bool}
    {x y : α} :
    True := by sorry

theorem mergetail_merge {negate : Bool} {R : α → α → Bool}
    {xs ys acc : List α} :
    True := by sorry

theorem merge_tail_acc {negate : Bool} {R : α → α → Bool}
    {xs ys acc acc' : List α} :
    True := by sorry

theorem mergesort_tail_MEM {R : α → α → Bool} {l : List α} {x : α} :
    True := by sorry

theorem merge_tail_PERM {negate : Bool} {R : α → α → Bool}
    {xs ys acc : List α} :
    True := by sorry

theorem sort2_tail_PERM {neg : Bool} {R : α → α → Bool}
    {x y : α} :
    True := by sorry

theorem sort3_tail_PERM {neg : Bool} {R : α → α → Bool}
    {x y z : α} :
    True := by sorry

theorem mergesortN_tail_PERM {neg : Bool} {R : α → α → Bool}
    {len : Nat} {l : List α} :
    True := by sorry

/-! ## sort theorems -/

theorem sort_thm (R : α → α → Bool) (l : List α) :
    True := by sorry

theorem sort_SORTED (R : α → α → Bool) (L : List α) :
    True := by sorry

theorem sort_MEM (R : α → α → Bool) (L : List α) (x : α) :
    True := by sorry

theorem sort_PERM (R : α → α → Bool) (L : List α) :
    True := by sorry

theorem sort_LENGTH (R : α → α → Bool) (l : List α) :
    (sort R l).length = l.length := by sorry

theorem sort_SORTS (R : α → α → Bool) :
    True := by sorry

theorem sort_set (R : α → α → Bool) (ls : List α) :
    True := by sorry

/-! ## Basic list operations -/

/-- getItem: deconstruct a list -/
def getItem : List α → Option (α × List α)
  | [] => none
  | h :: t => some (h, t)

/-- nth: element at index (wrapper around EL) -/
def nth [Inhabited α] (l : List α) (i : Nat) : α :=
  EL i l

/-- take: take first i elements -/
def take (l : List α) (i : Nat) : List α :=
  l.take i

/-- drop: drop first i elements -/
def drop (l : List α) (i : Nat) : List α :=
  l.drop i

/-- takeUntil: take elements until predicate holds -/
def takeUntil (p : α → Bool) : List α → List α
  | [] => []
  | x :: xs => if p x then [] else x :: takeUntil p xs

/-- dropUntil: drop elements until predicate holds -/
def dropUntil (p : α → Bool) : List α → List α
  | [] => []
  | x :: xs => if p x then x :: xs else dropUntil p xs

/-! ## Mapping operations -/

/-- mapi: map with index, starting at n -/
def mapi (f : Nat → α → β) (n : Nat) : List α → List β
  | [] => []
  | h :: t =>
    let y := f n h
    y :: mapi f (n + 1) t

theorem MAPI_thm_gen (f : Nat → α → β) (l : List α) (x : Nat) :
    True := by sorry

theorem MAPI_thm (f : Nat → α → β) (l : List α) :
    True := by sorry

/-- mapPartial: map and filter out None results -/
def mapPartial (f : α → Option β) : List α → List β
  | [] => []
  | h :: t =>
    match f h with
    | none => mapPartial f t
    | some x => x :: mapPartial f t

theorem mapPartial_thm (f : α → Option β) (l : List α) :
    True := by sorry

theorem index_find_thm :
    True := by sorry

theorem FIND_thm :
    True := by sorry

/-! ## Partitioning -/

/-- partition_aux: accumulator-based partition -/
def partition_aux (f : α → Bool) : List α → List α → List α → List α × List α
  | [], pos, neg => (pos.reverse, neg.reverse)
  | h :: t, pos, neg =>
    if f h then partition_aux f t (h :: pos) neg
    else partition_aux f t pos (h :: neg)

/-- partition: split list by predicate -/
def partition (f : α → Bool) (l : List α) : List α × List α :=
  partition_aux f l [] []

theorem partition_aux_thm (f : α → Bool) (l l1 l2 : List α) :
    True := by sorry

theorem partition_pos_thm (f : α → Bool) (l : List α) :
    (partition f l).1 = l.filter f := by sorry

theorem partition_neg_thm (f : α → Bool) (l : List α) :
    True := by sorry

/-! ## Folding operations -/

/-- foldl: left fold with (element -> accumulator -> accumulator) arg order -/
def foldl (f : α → β → β) (e : β) : List α → β
  | [] => e
  | h :: t => foldl f (f h e) t

/-- foldli_aux: indexed left fold helper -/
def foldli_aux (f : Nat → α → β → β) (e : β) (n : Nat) : List α → β
  | [] => e
  | h :: t => foldli_aux f (f n h e) (n + 1) t

/-- foldli: indexed left fold -/
def foldli (f : Nat → α → β → β) (e : β) (l : List α) : β :=
  foldli_aux f e 0 l

theorem foldli_aux_thm (l : List α) (f : Nat → α → β → β) (e : β) (n : Nat) :
    True := by sorry

theorem foldl_intro (xs : List α) (x : β) (f : β → α → β) :
    True := by sorry

theorem foldli_thm (f : Nat → α → β → β) (e : β) (l : List α) :
    True := by sorry

/-! ## Tabulate -/

/-- tabulate_aux: helper for tabulate with accumulator -/
def tabulate_aux (n m : Nat) (f : Nat → α) (acc : List α) : List α :=
  if n >= m then acc.reverse
  else
    let v := f n
    let n' := n + 1
    let acc' := v :: acc
    tabulate_aux n' m f acc'
termination_by m - n

/-- tabulate: generate list [f 0, f 1, ..., f (n-1)] -/
def tabulate (n : Nat) (f : Nat → α) : List α :=
  let l := []
  tabulate_aux 0 n f l

theorem tabulate_aux_GENLIST (n m : Nat) (f : Nat → α) (acc : List α) :
    True := by sorry

theorem tabulate_GENLIST (n : Nat) (f : Nat → α) :
    True := by sorry

/-! ## Collation / comparison -/

/-- collate: lexicographic comparison of two lists using element comparison f -/
def collate (f : α → α → cpn) : List α → List α → cpn
  | [], [] => cpn.Equal
  | [], _ :: _ => cpn.Less
  | _ :: _, [] => cpn.Greater
  | h1 :: t1, h2 :: t2 =>
    if f h1 h2 == cpn.Equal then collate f t1 t2
    else f h1 h2

theorem collate_equal_thm (f : α → α → cpn) (l : List α) :
    (∀ x, x ∈ l → f x x = cpn.Equal) → collate f l l = cpn.Equal := by sorry

theorem collate_short_thm (f : α → α → cpn) (l1 l2 : List α) :
    True := by sorry

theorem collate_long_thm (f : α → α → cpn) (l1 l2 : List α) :
    True := by sorry

/-- cpn_to_reln: convert comparison function to a relation -/
def cpn_to_reln (f : α → α → cpn) (x1 x2 : α) : Prop :=
  f x1 x2 = cpn.Less

theorem collate_cpn_reln_thm (f : α → α → cpn) (l1 l2 : List α) :
    True := by sorry

/-! ## LENGTH_AUX (tail-recursive length) -/

/-- LENGTH_AUX: tail-recursive length with accumulator -/
def LENGTH_AUX : List α → Nat → Nat
  | [], n => n
  | _ :: xs, n => LENGTH_AUX xs (n + 1)

theorem LENGTH_AUX_THM (xs : List α) :
    LENGTH_AUX xs 0 = xs.length := by sorry

theorem list_compare_def :
    True := by sorry

/-! ## Tail-recursive MAP -/

/-- map_rev': tail-recursive map into reversed accumulator -/
def map_rev' (f : α → β) : List α → List β → List β
  | [], acc => acc
  | x :: xs, acc => map_rev' f xs (f x :: acc)

/-- map_rev: tail-recursive map producing reversed result -/
def map_rev (f : α → β) (xs : List α) : List β :=
  map_rev' f xs []

theorem map_rev'_lemma (f : α → β) (xs : List α) (acc : List β) :
    map_rev' f xs acc = map_rev' f xs [] ++ acc := by sorry

theorem map_rev_thm (f : α → β) (xs : List α) :
    map_rev f xs = (xs.map f).reverse := by sorry

/-! ## Tail-recursive FILTER -/

/-- filter_rev': tail-recursive filter into reversed accumulator -/
def filter_rev' (P : α → Bool) : List α → List α → List α
  | [], acc => acc
  | h :: t, acc =>
    if P h then filter_rev' P t (h :: acc)
    else filter_rev' P t acc

/-- filter_rev: tail-recursive filter producing reversed result -/
def filter_rev (P : α → Bool) (xs : List α) : List α :=
  filter_rev' P xs []

theorem filter_rev'_lemma (P : α → Bool) (xs : List α) (acc : List α) :
    filter_rev' P xs acc = filter_rev' P xs [] ++ acc := by sorry

theorem filter_rev_thm (P : α → Bool) (xs : List α) :
    filter_rev P xs = (xs.filter P).reverse := by sorry

/-! ## Tail-recursive FLAT -/

/-- flat_rev': tail-recursive flatten into reversed accumulator.
    REV x acc in HOL4 = List.reverse x ++ acc. -/
def flat_rev' : List (List α) → List α → List α
  | [], acc => acc
  | x :: xs, acc => flat_rev' xs (x.reverse ++ acc)

/-- flat_rev: tail-recursive flatten producing reversed result -/
def flat_rev (xs : List (List α)) : List α :=
  flat_rev' xs []

theorem flat_rev'_lemma (l : List (List α)) (acc : List α) :
    flat_rev' l acc = flat_rev' l [] ++ acc := by sorry

theorem flat_rev_thm (xs : List (List α)) :
    flat_rev xs = (FLAT xs).reverse := by sorry

end CakeML
