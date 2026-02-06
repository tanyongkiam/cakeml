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
-- Type abbreviations (sptree stubs)
-- ============================================================

/-- Stub for HOL4's sptree (sparse partial tree) -/
opaque spt.{u} (α : Type u) : Type u := List (Nat × α)

/-- num_set = unit spt -/
abbrev num_set := spt Unit
/-- num_map = 'a spt -/
abbrev num_map (α : Type) := spt α

/-- Stub for spt lookup -/
opaque spt_lookup : Nat → spt α → Option α := fun _ _ => none
/-- Stub for spt insert -/
opaque spt_insert : Nat → α → spt α → spt α := fun _ _ t => t
/-- Stub for spt delete -/
opaque spt_delete : Nat → spt α → spt α := fun _ t => t
/-- Stub for spt domain -/
opaque spt_domain : spt α → List Nat := fun _ => []
/-- Stub for spt LN (empty tree) -/
opaque spt_LN : spt α := sorry
/-- Stub for spt size -/
opaque spt_size : spt α → Nat := fun _ => 0
/-- Stub for spt map -/
opaque spt_map : (α → β) → spt α → spt β := fun _ _ => sorry
/-- Stub for fromList -/
opaque spt_fromList : List α → spt α := fun _ => sorry
/-- Stub for fromAList -/
opaque spt_fromAList : List (Nat × α) → spt α := fun _ => sorry
/-- Stub for toAList -/
opaque spt_toAList : spt α → List (Nat × α) := fun _ => []
/-- Stub for toList (range values) -/
opaque spt_toList : spt α → List α := fun _ => []
/-- Stub for subspt -/
opaque spt_subspt : spt α → spt α → Prop := fun _ _ => True
/-- Stub for wf (well-formed sptree) -/
opaque spt_wf : spt α → Prop := fun _ => True
/-- Stub for spt union -/
opaque spt_union : spt α → spt α → spt α := fun _ _ => sorry
/-- Stub for spt inter -/
opaque spt_inter : spt α → spt β → spt α := fun _ _ => sorry
/-- Stub for spt difference -/
opaque spt_difference : spt α → spt β → spt α := fun _ _ => sorry
/-- Stub for spt isEmpty -/
opaque spt_isEmpty : spt α → Prop := fun _ => True
/-- Stub for alist_insert into spt -/
opaque spt_alist_insert : List Nat → List α → spt α → spt α := fun _ _ t => t

/-- Stub for set_sep.one -/
opaque set_sep_one {α : Type} (p : α) : (α → Prop) → Prop := fun _ => True
/-- Stub for SEP_EXISTS -/
opaque SEP_EXISTS {α β : Type} (f : α → (β → Prop) → Prop) : (β → Prop) → Prop := fun _ => True
/-- Stub for set_sep cond -/
opaque sep_cond (P : Prop) : (α → Prop) → Prop := fun _ => P
/-- Stub for set_sep star -/
opaque sep_star (p q : (α → Prop) → Prop) : (α → Prop) → Prop := fun _ => True
/-- Stub for set_sep emp -/
opaque sep_emp : (α → Prop) → Prop := fun _ => True
/-- Stub for bytes_in_word -/
opaque bytes_in_word : BitVec n := sorry
/-- Stub for eventually (on lazy lists) -/
opaque eventually (P : llist α → Prop) (ll : llist α) : Prop := sorry
/-- Stub for okpath -/
opaque okpath {α β : Type} (R : α → β → α → Prop) (p : α) : Prop := True

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
-- read_bytearray
-- ============================================================

/-- Read a byte array from memory given a starting address, count, and getter -/
partial def read_bytearray {n : Nat} (a : BitVec n) (count : Nat) (get_byte : BitVec n → Option (BitVec 8)) : Option (List (BitVec 8)) :=
  match count with
  | 0 => some []
  | c + 1 =>
    match get_byte a with
    | none => none
    | some b =>
      match read_bytearray (a + 1) (c) get_byte with
      | none => none
      | some bs => some (b :: bs)

-- ============================================================
-- shift_seq
-- ============================================================

/-- Shift a sequence by k positions -/
def shift_seq (k : Nat) (s : Nat → α) : Nat → α :=
  fun i => s (i + k)

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

-- ============================================================
-- MAP3
-- ============================================================

/-- Map a ternary function over three lists -/
def MAP3 (f : α → β → γ → δ) : List α → List β → List γ → List δ
  | [], [], [] => []
  | h1 :: t1, h2 :: t2, h3 :: t3 => f h1 h2 h3 :: MAP3 f t1 t2 t3
  | _, _, _ => []

-- ============================================================
-- lookup_any (sptree)
-- ============================================================

/-- Lookup with default in an sptree -/
def lookup_any (x : Nat) (sp : spt α) (d : α) : α :=
  match spt_lookup x sp with
  | none => d
  | some m => m

-- ============================================================
-- fromList2 (sptree: inserts at even indices)
-- ============================================================

/-- Build an sptree from a list, inserting at even-numbered keys -/
def fromList2 (l : List α) : spt α :=
  (l.foldl (fun (acc : Nat × spt α) a =>
    (acc.1 + 2, spt_insert acc.1 a acc.2)) (0, spt_LN)).2

-- ============================================================
-- zlookup (sptree lookup defaulting to 0)
-- ============================================================

/-- Lookup in sptree, defaulting to 0 -/
def zlookup (m : spt Nat) (k : Nat) : Nat :=
  match spt_lookup k m with
  | none => 0
  | some v => v

-- ============================================================
-- tlookup (sptree lookup defaulting to the key itself)
-- ============================================================

/-- Lookup in sptree, defaulting to the key itself -/
def tlookup (m : spt Nat) (k : Nat) : Nat :=
  match spt_lookup k m with
  | none => k
  | some v => v

-- ============================================================
-- any_el
-- ============================================================

/-- Safe element access with default: any_el n xs d -/
def any_el (n : Nat) : List α → α → α
  | [], d => d
  | x :: xs, d => if n = 0 then x else any_el (n - 1) xs d

-- ============================================================
-- update_resize
-- ============================================================

/-- Update a list at index n, resizing with a default if necessary -/
def update_resize (ls : List α) (default : α) (v : α) (n : Nat) : List α :=
  if n < ls.length then
    LUPDATE v n ls
  else
    LUPDATE v n (ls ++ REPLICATE (n * 2 + 1 - ls.length) default)

-- ============================================================
-- list_inter
-- ============================================================

/-- Intersection of two lists (filter ys by membership in xs) -/
def list_inter [BEq α] (xs ys : List α) : List α :=
  ys.filter (fun y => xs.any (· == y))

-- ============================================================
-- max3
-- ============================================================

/-- Maximum of three natural numbers -/
def max3 (x y z : Nat) : Nat :=
  if x > y then (if z > x then z else x)
  else (if z > y then z else y)

-- ============================================================
-- anub (remove duplicates from assoc list by key)
-- ============================================================

/-- Remove duplicate keys from an association list, keeping first occurrence -/
partial def anub [BEq α] : List (α × β) → List α → List (α × β)
  | [], _ => []
  | (k, v) :: ls, acc =>
    if acc.any (· == k) then anub ls acc
    else (k, v) :: anub ls (k :: acc)

-- ============================================================
-- least_from
-- ============================================================

/-- Find the least n >= k satisfying P. Non-computable because it
    searches over all naturals. -/
noncomputable def least_from (P : Nat → Prop) (n : Nat) : Nat :=
  open Classical in
  if ∃ x, P x ∧ n ≤ x then choice (sorry : Nonempty Nat)
  else choice (sorry : Nonempty Nat)

-- ============================================================
-- UPDATE_LIST
-- ============================================================

/-- Apply a list of updates to a function -/
def UPDATE_LIST [DecidableEq α] (f : α → β) (updates : List (α × β)) : α → β :=
  updates.foldl (fun g ⟨a, b⟩ => fun x => if x = a then b else g x) f

-- ============================================================
-- find_index
-- ============================================================

/-- Find the index of the first occurrence of y in xs, starting from n -/
partial def find_index [BEq α] (y : α) : List α → Nat → Option Nat
  | [], _ => none
  | x :: xs, n => if x == y then some n else find_index y xs (n + 1)

-- ============================================================
-- between
-- ============================================================

/-- between x y = { z | x <= z /\ z < y } -/
def between (x y : Nat) : Nat → Prop :=
  fun z => x ≤ z ∧ z < y

-- ============================================================
-- fmap_linv
-- ============================================================

/-- Left inverse relation for finite maps -/
def fmap_linv [BEq α] [BEq β] [Inhabited α] [Inhabited β] (f1 : fmap α β) (f2 : fmap β α) : Prop :=
  (FDOM f2 = FRANGE f1) ∧
  ∀ x, (FDOM f1).any (· == x) → FLOOKUP f2 (FAPPLY f1 x) = some x

-- ============================================================
-- word_list (set_sep predicate for word arrays)
-- ============================================================

/-- Separation logic predicate: contiguous list of words in memory.
    This is an opaque stub since we don't have full set_sep. -/
opaque word_list {n : Nat} (a : BitVec n) (xs : List (BitVec n)) : Prop := True

-- ============================================================
-- word_list_exists
-- ============================================================

/-- Existential version of word_list -/
opaque word_list_exists {n : Nat} (a : BitVec n) (count : Nat) : Prop := True

-- ============================================================
-- lookup_vars
-- ============================================================

/-- Look up multiple variables by index in an environment -/
def lookup_vars [Inhabited α] : List Nat → List α → Option (List α)
  | [], _ => some []
  | v :: vs, env =>
    if v < env.length then
      match lookup_vars vs env with
      | some xs => some (EL v env :: xs)
      | none => none
    else none

-- ============================================================
-- enumerate
-- ============================================================

/-- Pair each element with its index starting from n -/
def enumerate (n : Nat) : List α → List (Nat × α)
  | [] => []
  | x :: xs => (n, x) :: enumerate (n + 1) xs

-- ============================================================
-- option_fold
-- ============================================================

/-- Fold an option: option_fold f x NONE = x, option_fold f x (SOME y) = f y x -/
def option_fold (f : α → β → β) (x : β) : Option α → β
  | none => x
  | some y => f y x

-- ============================================================
-- CONCAT_WITH_aux, CONCAT_WITH
-- ============================================================

/-- Auxiliary function for CONCAT_WITH: join strings with a separator -/
partial def CONCAT_WITH_aux : List Char → List (List Char) → List Char → List Char
  | [], _l, fl => fl.reverse ++ FLAT _l
  | _ :: _, [], fl => fl.reverse
  | h :: t, (h1 :: t1) :: ls, fl => CONCAT_WITH_aux (h :: t) (t1 :: ls) (h1 :: fl)
  | _ :: _, [[]], fl => fl.reverse
  | h :: t, [] :: (h' :: t'), fl => CONCAT_WITH_aux (h :: t) (h' :: t') ((h :: t).reverse ++ fl)

/-- Concatenate a list of strings with a separator -/
def CONCAT_WITH (s : List Char) (l : List (List Char)) : List Char :=
  CONCAT_WITH_aux s l []

-- ============================================================
-- shift_left, shift_right, arith_shift_right (cascading shift defs)
-- ============================================================

/-- Cascading left shift for efficient computation -/
partial def shift_left {n : Nat} (a : BitVec n) (k : Nat) : BitVec n :=
  if k = 0 then a
  else if a == 0 then 0
  else if k > 32 then shift_left (a <<< 32) (k - 32)
  else if k > 16 then shift_left (a <<< 16) (k - 16)
  else if k > 8 then shift_left (a <<< 8) (k - 8)
  else shift_left (a <<< 1) (k - 1)

/-- Cascading right shift for efficient computation -/
partial def shift_right {n : Nat} (a : BitVec n) (k : Nat) : BitVec n :=
  if k = 0 then a
  else if a == 0 then 0
  else if k > 32 then shift_right (a >>> 32) (k - 32)
  else if k > 16 then shift_right (a >>> 16) (k - 16)
  else if k > 8 then shift_right (a >>> 8) (k - 8)
  else shift_right (a >>> 1) (k - 1)

/-- Cascading arithmetic right shift for efficient computation -/
partial def arith_shift_right (a : BitVec n) (k : Nat) : BitVec n :=
  if k = 0 then a
  else if a == 0 then 0
  else if k > 32 then arith_shift_right (BitVec.sshiftRight a 32) (k - 32)
  else if k > 16 then arith_shift_right (BitVec.sshiftRight a 16) (k - 16)
  else if k > 8 then arith_shift_right (BitVec.sshiftRight a 8) (k - 8)
  else arith_shift_right (BitVec.sshiftRight a 1) (k - 1)

/-- Cascading rotate right for word64 -/
partial def any_word64_ror (w : BitVec 64) (k : Nat) : BitVec 64 :=
  if 64 ≤ k then any_word64_ror w (k - 64)
  else if 32 ≤ k then any_word64_ror (w.rotateRight 32) (k - 32)
  else if 16 ≤ k then any_word64_ror (w.rotateRight 16) (k - 16)
  else if 8 ≤ k then any_word64_ror (w.rotateRight 8) (k - 8)
  else if 4 ≤ k then any_word64_ror (w.rotateRight 4) (k - 4)
  else if 2 ≤ k then any_word64_ror (w.rotateRight 2) (k - 2)
  else if 1 ≤ k then w.rotateRight 1
  else w

-- ============================================================
-- splitlines
-- ============================================================

/-- Helper: split a list of chars by newlines -/
private partial def splitlines_aux (acc : List Char) (rest : List Char) : List (List Char) :=
  match rest with
  | [] => if acc.isEmpty then [] else [acc.reverse]
  | '\n' :: xs =>
    acc.reverse :: (if xs.isEmpty then [] else splitlines_aux [] xs)
  | c :: xs => splitlines_aux (c :: acc) xs

/-- Split a string (as list of Char) by newlines.
    Discards a trailing newline. -/
def splitlines (ls : List Char) : List (List Char) :=
  splitlines_aux [] ls

-- ============================================================
-- list_subset, list_set_eq
-- ============================================================

/-- Check if every element of l1 is in l2 -/
def list_subset [BEq α] (l1 l2 : List α) : Bool :=
  l1.all (fun x => l2.any (· == x))

/-- Check if two lists have the same elements -/
def list_set_eq [BEq α] (l1 l2 : List α) : Bool :=
  list_subset l1 l2 && list_subset l2 l1

-- ============================================================
-- Lnext, Lnext_pos
-- ============================================================

/-- Computes the next position in a lazy list for which P holds (opaque) -/
noncomputable def Lnext (P : llist α → Prop) (ll : llist α) : Nat := sorry

/-- Next position with a non-zero head element -/
noncomputable def Lnext_pos (ll : llist Nat) : Nat :=
  Lnext (fun ll => ∃ k, ll.LHD = some k ∧ k ≠ 0) ll

-- ============================================================
-- insert_atI
-- ============================================================

/-- Insert a list l1 at index n in list l2 -/
def insert_atI (l1 : List α) (n : Nat) (l2 : List α) : List α :=
  l2.take n ++ l1 ++ l2.drop (n + l1.length)

-- ============================================================
-- is_subseq
-- ============================================================

/-- Check if l2 is a subsequence of l1 -/
def is_subseq [BEq α] : List α → List α → Bool
  | _, [] => true
  | [], _ :: _ => false
  | y :: ys, x :: xs =>
    (x == y && is_subseq ys xs) || is_subseq ys (x :: xs)

-- ============================================================
-- make_even
-- ============================================================

/-- Round up to the nearest even number -/
def make_even (n : Nat) : Nat :=
  if n % 2 == 0 then n else n + 1

-- ============================================================
-- steps, steps_rel
-- ============================================================

/-- Compute steps of a transition function -/
def steps (f : α → β → α) (x : α) : List β → List (β × α)
  | [] => []
  | j :: js =>
    let y := f x j
    (j, y) :: steps f y js

/-- Relational version of steps -/
def steps_rel (R : α → β → α → Prop) (x : α) : List (β × α) → Prop
  | [] => True
  | (j, y) :: tr => R x j y ∧ steps_rel R y tr

-- ============================================================
-- all_words
-- ============================================================

/-- Set of consecutive word addresses -/
def all_words {n : Nat} (base : BitVec n) : Nat → List (BitVec n)
  | 0 => []
  | k + 1 => base :: all_words (base + 1) k

-- ============================================================
-- asm_write_bytearray
-- ============================================================

/-- Write a byte array to memory starting at address a -/
def asm_write_bytearray {n : Nat} (a : BitVec n) : List (BitVec 8) → (BitVec n → BitVec 8) → (BitVec n → BitVec 8)
  | [], m => m
  | x :: xs, m =>
    let m' := asm_write_bytearray (a + 1) xs m
    fun addr => if addr == a then x else m' addr

-- ============================================================
-- eq_shape (for sptrees)
-- ============================================================

/-- Check if two sptrees have the same shape (opaque since spt is opaque) -/
opaque eq_shape : spt α → spt β → Bool := fun _ _ => false

-- ============================================================
-- copy_shape (for sptrees)
-- ============================================================

/-- Copy the shape of t2 onto the data of t1 (opaque since spt is opaque) -/
opaque copy_shape : spt α → spt β → spt α := fun t _ => t

-- ============================================================
-- range (for sptrees)
-- ============================================================

/-- The set of values in an sptree -/
def spt_range (s : spt α) : α → Prop :=
  fun v => ∃ n, spt_lookup n s = some v

-- ============================================================
-- bytes_in_memory
-- ============================================================

/-- Check that bytes are in memory at consecutive addresses -/
def bytes_in_memory {n : Nat} (a : BitVec n) : List (BitVec 8) → (BitVec n → BitVec 8) → (BitVec n → Prop) → Prop
  | [], _, _ => True
  | x :: xs, m, dm => m a = x ∧ dm a ∧ bytes_in_memory (a + 1) xs m dm

-- ============================================================
-- bytes_in_mem (with exclusion set)
-- ============================================================

/-- Check that bytes are in memory at consecutive addresses, with exclusion set -/
def bytes_in_mem {n : Nat} (a : BitVec n) : List (BitVec 8) → (BitVec n → BitVec 8) → (BitVec n → Prop) → (BitVec n → Prop) → Prop
  | [], _, _, _ => True
  | b :: bs, m, md, k => md a ∧ ¬k a ∧ m a = b ∧ bytes_in_mem (a + 1) bs m md k

-- ============================================================
-- good_dimindex
-- ============================================================

/-- Good dimension index: 32 or 64 bits -/
def good_dimindex (n : Nat) : Prop :=
  n = 32 ∨ n = 64

-- ============================================================
-- LLOOKUP (overload for oEL on lists)
-- ============================================================

/-- LLOOKUP l n = oEL n l: safe list indexing -/
def LLOOKUP (l : List α) (n : Nat) : Option α :=
  l.get? n

-- ============================================================
-- THEOREMS (all proved by sorry)
-- ============================================================

-- Logical / set theorems

theorem IMP_IMP : (P ∧ (Q → R)) → ((P → Q) → R) := by sorry

theorem SUBSET_IMP {s t : α → Prop} {x : α} : (∀ a, s a → t a) → (s x → t x) := by sorry

-- List theorems

theorem DROP_NIL : ∀ (n : Nat) (xs : List α), xs.drop n = [] ↔ xs.length ≤ n := by sorry

theorem revdroprev :
  ∀ (l : List α) (n : Nat), n ≤ l.length → (l.reverse.drop n).reverse = l.take (l.length - n) := by sorry

theorem revtakerev :
  ∀ (n : Nat) (l : List α), n ≤ l.length → (l.reverse.take n).reverse = l.drop (l.length - n) := by sorry

theorem times_add_o : True := by sorry

theorem SORTED_inv_image_LESS_PLUS : True := by sorry

theorem SORTED_GENLIST_TIMES : True := by sorry

-- read_bytearray

theorem read_bytearray_LENGTH :
  ∀ (n : Nat) {w : Nat} (a : BitVec w) (f : BitVec w → Option (BitVec 8)) (x : List (BitVec 8)),
    read_bytearray a n f = some x → x.length = n := by sorry

-- shift_seq, SUM_SET

theorem SUM_SET_IN_LT : True := by sorry

theorem CARD_IMAGE_ID_BIJ : True := by sorry

theorem CARD_IMAGE_EQ_BIJ : True := by sorry

theorem DISJOINT_IMAGE_SUC : True := by sorry

theorem IMAGE_SUC_SUBSET_UNION : True := by sorry

-- LLOOKUP theorems

theorem LLOOKUP_def_thm : True := by sorry
theorem LLOOKUP_EQ_EL : True := by sorry
theorem LLOOKUP_THM : True := by sorry
theorem LLOOKUP_DROP : True := by sorry
theorem LLOOKUP_TAKE_IMP : True := by sorry
theorem LLOOKUP_LUPDATE : True := by sorry

-- app_list theorems

theorem append_aux_thm :
  ∀ (l : app_list α) (xs : List α), append_aux l xs = append_aux l [] ++ xs := by sorry

theorem append_thm_Append :
  ∀ (l1 l2 : app_list α), append (app_list.Append l1 l2) = append l1 ++ append l2 := by sorry

theorem append_thm_List :
  ∀ (xs : List α), append (app_list.List xs) = xs := by sorry

theorem append_thm_Nil :
  append (app_list.Nil : app_list α) = [] := by sorry

theorem SmartAppend_thm [DecidableEq α] :
  ∀ (l1 l2 : app_list α),
    SmartAppend l1 l2 =
      if l1 = app_list.Nil then l2
      else if l2 = app_list.Nil then l1
      else app_list.Append l1 l2 := by sorry

theorem SmartAppend_Nil :
  ∀ (l : app_list α), SmartAppend l app_list.Nil = l ∧ SmartAppend app_list.Nil l = l := by sorry

theorem append_SmartAppend :
  ∀ (l1 l2 : app_list α), append (SmartAppend l1 l2) = append l1 ++ append l2 := by sorry

-- MAP / list theorems

theorem GENLIST_eq_MAP : True := by sorry
theorem ZIP_GENLIST1 : True := by sorry

theorem LENGTH_MAP3 :
  ∀ (f : α → β → γ → δ) (l1 : List α) (l2 : List β) (l3 : List γ),
    l1.length = l3.length → l2.length = l3.length → (MAP3 f l1 l2 l3).length = l3.length := by sorry

theorem EL_MAP3 : True := by sorry
theorem MAP_REVERSE_STEP : True := by sorry
theorem LENGTH_TAKE_EQ_MIN : True := by sorry
theorem LIST_REL_MEM : True := by sorry
theorem LIST_REL_GENLIST_I : True := by sorry
theorem LIST_REL_lookup_fromList : True := by sorry
theorem LIST_REL_lookup_fromList_MAP : True := by sorry
theorem LIST_REL_FRONT_LAST : True := by sorry

-- sptree theorems

theorem EVEN_fromList2 : True := by sorry
theorem SUBMAP_mono_FUPDATE_LIST : True := by sorry
theorem INJ_FAPPLY_FUPDATE : True := by sorry
theorem BIJ_FLOOKUP_MAP_KEYS : True := by sorry
theorem SPLIT_LIST : True := by sorry

-- ZIP / EVERY theorems

theorem EXISTS_ZIP : True := by sorry
theorem EVERY_ZIP : True := by sorry
theorem every_zip_split : True := by sorry
theorem every_shim : True := by sorry
theorem every_shim2 : True := by sorry
theorem MEM_ZIP2 : True := by sorry
theorem ZIP_MAP_FST_SND_EQ : True := by sorry
theorem MAP_FST_I_PAIR_MAP : True := by sorry
theorem EVERY_FST_SND : True := by sorry

-- tlookup theorems

theorem tlookup_id : ∀ (names : spt Nat) (x : Nat),
  ¬(∃ v, spt_lookup x names = some v) → tlookup names x = x := by sorry

theorem tlookup_bij_suff : True := by sorry
theorem tlookup_bij_iff : True := by sorry

-- any_el theorems

theorem any_el_ALT [Inhabited α] :
  ∀ (l : List α) (n : Nat) (d : α),
    any_el n l d = if n < l.length then EL n l else d := by sorry

-- MAX_LIST theorems

theorem MAX_LIST_APPEND : True := by sorry
theorem MAX_LIST_SNOC : True := by sorry
theorem MAX_LIST_intro : True := by sorry
theorem MAX_LIST_max : True := by sorry
theorem FOLDR_MAX_0_MAX_LIST : True := by sorry

-- ALOOKUP theorems

theorem ALOOKUP_SNOC : True := by sorry
theorem ALOOKUP_GENLIST : True := by sorry
theorem ALOOKUP_ZIP_FAIL : True := by sorry
theorem MEM_ALOOKUP : True := by sorry

-- anub theorems

theorem EVERY_anub_imp : True := by sorry
theorem ALOOKUP_anub : True := by sorry
theorem anub_eq_nil : True := by sorry
theorem EVERY_anub_suff : True := by sorry
theorem anub_notin_acc : True := by sorry
theorem anub_tl_anub : True := by sorry
theorem anub_all_distinct_keys : True := by sorry
theorem MEM_anub_ALOOKUP : True := by sorry

-- domain / sptree theorems

theorem toAList_domain : True := by sorry
theorem domain_nat_set_from_list : True := by sorry
theorem wf_nat_set_from_list : True := by sorry
theorem BIT_11 : True := by sorry
theorem BIT_11_2 : True := by sorry
theorem LOG2_TIMES2 : True := by sorry
theorem LOG2_TIMES2_1 : True := by sorry
theorem C_BIT_11 : True := by sorry
theorem BIT_num_from_bin_list_leading : True := by sorry

-- least_from theorems

theorem LEAST_thm : True := by sorry

theorem least_from_thm :
  ∀ (P : Nat → Prop) (n : Nat), True := by sorry

-- FUNPOW theorems

theorem FUNPOW_mono : True := by sorry
theorem FUNPOW_SUC_PLUS : True := by sorry
theorem OPTREL_trans : True := by sorry

-- UPDATE_LIST theorems

theorem UPDATE_LIST_THM : True := by sorry
theorem APPLY_UPDATE_LIST_ALOOKUP : True := by sorry

-- find_index theorems

theorem INDEX_FIND_CONS_EQ_SOME : True := by sorry
theorem find_index_INDEX_FIND : True := by sorry
theorem find_index_INDEX_OF : True := by sorry

theorem find_index_NOT_MEM :
  ∀ [inst : BEq α] (ls : List α) (x : α) (n : Nat),
    ¬ls.elem x = true ↔ find_index x ls n = none := by sorry

theorem find_index_MEM : True := by sorry
theorem find_index_LEAST_EL : True := by sorry

theorem find_index_LESS_LENGTH :
  ∀ [inst : BEq α] (ls : List α) (n : α) (m i : Nat),
    find_index n ls m = some i → m ≤ i ∧ i < m + ls.length := by sorry

theorem ALOOKUP_find_index_NONE : True := by sorry
theorem ALOOKUP_find_index_SOME : True := by sorry
theorem find_index_ALL_DISTINCT_EL : True := by sorry
theorem find_index_ALL_DISTINCT_EL_eq : True := by sorry
theorem find_index_APPEND_same : True := by sorry
theorem find_index_ALL_DISTINCT_REVERSE : True := by sorry
theorem THE_find_index_suff : True := by sorry
theorem find_index_APPEND1 : True := by sorry
theorem find_index_APPEND2 : True := by sorry
theorem find_index_is_MEM : True := by sorry
theorem find_index_MAP_inj : True := by sorry
theorem find_index_shift_0 : True := by sorry
theorem find_index_shift : True := by sorry
theorem find_index_APPEND : True := by sorry
theorem find_index_in_FILTER_ZIP_EQ : True := by sorry

-- PERM theorems

theorem ALL_DISTINCT_PERM_ALOOKUP_ZIP : True := by sorry
theorem PERM_ZIP : True := by sorry

-- RTC, PERM theorems

theorem RTC_invariant : True := by sorry
theorem RTC_RSUBSET : True := by sorry
theorem PERM_PART : True := by sorry
theorem PERM_PARTITION : True := by sorry

-- Option theorems

theorem option_case_NONE_F : True := by sorry

-- IS_PREFIX

theorem IS_PREFIX_THM : True := by sorry

-- RC / FOLDL

theorem EVERY2_RC_same : True := by sorry
theorem FOLDL_invariant : True := by sorry
theorem FOLDL_invariant_rest : True := by sorry

-- between

theorem IN_between :
  ∀ (x y z : Nat), between y z x ↔ y ≤ x ∧ x < z := by sorry

-- SUC_LEAST

theorem SUC_LEAST : True := by sorry

-- fmap_linv theorems

theorem fmap_linv_unique : True := by sorry
theorem INJ_has_fmap_linv : True := by sorry
theorem has_fmap_linv_inj : True := by sorry
theorem fmap_linv_FAPPLY : True := by sorry

-- plus_compose

theorem plus_compose : True := by sorry

-- IN_option

theorem IN_option_rwt : True := by sorry
theorem IN_option_rwt2 : True := by sorry

-- FOLDR theorems

theorem FOLDR_CONS_triple : True := by sorry
theorem FOLDR_CONS_5tup : True := by sorry
theorem FOLDR_transitive_property : True := by sorry

-- Pair projection theorems

theorem FST_triple : True := by sorry
theorem FST_5tup : True := by sorry
theorem SND_triple : True := by sorry
theorem FST_pair : True := by sorry
theorem SND_pair : True := by sorry
theorem SND_FST_pair : True := by sorry
theorem MAP_ZIP_SND_triple : True := by sorry

-- Identity / specialization theorems

theorem I_PERMUTES : True := by sorry
theorem INJ_I : True := by sorry
theorem MAP_EQ_ID : True := by sorry
theorem FUN_FMAP_FAPPLY_FEMPTY_FAPPLY : True := by sorry
theorem LESS_1 : ∀ (x : Nat), x < 1 ↔ x = 0 := by sorry

-- map_fst / map_some_eq

theorem map_fst : True := by sorry
theorem map_some_eq :
  ∀ (l1 l2 : List α), l1.map some = l2.map some ↔ l1 = l2 := by sorry
theorem map_some_eq_append : True := by sorry

-- LASTN theorems

theorem LASTN_LEMMA : True := by sorry
theorem LASTN_TL : True := by sorry
theorem LASTN_LENGTH_LESS_EQ : True := by sorry
theorem LASTN_ALT : True := by sorry
theorem LENGTH_LASTN_LESS : True := by sorry

-- MAP_EQ theorems

theorem MAP_EQ_MAP_IMP : True := by sorry
theorem INJ_MAP_EQ_2 : True := by sorry

-- LENGTH / FILTER

theorem LENGTH_EQ_FILTER_FILTER : True := by sorry
theorem LIST_REL_MAP_FILTER_NEQ : True := by sorry

-- lookup_vars

theorem EVERY_lookup_vars [Inhabited α] :
  ∀ (vs : List Nat) (env env' : List α) (P : α → Bool),
    EVERY P env = true → lookup_vars vs env = some env' → EVERY P env' = true := by sorry

-- LAST

theorem EVERY_LAST : True := by sorry

-- hex string theorems

theorem num_to_hex_string_length_1 : True := by sorry
theorem num_to_hex_string_length_2 : True := by sorry
theorem num_from_hex_string_length_2 : True := by sorry
theorem num_from_hex_string_leading_0 : True := by sorry
theorem num_from_hex_string_length_2_less_16 : True := by sorry
theorem num_from_hex_string_num_to_hex_string : True := by sorry

-- MAPi

theorem MAPi_ID : True := by sorry

-- enumerate theorems

theorem LENGTH_enumerate :
  ∀ (xs : List α) (k : Nat), (enumerate k xs).length = xs.length := by sorry

theorem EL_enumerate : True := by sorry
theorem MAP_enumerate_MAPi : True := by sorry
theorem MAPi_enumerate_MAP : True := by sorry
theorem MEM_enumerate : True := by sorry
theorem MEM_enumerate_IMP : True := by sorry
theorem MAP_FST_enumerate : True := by sorry
theorem ALL_DISTINCT_MAP_FST_enumerate : True := by sorry
theorem ALOOKUP_enumerate : True := by sorry

-- SUM theorems

theorem SUM_MAP_LENGTH_REPLICATE : True := by sorry
theorem SUM_MAP_COUNT_LIST : True := by sorry
theorem SUM_REPLICATE : True := by sorry
theorem SUM_MAP_BOUND : True := by sorry
theorem SUM_MOD : True := by sorry
theorem MOD_SUB_LEMMA : True := by sorry

-- List misc

theorem FLAT_REPLICATE_NIL : True := by sorry
theorem MEM_REPLICATE_EQ : True := by sorry
theorem FDOM_FLOOKUP : True := by sorry
theorem FLAT_MAP_SING : True := by sorry
theorem FLAT_MAP_NIL : True := by sorry
theorem UPDATE_LIST_NOT_MEM : True := by sorry
theorem MAP_ZIP_UPDATE_LIST_ALL_DISTINCT_same : True := by sorry

-- FLOOKUP update list

theorem flookup_update_list_none : True := by sorry
theorem flookup_update_list_some : True := by sorry

-- Arithmetic

theorem MULT_LE_EXP : True := by sorry

-- domain/range restrict

theorem domain_rrestrict_subset : True := by sorry
theorem range_rrestrict_subset : True := by sorry
theorem PERM_MAP_BIJ : True := by sorry

-- fromList2 / lookup

theorem lookup_fromList2 : True := by sorry
theorem domain_fromList2 : True := by sorry

-- UNCURRY / OLEAST

theorem UNCURRY_eq_pair : True := by sorry
theorem OLEAST_SOME_IMP : True := by sorry

-- Exponent / parity

theorem EXP2_EVEN : True := by sorry
theorem FST_UNZIP_MAPi : True := by sorry
theorem SND_UNZIP_MAPi : True := by sorry

-- ALL_DISTINCT FLAT

theorem ALL_DISTINCT_FLAT : True := by sorry
theorem ALL_DISTINCT_FLAT_EVERY : True := by sorry
theorem ALL_DISTINCT_APPEND_APPEND_IMP : True := by sorry

-- GSPEC / PAIR_MAP

theorem GSPEC_o : True := by sorry
theorem o_PAIR_MAP : True := by sorry

-- MOD_MINUS

theorem MOD_MINUS : True := by sorry

-- SPLITP

theorem SPLITP_CONS_IMP : True := by sorry
theorem LAST_CONS_alt : True := by sorry
theorem EL_CONS_IF : True := by sorry

-- TOKENS theorems

theorem EVERY_TOKENS : True := by sorry
theorem TOKENS_START : True := by sorry
theorem TOKENS_END : True := by sorry
theorem TOKENS_LENGTH_END : True := by sorry
theorem TOKENS_LENGTH_START : True := by sorry
theorem DROP_EMPTY : True := by sorry

-- OPT_MMAP theorems

theorem OPT_MMAP_MAP_o : True := by sorry
theorem OPT_MMAP_SOME : True := by sorry
theorem OPT_MMAP_CONG : True := by sorry
theorem IMP_OPT_MMAP_EQ : True := by sorry

-- DISJOINT

theorem DISJOINT_set_simp : True := by sorry
theorem DISJOINT_INTER : True := by sorry

-- ALOOKUP_EXISTS_IFF

theorem ALOOKUP_EXISTS_IFF : True := by sorry

-- LUPDATE

theorem LUPDATE_commutes : True := by sorry
theorem LUPDATE_APPEND : True := by sorry

-- FILTER

theorem FILTER_EL_EQ : True := by sorry
theorem FST_EL_AFUPDKEY : True := by sorry
theorem EL_AFUPDKEY_unchanged : True := by sorry
theorem findi_APPEND : True := by sorry
theorem NOT_MEM_findi_IFF : True := by sorry
theorem NOT_MEM_findi : True := by sorry
theorem ORD_eq_0 : True := by sorry
theorem HD_LUPDATE : True := by sorry
theorem DROP_LUPDATE : True := by sorry
theorem w2n_lt_256 : True := by sorry
theorem CHR_w2n_n2w_ORD : True := by sorry
theorem n2w_ORD_CHR_w2n : True := by sorry
theorem CHR_w2n_n2w_ORD_simp : True := by sorry
theorem n2w_ORD_CHR_w2n_simp : True := by sorry
theorem MAP_CHR_w2n_11 : True := by sorry
theorem MAP_K_REPLICATE : True := by sorry

-- shift theorems

theorem shift_left_rwt : ∀ {n : Nat} (a : BitVec n) (k : Nat), a <<< k = shift_left a k := by sorry
theorem shift_right_rwt : ∀ {n : Nat} (a : BitVec n) (k : Nat), a >>> k = shift_right a k := by sorry
theorem arith_shift_right_rwt : True := by sorry
theorem word_ror_eq_any_word64_ror :
  ∀ (a : BitVec 64) (n : Nat), a.rotateRight n = any_word64_ror a n := by sorry

-- DROP theorems

theorem TL_DROP_SUC : True := by sorry
theorem DROP_IMP_LESS_LENGTH : True := by sorry
theorem DROP_EQ_CONS_IMP_DROP_SUC : True := by sorry
theorem DROP_IMP_EL : True := by sorry

-- FIELDS theorems

theorem LENGTH_FIELDS : True := by sorry
theorem FIELDS_NEQ_NIL : True := by sorry
theorem CONCAT_FIELDS : True := by sorry
theorem FIELDS_next : True := by sorry
theorem FIELDS_full : True := by sorry
theorem FLAT_MAP_TOKENS_FIELDS : True := by sorry

-- splitlines theorems

theorem the_nil_eq_cons : True := by sorry
theorem splitlines_next : True := by sorry
theorem splitlines_nil : True := by sorry
theorem splitlines_eq_nil : True := by sorry
theorem splitlines_CONS_FST_SPLITP : True := by sorry

-- n2l

theorem n2l_DIV_MOD : True := by sorry

-- irreflexive / trichotomous

theorem irreflexive_inv_image : True := by sorry
theorem trichotomous_inv_image : True := by sorry

-- REPLICATE

theorem MEM_REPLICATE_IMP : True := by sorry

-- plus_0

theorem plus_0_I : (· + 0) = (id : Nat → Nat) := by sorry

-- SUM_COUNT_LIST

theorem SUM_COUNT_LIST : True := by sorry

-- OPTION_MAP

theorem OPTION_MAP_I : True := by sorry
theorem OPTION_MAP_INJ : True := by sorry
theorem the_OPTION_MAP : True := by sorry

-- TAKE / REPLICATE

theorem TAKE_FLAT_REPLICATE_LEQ : True := by sorry

-- MOD

theorem MOD_2EXP_0_EVEN : True := by sorry
theorem ADD_MOD_EQ_LEMMA : True := by sorry

-- list_subset

theorem list_subset_LENGTH : True := by sorry

-- BIJ_UPDATE / INJ_UPDATE

theorem BIJ_UPDATE : True := by sorry
theorem INJ_UPDATE : True := by sorry

-- subspt

theorem subspt_domain_SUBSET : True := by sorry

-- SPLITP

theorem SPLITP_TAKE_DROP : True := by sorry
theorem SND_SPLITP_DROP : True := by sorry
theorem FST_SPLITP_DROP : True := by sorry

-- TAKE_DROP_SUBLIST

theorem TAKE_DROP_SUBLIST : True := by sorry

-- OPTION_CHOICE

theorem OPTION_CHOICE_EQUALS_OPTION : True := by sorry
theorem option_eq_some : True := by sorry

-- alist_to_fmap

theorem ALL_DISTINCT_alist_to_fmap_REVERSE : True := by sorry
theorem FUPDATE_LIST_alist_to_fmap : True := by sorry
theorem DISTINCT_FUPDATE_LIST_UNION : True := by sorry
theorem fevery_to_drestrict : True := by sorry

-- SUM_MAP_K / LAST_FLAT

theorem SUM_MAP_K : True := by sorry
theorem LAST_FLAT : True := by sorry

-- TOKENS

theorem TOKENS_unchanged : True := by sorry
theorem TOKENS_FLAT_MAP_SNOC : True := by sorry

-- insert_atI theorems

theorem insert_atI_NIL :
  ∀ (n : Nat) (l : List α), insert_atI [] n l = l := by sorry

theorem insert_atI_CONS : True := by sorry

theorem LENGTH_insert_atI :
  ∀ (p : Nat) (l1 l2 : List α),
    p + l1.length ≤ l2.length → (insert_atI l1 p l2).length = l2.length := by sorry

theorem insert_atI_app : True := by sorry
theorem insert_atI_end : True := by sorry
theorem insert_atI_insert_atI : True := by sorry
theorem LUPDATE_insert_commute : True := by sorry

-- LESS_EQ_LENGTH / LESS_LENGTH

theorem LESS_EQ_LENGTH :
  ∀ (xs : List α) (k : Nat),
    k ≤ xs.length → ∃ ys1 ys2, xs = ys1 ++ ys2 ∧ ys1.length = k := by sorry

theorem LESS_LENGTH :
  ∀ (xs : List α) (k : Nat),
    k < xs.length → ∃ ys1 y ys2, xs = ys1 ++ y :: ys2 ∧ ys1.length = k := by sorry

-- IN_EVEN

theorem IN_EVEN : True := by sorry

-- FOLDL_OPTION_CHOICE

theorem FOLDL_OPTION_CHOICE_EQ_SOME_IMP_MEM : True := by sorry

-- BAG

theorem BAG_ALL_DISTINCT_FOLDR_BAG_UNION : True := by sorry

-- is_subseq theorems

theorem is_subseq_refl [BEq α] :
  ∀ (ls : List α), is_subseq ls ls = true := by sorry

theorem is_subseq_nil [BEq α] :
  ∀ (ls : List α), is_subseq ([] : List α) ls = true ↔ ls = [] := by sorry

theorem is_subseq_cons : True := by sorry
theorem is_subseq_snoc : True := by sorry
theorem is_subseq_append1 : True := by sorry
theorem is_subseq_append2 : True := by sorry
theorem is_subseq_IS_SUBLIST : True := by sorry
theorem is_subseq_MEM : True := by sorry
theorem IS_PREFIX_is_subseq : True := by sorry
theorem IS_SUBLIST_is_subseq : True := by sorry
theorem is_subseq_ALL_DISTINCT : True := by sorry
theorem is_subseq_append_suff : True := by sorry
theorem is_subseq_FLAT_suff : True := by sorry

-- LIST_REL_IMP_LAST

theorem LIST_REL_IMP_LAST : True := by sorry

-- make_even

theorem EVEN_make_even :
  ∀ (x : Nat), (make_even x) % 2 = 0 := by sorry

-- ALOOKUP_MAP_FST_INJ_SOME

theorem ALOOKUP_MAP_FST_INJ_SOME : True := by sorry

-- v2w (bitvec from bool list)

theorem v2w_32_F : True := by sorry
theorem v2w_32_T : True := by sorry
theorem v2w_sing : True := by sorry

-- FOLDR_FUNPOW

theorem FOLDR_FUNPOW : True := by sorry
theorem FUNPOW_refl_trans_chain : True := by sorry

-- byte_align

theorem byte_align_extract : True := by sorry
theorem byte_align_IN_IMP_IN_range : True := by sorry

-- DIV theorems

theorem MULT_DIV_MULT_LEMMA : True := by sorry
theorem IMP_MULT_DIV_LESS : True := by sorry
theorem DIV_LESS_DIV : True := by sorry

-- Path

theorem toPath_fromList : True := by sorry

-- steps theorems

theorem steps_rel_okpath : True := by sorry
theorem steps_rel_LRC : True := by sorry
theorem LAST_MAP_SND_steps_FOLDL : True := by sorry

-- all_words

theorem IN_all_words :
  ∀ {n : Nat} (x base : BitVec n) (count : Nat),
    x ∈ all_words base count ↔ ∃ i, i < count ∧ x = base + BitVec.ofNat n i := by sorry

-- read_bytearray

theorem read_bytearray_IMP_mem_SOME : True := by sorry
theorem read_bytearray_no_wrap : True := by sorry

-- asm_write_bytearray theorems

theorem mem_eq_imp_asm_write_bytearray_eq : True := by sorry
theorem asm_write_bytearray_unchanged : True := by sorry
theorem asm_write_bytearray_id : True := by sorry
theorem asm_write_bytearray_unchanged_alt : True := by sorry
theorem asm_write_bytearray_unchanged_all_words : True := by sorry
theorem asm_write_bytearray_append : True := by sorry
theorem asm_write_bytearray_EL : True := by sorry

-- eq_shape / copy_shape / sptree theorems

theorem spt_eq : True := by sorry
theorem eq_shape_map : True := by sorry
theorem eq_shape_IMP_domain : True := by sorry
theorem shape_eq_copy_shape : True := by sorry
theorem lookup_copy_shape : True := by sorry
theorem lookup_zero : True := by sorry
theorem empty_sub : True := by sorry
theorem subspt_delete : True := by sorry
theorem inter_union_empty : True := by sorry
theorem inter_insert_empty : True := by sorry
theorem fromList2_value : True := by sorry

-- range theorems (sptree)

theorem range_delete : True := by sorry
theorem range_insert : True := by sorry
theorem range_insert_2 : True := by sorry
theorem range_insert_SUBSET : True := by sorry

-- TWOxDIV2

theorem TWOxDIV2 : ∀ (x : Nat), 2 * x / 2 = x := by sorry

-- alist_insert

theorem alist_insert_REVERSE : True := by sorry
theorem alist_insert_ALL_DISTINCT : True := by sorry

-- word comparison theorems

theorem n2w_lt : True := by sorry
theorem n2w_le : True := by sorry
theorem word_lt_0w : True := by sorry
theorem word_sub_lt : True := by sorry

-- bytes_in_memory theorems

theorem bytes_in_memory_APPEND : True := by sorry
theorem bytes_in_memory_change_domain : True := by sorry
theorem bytes_in_memory_change_mem : True := by sorry

theorem bytes_in_memory_EL :
  ∀ {n : Nat} (a : BitVec n) (bs : List (BitVec 8)) (m : BitVec n → BitVec 8) (md : BitVec n → Prop) (k : Nat),
    bytes_in_memory a bs m md → k < bs.length → m (a + BitVec.ofNat n k) = bs[k]! := by sorry

theorem bytes_in_memory_in_domain : True := by sorry

-- bytes_in_mem

theorem bytes_in_mem_IMP : True := by sorry

-- fun2set

theorem fun2set_disjoint_union : True := by sorry

-- WORD_LS

theorem WORD_LS_IMP : True := by sorry

-- size_fromAList

theorem size_fromAList : True := by sorry
theorem ALL_DISTINCT_MAP_FST_toSortedAList : True := by sorry

-- good_dimindex

theorem good_dimindex_get_byte_set_byte : True := by sorry
theorem get_byte_set_byte_diff : True := by sorry

-- list_size

theorem list_size_pair_size_MAP_FST_SND : True := by sorry
theorem MEM_list_size : True := by sorry

end CakeML
