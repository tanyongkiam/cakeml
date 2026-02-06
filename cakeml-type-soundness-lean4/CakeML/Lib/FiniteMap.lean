/-
  Finite map operations, wrapping association lists.
  In HOL4, these come from finite_mapTheory.
  We use association lists (List (α × β)) as the representation.
-/
import CakeML.Lib.HOL4Prelude

namespace HOL4

/-- Finite map represented as association list -/
abbrev fmap (α : Type) (β : Type) := List (α × β)

/-- Empty finite map -/
def FEMPTY : fmap α β := []

/-- Lookup in a finite map -/
def FLOOKUP [BEq α] (m : fmap α β) (k : α) : Option β :=
  ALOOKUP m k

/-- Update a finite map -/
def FUPDATE [BEq α] (m : fmap α β) (kv : α × β) : fmap α β :=
  kv :: m

/-- Update a finite map with a list -/
def FUPDATE_LIST [BEq α] (m : fmap α β) (kvs : List (α × β)) : fmap α β :=
  kvs.foldl (fun acc kv => FUPDATE acc kv) m

/-- Domain of a finite map -/
def FDOM [BEq α] (m : fmap α β) : List α :=
  m.map Prod.fst

/-- Range of a finite map -/
def FRANGE (m : fmap α β) : List β :=
  m.map Prod.snd

/-- Map a function over values -/
def o_f (f : β → γ) (m : fmap α β) : fmap α γ :=
  m.map (fun p => (p.1, f p.2))

/-- Map with key -/
def FMAP_MAP2 (f : α → β → γ) (m : fmap α β) : fmap α γ :=
  m.map (fun p => (p.1, f p.1 p.2))

/-- Union of two finite maps (first takes precedence) -/
def FUNION [BEq α] (m1 m2 : fmap α β) : fmap α β :=
  m1 ++ m2

/-- Restrict a finite map to a set of keys -/
def DRESTRICT [BEq α] (m : fmap α β) (ks : List α) : fmap α β :=
  m.filter (fun p => ks.any (· == p.1))

/-- Apply a finite map (total, with default) -/
def FAPPLY [BEq α] [Inhabited β] (m : fmap α β) (k : α) : β :=
  (FLOOKUP m k).getD default

/-- Build a finite map from a function and domain -/
def FUN_FMAP (f : α → β) (s : List α) : fmap α β :=
  s.map (fun k => (k, f k))

/-- Convert association list to finite map -/
def alist_to_fmap (l : List (α × β)) : fmap α β := l

/-- Convert finite map to association list -/
def fmap_to_alist (m : fmap α β) : List (α × β) := m

end HOL4
