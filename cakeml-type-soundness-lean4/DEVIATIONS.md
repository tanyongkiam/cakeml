# Deviations from the HOL4 CakeML Source

This document records every place where the Lean 4 translation deviates
substantially from the original HOL4 CakeML development in `hol4_sources/`.
Purely syntactic differences (e.g. `SOME` -> `some`, `Datatype:` -> `inductive`)
are not listed. The focus is on **semantic** gaps: definitions that are
incomplete, types that had to be changed, and theorems whose statements are
weakened.

---

## 1. Axiomatized Inductive: `type_v`

**File:** `TypeSoundInvariants.lean:94`

```lean
axiom type_v : Nat -> ctMap -> tenv_store -> v -> sem_t -> Prop
```

**HOL4 original:** `typeSoundInvariantsScript.sml` defines `type_v` as an
`Inductive` with ~13 rules. Several rules use:
- `LIST_REL (type_v ...) vs ts` (in Conv_some, Conv_none, Vectorv rules)
- `nsAll2 (\i v (tvs,t). type_v tvs ctMap tenvS v t) env.v ...` (in Closure, Recclosure rules)

**Reason:** Lean 4's strict positivity checker rejects `type_v` appearing
inside `List.Forall2` / universal quantifiers over lists in inductive
premises. The heterogeneous `nsAll2` (relating `v` in one namespace to
`(Nat x sem_t)` in another) adds a further complication.

**Impact:** All type soundness proofs ultimately depend on `type_v`. Without
the inductive structure, proofs by induction on `type_v` cannot be carried
out. Related definitions (`type_sv`, `type_all_env`, `type_sound_invariant`)
are defined in terms of this axiom and are well-typed.

---

## 2. Heterogeneous Namespace Relation: `nsAll2_het`

**File:** `TypeSoundInvariants.lean:33`

```lean
def nsAll2_het [BEq m] [BEq n]
  (_ : id m n -> alpha -> beta -> Prop) : ns m n alpha -> ns m n beta -> Prop := sorry
```

**HOL4 original:** `nsAll2` in HOL4 is polymorphic and naturally handles
different value types on each side. The Lean definition (`Namespace.lean`)
constrains both sides to the same value type.

**Reason:** `type_all_env` needs to relate `env.c : ns ... (Nat x stamp)` with
`tenv.c : ns ... (List tvarN x List sem_t x type_ident)`. A heterogeneous
variant is needed but nontrivial to define without inlining the `ns`
representation.

**Impact:** `type_all_env` (and hence `type_sound_invariant`) depends on this.

---

## 3. Skolemized `bindings_fn` in Typing Rules

**File:** `TypeSystem.lean:510-520, 561-571`

The `Handle` and `Mat` rules of `type_e` use a **Skolemized function**
`bindings_fn : pat -> exp -> List (varN x sem_t)` instead of existential
quantification.

**HOL4 original:**
```
! ((p,e) :: LIST_TO_SET pes). ? bindings.
  ALL_DISTINCT (pat_bindings p []) /\
  type_p ... p Texn bindings /\
  type_e ... (bind_var_list 0 bindings tenvE) e t
```

**Lean translation:**
```lean
| Handle : forall tenv tenvE e pes t (bindings_fn : pat -> exp -> List (varN x sem_t)),
    ...
    (forall p e', (p, e') in pes -> type_p ... p Texn (bindings_fn p e')) ->
    (forall p e', (p, e') in pes -> type_e ... (bind_var_list 0 (bindings_fn p e') tenvE) e' t) ->
    type_e tenv tenvE (exp.Handle e pes) t
```

**Reason:** Lean's `inductive` does not allow existential quantifiers
(`exists bindings, ...`) nested inside universal quantifiers over list
membership in inductive premises. The Skolemization is logically equivalent
(by the axiom of choice).

**Impact:** Minor. The Skolemized form is strictly stronger in constructive
logic but equivalent classically.

---

## 4. Incomplete Definitions (sorry in def body)

These HOL4 definitions have actual implementations but are translated as
`sorry` because their bodies are too complex or depend on infrastructure not
yet available.

| File | Definition | Reason |
|------|-----------|--------|
| `TypeSoundInvariants.lean:144` | `consistent_ctMap` | Involves `DISJOINT`, `FRANGE`, `FDOM` conditions on finite maps |
| `Semantics.lean:20` | `parse` | Depends on `valid_lptree`, `ptree_TopLevelDecs` composition |
| `Semantics.lean:55` | `semantics_prog` | Complex definition involving `Terminate`, `Diverge`, `Fail` behaviours with `lprefix_lub` |
| `Semantics.lean:68` | `semantics_init` | Involves composing `prim_sem_env`, `prim_tenv`, `prim_type_ids` |
| `SemanticPrimitives.lean:47` | `v_beq` | BEq instance for mutual inductive `v`; can't be derived |
| `SemanticPrimitives.lean:48` | `sem_env_beq` | BEq instance for mutual inductive `sem_env`; can't be derived |
| `Misc.lean:441` | `Lnext` | Depends on lazy list (`llist`) operations not fully translated |

---

## 5. Opaque Stubs (replacing actual HOL4 definitions)

### 5a. Sparse Partial Trees (sptree) -- `Misc.lean:21-63`

HOL4's `sptree` library provides a balanced-trie implementation of `num -> 'a`
maps. It is used throughout the compiler but is not needed for the type
soundness development. All 18 spt operations are stubbed as `opaque`:

`spt`, `spt_lookup`, `spt_insert`, `spt_delete`, `spt_domain`, `spt_LN`,
`spt_size`, `spt_map`, `spt_fromList`, `spt_fromAList`, `spt_toAList`,
`spt_toList`, `spt_subspt`, `spt_wf`, `spt_union`, `spt_inter`,
`spt_difference`, `spt_isEmpty`, `spt_alist_insert`

### 5b. Separation Logic -- `Misc.lean:66-74`

5 stubs for set-separation predicates used only in compiler correctness:
`set_sep_one`, `SEP_EXISTS`, `sep_cond`, `sep_star`, `sep_emp`

### 5c. Other Stubs -- `Misc.lean:76-80, 308, 315, 515, 522`

| Stub | Reason |
|------|--------|
| `bytes_in_word` | Machine-dependent constant |
| `eventually` | Lazy list predicate |
| `okpath` | Path predicate for labelled transition systems |
| `word_list`, `word_list_exists` | Assembly-level memory predicates |
| `eq_shape`, `copy_shape` | sptree shape operations |

### 5d. Grammar -- `Gram.lean:141`

```lean
noncomputable opaque cmlG : grammar token MMLnonT := sorry
```

The CakeML grammar `cmlG` maps nonterminals to production rules (~120 rules).
The full definition is very large and was not translated.

---

## 6. Name Changes

| HOL4 name | Lean name | Reason |
|-----------|-----------|--------|
| `namespace` (type) | `ns` | `namespace` is a Lean keyword |
| `t` (type in typeSystem) | `sem_t` | `t` conflicts with Lean identifiers |
| `state` (in Semantics) | `sem_state` | Avoids conflict with `state` from SemanticPrimitives |

---

## 7. Sets as Predicates

HOL4 uses `('a -> bool)` sets freely. In several places the Lean translation
uses `Nat -> Prop` instead of a dedicated `Set` type:

| File | Field/Parameter | HOL4 type |
|------|----------------|-----------|
| `Semantics.lean:29` | `sem_state.type_ids` | `num set` |
| `TypeSystem.lean:670` | `type_d` / `type_ds` new_tids parameter | `num set` |
| `TypeSoundInvariants.lean:143` | `consistent_ctMap` type_ids parameter | `num set` |
| `PrimTypes.lean:91` | `prim_type_ids` return type | `num set` |

`Disjoint` is inlined as `forall n, s1 n -> not (s2 n)`.

---

## 8. Duplicated Definitions in Weakening.lean

**File:** `Weakening.lean:19-33`

Three definitions are re-stated with `_w` suffix because the Weakening agent
could not import `TypeSoundInvariants` at the time of translation:

- `tenv_val_ok_w` (duplicates `tenv_val_ok` from TypeSoundInvariants)
- `tenv_val_exp_ok_w` (duplicates `tenv_val_exp_ok`)
- `tenv_ok_w` (duplicates `tenv_ok`)

**Note:** TypeSoundInvariants now builds correctly. These duplicates could be
removed in a future cleanup by replacing `_w` uses with the originals.

---

## 9. Theorems Stated as `True`

Many theorems are stated as `theorem name : True := by sorry` instead of
their actual HOL4 type. This happens when the theorem's statement depends on
types or definitions not available in scope (e.g. `type_v`, `FDOM`, `FRANGE`,
HOL4-specific set operations, `PERM`, `SORTED`, `BIJ`, etc.).

### By file:

| File | Count | Examples |
|------|-------|---------|
| **Misc.lean** | ~280 | Most theorems about HOL4 library concepts (sptree, ZIP, PERM, SORTED, BIJ, word ops, etc.) |
| **Mlstring.lean** | ~18 | `TotOrd_compare`, `StrongLinearOrder_mlstring_lt`, `collate_thm`, etc. |
| **TypeSound.lean** | ~22 | `exp_type_sound`, `op_type_sound`, `pat_type_sound`, `decs_type_sound`, etc. (depend on axiomatized `type_v`) |
| **Weakening.lean** | 7 | `type_v_weakening`, `type_all_env_weakening`, `type_sv_weakening`, `type_s_weakening`, etc. (depend on `type_v`) |
| **TypeSysProps.lean** | ~11 | `type_op_cases`, `type_e_subst`, `ctMap_ok_merge_imp`, `type_subst_thm`, etc. |
| **CmlPtreeConversion.lean** | 5 | `ptree_Pattern_pevaled`, `ptree_Expr_pevaled`, etc. |
| **LexerFun.lean** | 4 | `lem1`, `lem2`, `read_while_EMPTY`, `NOT_NIL_EXISTS_CONS` (local helper lemmas) |
| **Gram.lean** | 3 | `disjneq`, `validSym_incompatibility`, `nt_distinct_ths` |

**Note:** Every theorem whose statement IS expressible in Lean has its full
type preserved. Only theorems that reference unavailable HOL4 concepts are
degraded to `True`.

---

## 10. `partial def` (Termination Not Verified)

All recursive definitions that HOL4 proves terminating are marked `partial` in
Lean, bypassing the termination checker. Key groups:

| File | Functions | HOL4 termination argument |
|------|----------|--------------------------|
| `Evaluate.lean` | `evaluate`, `evaluate_match`, `evaluate_decs` | Clock decreases |
| `TypeSystem.lean` | `check_freevars`, `type_subst`, `deBruijn_inc`, `deBruijn_subst`, etc. | Structural on `sem_t`/`ast_t` (but nested under `List.map`) |
| `CmlPtreeConversion.lean` | ~33 ptree conversion functions | Parse tree size decreases |
| `LexerFun.lean` | `read_while`, `read_string`, `skip_comment`, `next_sym`, `lexer_fun_aux`, etc. | Input string shrinks |
| `SemanticPrimitives.lean` | `pmatch`, `do_eq`, `do_app`, `v_to_list`, `concrete_v` | Structural on `v`/`pat` (nested under lists) |
| `Ast.lean` | `every_exp` | Structural on `exp` (nested lists) |
| `Misc.lean` | `read_bytearray`, `anub`, `find_index`, `splitlines`, etc. | Various |
| `Mlstring.lean` | `concatWith_aux`, `splitl_aux`, `tokens_aux`, etc. | Input string shrinks |

**Reason:** Lean 4 requires explicit termination proofs for nested recursion
through `List.map` or similar higher-order functions. Most HOL4 definitions
that recurse structurally on a datatype but go through `MAP`/`EVERY` on
sub-lists fall into this category.

---

## Summary

| Category | Count | Severity |
|----------|-------|----------|
| Axiomatized inductive (`type_v`) | 1 | Critical -- blocks all `type_v` induction |
| Sorry'd definitions | 7 | High -- incomplete implementations |
| Opaque stubs (sptree, sep logic, etc.) | ~32 | Medium -- only needed for compiler, not type soundness |
| Theorems degraded to `True` | ~350 | High for TypeSound/Weakening; Low for Misc |
| Skolemized inductive rules | 2 rules | Low -- classically equivalent |
| Duplicated `_w` definitions | 3 | Low -- cleanup item |
| `partial def` (unverified termination) | ~70 | Medium -- all do terminate |
| `Nat -> Prop` for sets | ~4 locations | Low -- isomorphic representation |
