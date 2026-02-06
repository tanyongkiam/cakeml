# Deviations from the HOL4 CakeML Source

This document records every place where the Lean 4 translation deviates
substantially from the original HOL4 CakeML development in `hol4_sources/`.
Purely syntactic differences (e.g. `SOME` -> `some`, `Datatype:` -> `inductive`)
are not listed. The focus is on **semantic** gaps: definitions that are
incomplete, types that had to be changed, and theorems whose statements are
weakened.

---

## 1. `type_v` Inductive: Reformulated for Strict Positivity

**File:** `TypeSoundInvariants.lean:99`

**HOL4 original:** `typeSoundInvariantsScript.sml` defines `type_v` as an
`Inductive` with 14 rules. Several rules use:
- `LIST_REL (type_v ...) vs ts` (Conv_some, Conv_none rules)
- `EVERY (\v. type_v ...) vs` (Vectorv rule)
- `nsAll2 (\i v (tvs,t). type_v tvs ctMap tenvS v t) env.v ...` (Closure, Recclosure rules)

**Lean translation:** `type_v` is a proper `inductive` with the following
adaptations to satisfy Lean 4's strict positivity checker:
- `LIST_REL (type_v ...) vs ts` → `vs.length = ts.length ∧ ∀ i (h : i < vs.length), type_v ... (vs.get ⟨i, h⟩) (ts.get ⟨i, ...⟩)` (indexed universal quantification)
- `EVERY (\v. type_v ...) vs` → `∀ w ∈ vs, type_v ... w t`
- `nsAll2 ... env.v tenv.v` → split into a pointwise typing condition (∀ without ∃) and separate domain equality conditions (∃ without type_v), avoiding `Exists` as a nested inductive

**Impact:** The inductive has full structural induction support. The reformulated
conditions are logically equivalent to the HOL4 originals (since `nsLookup` is
deterministic and `LIST_REL` is equivalent to length equality + pointwise).

---

## 2. Skolemized `bindings_fn` in Typing Rules

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

## 3. Incomplete Definitions (sorry in def body)

These HOL4 definitions have actual implementations but are translated as
`sorry` because their bodies are too complex or depend on infrastructure not
yet available.

| File | Definition | Reason |
|------|-----------|--------|
| `Semantics.lean:20` | `parse` | Depends on `valid_lptree`, `ptree_TopLevelDecs` composition |
| `SemanticPrimitives.lean:47` | `v_beq` | BEq instance for mutual inductive `v`; can't be derived |
| `SemanticPrimitives.lean:48` | `sem_env_beq` | BEq instance for mutual inductive `sem_env`; can't be derived |

---

## 4. Opaque Stubs

### Grammar -- `Gram.lean:141`

```lean
noncomputable opaque cmlG : grammar token MMLnonT := sorry
```

The CakeML grammar `cmlG` maps nonterminals to production rules (~120 rules).
The full definition is very large and was not translated.

---

## 5. Name Changes

| HOL4 name | Lean name | Reason |
|-----------|-----------|--------|
| `namespace` (type) | `ns` | `namespace` is a Lean keyword |
| `t` (type in typeSystem) | `sem_t` | `t` conflicts with Lean identifiers |
| `state` (in Semantics) | `sem_state` | Avoids conflict with `state` from SemanticPrimitives |

---

## 6. Sets as Predicates

HOL4 uses `('a -> bool)` sets freely. In several places the Lean translation
uses `Nat -> Prop` instead of a dedicated `Set` type:

| File | Field/Parameter | HOL4 type |
|------|----------------|-----------|
| `Semantics.lean:29` | `sem_state.type_ids` | `num set` |
| `TypeSystem.lean:670` | `type_d` / `type_ds` new_tids parameter | `num set` |
| `TypeSoundInvariants.lean:148` | `consistent_ctMap` type_ids parameter | `num set` |
| `PrimTypes.lean:91` | `prim_type_ids` return type | `num set` |

`Disjoint` is inlined as `forall n, s1 n -> not (s2 n)`.

---

## 7. Theorems Stated as `True`

Some theorems are stated as `theorem name : True := by sorry` instead of
their actual HOL4 type. This happens when the theorem's statement depends on
types or definitions not available in scope (e.g. `FDOM`, `FRANGE`,
HOL4-specific set operations, `PERM`, `SORTED`, `BIJ`, computed theorem
outputs like `type_op_cases`, etc.).

### By file:

| File | Count | Examples |
|------|-------|---------|
| **TypeSound.lean** | 24 | `exp_type_sound`, `op_type_sound`, `pat_type_sound`, `decs_type_sound`, etc. |
| **Mlstring.lean** | 21 | `TotOrd_compare`, `StrongLinearOrder_mlstring_lt`, `collate_thm`, etc. |
| **TypeSysProps.lean** | 8 | `type_op_cases`, `type_e_subst`, `ctMap_ok_merge_imp`, etc. |
| **Weakening.lean** | 7 | `type_v_weakening`, `type_all_env_weakening`, `type_sv_weakening`, etc. |
| **CmlPtreeConversion.lean** | 5 | `ptree_Pattern_pevaled`, `ptree_Expr_pevaled`, `dumb2`, etc. |
| **LexerFun.lean** | 4 | `lem1`, `lem2`, `read_while_EMPTY`, `NOT_NIL_EXISTS_CONS` |
| **Gram.lean** | 3 | `disjneq`, `validSym_incompatibility`, `nt_distinct_ths` |

**Note:** Many theorems in TypeSysProps.lean that were previously `True` have
been given their proper types. The remaining `True` theorems are either
computed theorems in HOL4 (like `type_op_cases`) or depend on unavailable
definitions (like `ctMap_ok_merge_imp` which uses `FUNION`).

---

## 8. `partial def` (Termination Not Verified)

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
| `Mlstring.lean` | `concatWith_aux`, `splitl_aux`, `tokens_aux`, etc. | Input string shrinks |

**Reason:** Lean 4 requires explicit termination proofs for nested recursion
through `List.map` or similar higher-order functions. Most HOL4 definitions
that recurse structurally on a datatype but go through `MAP`/`EVERY` on
sub-lists fall into this category.

---

## 9. Gutted `Misc.lean`

**File:** `Misc.lean`

The HOL4 `miscScript.sml` contains ~1300 lines of utility definitions and
theorems covering sptrees, separation logic, memory operations, assembly
helpers, and general list/set lemmas. Most of these are used only in
compiler correctness proofs, not in the type soundness development.

The Lean translation retains only the definitions transitively imported by
the type soundness chain: `the_def`, `opt_bind`, `app_list` inductive, and
list append/SmartAppend operations. All sptree stubs (~18), separation logic
stubs (~5), memory/assembly stubs (~8), and ~350 theorems have been removed.

---

## Summary

| Category | Count | Severity |
|----------|-------|----------|
| `type_v` reformulation (strict positivity) | 1 | Low -- logically equivalent inductive |
| Sorry'd definitions | 3 | Medium -- `parse`, `v_beq`, `sem_env_beq` |
| Opaque stubs (grammar) | 1 | Low -- not needed for type soundness |
| Theorems degraded to `True` | ~72 | High for TypeSound/Weakening; Low for others |
| Skolemized inductive rules | 2 rules | Low -- classically equivalent |
| `partial def` (unverified termination) | ~70 | Medium -- all do terminate |
| `Nat -> Prop` for sets | ~4 locations | Low -- isomorphic representation |
| Gutted Misc.lean | 1 file | Low -- removed unused content |
