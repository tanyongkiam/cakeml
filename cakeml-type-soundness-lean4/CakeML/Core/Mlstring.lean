/-
  Pure functions for the String module.
  Translated from: hol4_sources/mlstringScript.sml
-/
import CakeML.Lib.HOL4Prelude
import CakeML.Core.Mllist

namespace CakeML

open HOL4

/-- mlstring wraps a char list (HOL4: mlstring = strlit string where string = char list) -/
inductive mlstring where
  | strlit : List Char → mlstring
deriving Repr, BEq, Inhabited, DecidableEq

namespace mlstring

def implode (s : List Char) : mlstring := mlstring.strlit s

def strlen : mlstring → Nat
  | strlit s => s.length

def strsub : mlstring → Nat → Char
  | strlit s, n => s.getD n default

def explode : mlstring → List Char
  | strlit s => s

def substring : mlstring → Nat → Nat → mlstring
  | strlit s, off, len =>
    if off + len ≤ s.length then strlit (s.drop off |>.take len)
    else if off ≤ s.length then strlit (s.drop off)
    else strlit []

def concat (l : List mlstring) : mlstring :=
  strlit (l.bind (fun s => s.explode))

def explode_aux : mlstring → Nat → Nat → List Char
  | _, _, 0 => []
  | s, n, len + 1 => strsub s n :: explode_aux s (n + 1) len

def extract (s : mlstring) (i : Nat) (opt : Option Nat) : mlstring :=
  if strlen s ≤ i then implode []
  else match opt with
    | some x => substring s i (min (strlen s - i) x)
    | none => substring s i (strlen s - i)

def strcat (s1 s2 : mlstring) : mlstring := concat [s1, s2]

partial def concatWith_aux : mlstring → List mlstring → Bool → mlstring
  | _, [], _ => implode []
  | s, h :: t, true => strcat h (concatWith_aux s t false)
  | s, l, false => strcat s (concatWith_aux s l true)

def concatWith (s : mlstring) (l : List mlstring) : mlstring :=
  concatWith_aux s l true

def str (c : Char) : mlstring := implode [c]

def translate_aux (f : Char → Char) (s : mlstring) : Nat → Nat → List Char
  | _, 0 => []
  | n, len + 1 => f (strsub s n) :: translate_aux f s (n + 1) len

def translate (f : Char → Char) (s : mlstring) : mlstring :=
  implode (translate_aux f s 0 (strlen s))

partial def splitl_aux (P : Char → Bool) (s : mlstring) (i : Nat) : mlstring × mlstring :=
  if i < strlen s && P (strsub s i) then
    splitl_aux P s (i + 1)
  else (extract s 0 (some i), extract s i none)

def splitl (P : Char → Bool) (s : mlstring) : mlstring × mlstring :=
  splitl_aux P s 0

partial def tokens_aux (f : Char → Bool) (s : mlstring) :
    List Char → Nat → Nat → List mlstring
  | [], _, 0 => []
  | h :: t, _, 0 => [implode (h :: t).reverse]
  | [], n, len + 1 =>
    if f (strsub s n) then tokens_aux f s [] (n + 1) len
    else tokens_aux f s [strsub s n] (n + 1) len
  | h :: t, n, len + 1 =>
    if f (strsub s n) then
      implode (h :: t).reverse :: tokens_aux f s [] (n + 1) len
    else tokens_aux f s (strsub s n :: h :: t) (n + 1) len

def tokens (f : Char → Bool) (s : mlstring) : List mlstring :=
  tokens_aux f s [] 0 (strlen s)

partial def fields_aux (f : Char → Bool) (s : mlstring) :
    List Char → Nat → Nat → List mlstring
  | ss, _, 0 => [implode ss.reverse]
  | ss, n, len + 1 =>
    if f (strsub s n) then
      implode ss.reverse :: fields_aux f s [] (n + 1) len
    else fields_aux f s (strsub s n :: ss) (n + 1) len

def fields (f : Char → Bool) (s : mlstring) : List mlstring :=
  fields_aux f s [] 0 (strlen s)

partial def str_findi (P : Char → Bool) (i : Nat) (s : mlstring) : Option Nat :=
  if i < strlen s then
    if P (strsub s i) then some i
    else str_findi P (i + 1) s
  else none

def isStringThere_aux (s1 s2 : mlstring) : Nat → Nat → Nat → Bool
  | _, _, 0 => true
  | s1i, s2i, len + 1 =>
    if strsub s1 s1i == strsub s2 s2i then
      isStringThere_aux s1 s2 (s1i + 1) (s2i + 1) len
    else false

def isPrefix (s1 s2 : mlstring) : Bool :=
  if strlen s1 ≤ strlen s2 then isStringThere_aux s1 s2 0 0 (strlen s1)
  else false

def isSuffix (s1 s2 : mlstring) : Bool :=
  if strlen s1 ≤ strlen s2 then
    isStringThere_aux s1 s2 0 (strlen s2 - strlen s1) (strlen s1)
  else false

partial def isSubstring_aux (s1 s2 : mlstring) (lens1 : Nat) :
    Nat → Nat → Bool
  | _, 0 => false
  | n, len + 1 =>
    if isStringThere_aux s1 s2 0 n lens1 then true
    else isSubstring_aux s1 s2 lens1 (n + 1) len

def isSubstring (s1 s2 : mlstring) : Bool :=
  if strlen s1 ≤ strlen s2 then
    isSubstring_aux s1 s2 (strlen s1) 0 (strlen s2 - strlen s1 + 1)
  else false

partial def compare_aux (s1 s2 : mlstring) (ord : Ordering) (start len : Nat) : Ordering :=
  if len == 0 then ord
  else if strsub s2 start < strsub s1 start then .gt
  else if strsub s1 start < strsub s2 start then .lt
  else compare_aux s1 s2 ord (start + 1) (len - 1)

def compare (s1 s2 : mlstring) : Ordering :=
  if strlen s1 < strlen s2 then compare_aux s1 s2 .lt 0 (strlen s1)
  else if strlen s2 < strlen s1 then compare_aux s1 s2 .gt 0 (strlen s2)
  else compare_aux s1 s2 .eq 0 (strlen s2)

def mlstring_lt (s1 s2 : mlstring) : Bool := compare s1 s2 == .lt
def mlstring_le (s1 s2 : mlstring) : Bool := compare s1 s2 != .gt
def mlstring_gt (s1 s2 : mlstring) : Bool := compare s1 s2 == .gt
def mlstring_ge (s1 s2 : mlstring) : Bool := compare s1 s2 != .lt

partial def collate_aux (f : Char → Char → Ordering) (s1 s2 : mlstring)
    (ord : Ordering) (n len : Nat) : Ordering :=
  match len with
  | 0 => ord
  | len + 1 =>
    if f (strsub s1 n) (strsub s2 n) == .eq then
      collate_aux f s1 s2 ord (n + 1) len
    else f (strsub s1 n) (strsub s2 n)

def collate (f : Char → Char → Ordering) (s1 s2 : mlstring) : Ordering :=
  if strlen s1 < strlen s2 then collate_aux f s1 s2 .lt 0 (strlen s1)
  else if strlen s2 < strlen s1 then collate_aux f s1 s2 .gt 0 (strlen s2)
  else collate_aux f s1 s2 .eq 0 (strlen s2)

def char_escape_seq (c : Char) : Option mlstring :=
  if c == '\t' then some (strlit "\\t".toList)
  else if c == '\n' then some (strlit "\\n".toList)
  else if c == '\\' then some (strlit "\\\\".toList)
  else if c == '"' then some (strlit "\\\"".toList)
  else none

def char_escaped (c : Char) : List Char :=
  match char_escape_seq c with
  | none => [c]
  | some s => s.explode

def escape_str (s : mlstring) : mlstring :=
  implode (['"'] ++ (s.explode.bind char_escaped) ++ ['"'])

def escape_char (c : Char) : mlstring :=
  implode (['#', '"'] ++ char_escaped c ++ ['"'])

def sum_sizes : List mlstring → Nat → Nat
  | [], k => k
  | l :: ls, k => sum_sizes ls (strlen l + k)

def empty_ffi (_ : mlstring) : Unit := ()

end mlstring

-- Theorems (all sorry)
section Mlstring_theorems

open mlstring

theorem concat_nil : concat [] = strlit [] := by sorry
theorem explode_thm : explode (strlit ls) = ls := by sorry
theorem explode_implode : ∀ x, explode (implode x) = x := by sorry
theorem implode_explode : ∀ x, implode (explode x) = x := by sorry
theorem explode_11 : ∀ s1 s2, explode s1 = explode s2 ↔ s1 = s2 := by sorry
theorem LENGTH_explode : (explode s).length = strlen s := by sorry
theorem concat_thm : concat l = implode (l.bind explode) := by sorry
theorem strlen_implode : strlen (implode s) = s.length := by sorry
theorem strlen_substring : True := by sorry
theorem strcat_thm : strcat s1 s2 = implode (explode s1 ++ explode s2) := by sorry
theorem strcat_assoc : strcat (strcat s1 s2) s3 = strcat s1 (strcat s2 s3) := by sorry
theorem strcat_nil : strcat (strlit []) s = s ∧ strcat s (strlit []) = s := by sorry
theorem explode_strcat : explode (strcat s1 s2) = explode s1 ++ explode s2 := by sorry
theorem strlen_strcat : strlen (strcat s1 s2) = strlen s1 + strlen s2 := by sorry
theorem tokens_filter : concat (tokens f s) = implode (explode s |>.filter (fun c => !f c)) := by sorry
theorem fields_filter : concat (fields f s) = implode (explode s |>.filter (fun c => !f c)) := by sorry
theorem fields_length : True := by sorry
theorem isprefix_thm : True := by sorry
theorem isSubString_spec : True := by sorry
theorem TotOrd_compare : True := by sorry
theorem good_cmp_compare : True := by sorry
theorem mlstring_lt_antisym : ∀ (s t : mlstring), ¬(mlstring_lt s t ∧ mlstring_lt t s) := by sorry
theorem mlstring_lt_cases : ∀ (s t : mlstring), s = t ∨ mlstring_lt s t ∨ mlstring_lt t s := by sorry
theorem mlstring_lt_nonrefl : ∀ (s : mlstring), ¬mlstring_lt s s := by sorry
theorem mlstring_lt_trans : mlstring_lt s1 s2 → mlstring_lt s2 s3 → mlstring_lt s1 s3 := by sorry
theorem mlstring_le_thm : mlstring_le s1 s2 ↔ s1 = s2 ∨ mlstring_lt s1 s2 := by sorry
theorem StrongLinearOrder_mlstring_lt : True := by sorry
theorem collate_thm : True := by sorry
theorem str_app_list_opt_thm : True := by sorry
theorem concat_sing : concat [x] = x := by sorry
theorem substring_full : substring s 0 (strlen s) = s := by sorry
theorem substring_0 : substring s i 0 = strlit [] := by sorry
theorem tokens_append : True := by sorry
theorem explode_str : explode (str c) = [c] := by sorry
theorem strlen_str : strlen (str c) = 1 := by sorry
theorem mlstring_common_prefix : strcat s t1 = strcat s t2 ↔ t1 = t2 := by sorry
theorem mlstring_common_suffix : strcat t1 s = strcat t2 s ↔ t1 = t2 := by sorry
theorem translate_thm : translate f s = implode (explode s |>.map f) := by sorry
theorem splitl_SPLITL : True := by sorry
theorem TOKENS_eq_tokens : True := by sorry
theorem exists_mlstring (P : mlstring → Prop) : (∃ x : mlstring, P x) ↔ ∃ s, P (mlstring.strlit s) := by sorry
theorem isSubstring_SEG : True := by sorry
theorem strlit_STRCAT : strcat (mlstring.strlit a) (mlstring.strlit b) = mlstring.strlit (a ++ b) := by sorry
theorem ALL_DISTINCT_MAP_implode : True := by sorry
theorem ALL_DISTINCT_MAP_explode : True := by sorry
theorem str_findi_range : True := by sorry
theorem str_findi_OLEAST : True := by sorry
theorem concat_append : mlstring.concat (xs ++ ys) = mlstring.strcat (mlstring.concat xs) (mlstring.concat ys) := by sorry
theorem transitive_mlstring_le : True := by sorry
theorem antisymmetric_mlstring_le : True := by sorry
theorem total_mlstring_le : True := by sorry
theorem strlit_le_strlit : True := by sorry

end Mlstring_theorems

end CakeML
