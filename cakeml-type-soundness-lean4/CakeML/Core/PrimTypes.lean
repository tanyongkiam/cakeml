/-
  Definition of the primitive types that are in scope before any CakeML program starts.
  Translated from: hol4_sources/primTypesScript.sml
-/
import CakeML.Core.Evaluate
import CakeML.Core.TypeSystem

namespace CakeML

open HOL4
open mlstring

-- ============================================================
-- Definitions
-- ============================================================

def prim_types_program : List dec :=
  [ dec.Dexn unknown_loc (strlit "Bind".toList) [],
    dec.Dexn unknown_loc (strlit "Chr".toList) [],
    dec.Dexn unknown_loc (strlit "Div".toList) [],
    dec.Dexn unknown_loc (strlit "Subscript".toList) [],
    dec.Dtype unknown_loc
      [([],
        strlit "bool".toList,
        [(strlit "False".toList, []),
         (strlit "True".toList, [])])],
    dec.Dtype unknown_loc
      [([strlit "'a".toList],
        strlit "list".toList,
        [(strlit "[]".toList, []),
         (strlit "::".toList,
          [ast_t.Atvar (strlit "'a".toList),
           ast_t.Atapp [ast_t.Atvar (strlit "'a".toList)]
                       (id.Short (strlit "list".toList))])])] ]

def add_to_sem_env (st_env : state ffi × sem_env) (prog : List dec)
    : Option (state ffi × sem_env) :=
  let (st, env) := st_env
  match evaluate_decs st env prog with
  | (st', result.Rval env') => some (st', extend_dec_env env' env)
  | (_, result.Rerr _) => none

def prim_sem_env (ffi' : ffi_state ffi) : Option (state ffi × sem_env) :=
  add_to_sem_env
    ({ clock := 0,
       ffi_field := ffi',
       refs := [],
       next_type_stamp := 0,
       next_exn_stamp := 0,
       eval_state_field := none },
     sem_env.mk nsEmpty nsEmpty)
    prim_types_program

def prim_tenv : type_env :=
  { v := nsEmpty,
    c := alist_to_ns
      ([ (strlit "Bind".toList, ([], [], Texn_num)),
         (strlit "Chr".toList, ([], [], Texn_num)),
         (strlit "Div".toList, ([], [], Texn_num)),
         (strlit "Subscript".toList, ([], [], Texn_num)),
         (strlit "False".toList, ([], [], Tbool_num)),
         (strlit "True".toList, ([], [], Tbool_num)),
         (strlit "[]".toList, ([strlit "'a".toList], [], Tlist_num)),
         (strlit "::".toList,
           ([strlit "'a".toList],
            [sem_t.Tvar (strlit "'a".toList),
             Tlist (sem_t.Tvar (strlit "'a".toList))],
            Tlist_num))
       ].reverse),
    t := alist_to_ns
      ([ (strlit "array".toList,
          ([strlit "'a".toList], sem_t.Tapp [sem_t.Tvar (strlit "'a".toList)] Tarray_num)),
         (strlit "bool".toList, ([], sem_t.Tapp [] Tbool_num)),
         (strlit "char".toList, ([], sem_t.Tapp [] Tchar_num)),
         (strlit "double".toList, ([], sem_t.Tapp [] Tdouble_num)),
         (strlit "exn".toList, ([], sem_t.Tapp [] Texn_num)),
         (strlit "int".toList, ([], sem_t.Tapp [] Tint_num)),
         (strlit "list".toList,
          ([strlit "'a".toList], sem_t.Tapp [sem_t.Tvar (strlit "'a".toList)] Tlist_num)),
         (strlit "ref".toList,
          ([strlit "'a".toList], sem_t.Tapp [sem_t.Tvar (strlit "'a".toList)] Tref_num)),
         (strlit "string".toList, ([], sem_t.Tapp [] Tstring_num)),
         (strlit "unit".toList, ([], sem_t.Tapp [] Ttup_num)),
         (strlit "vector".toList,
          ([strlit "'a".toList], sem_t.Tapp [sem_t.Tvar (strlit "'a".toList)] Tvector_num)),
         (strlit "word64".toList, ([], sem_t.Tapp [] Tword64_num)),
         (strlit "word8".toList, ([], sem_t.Tapp [] Tword8_num)),
         (strlit "word8array".toList, ([], sem_t.Tapp [] Tword8array_num))
       ].reverse) }

def prim_type_ids : Nat → Prop :=
  fun n => n = Tlist_num ∨ n = Tbool_num ∨ n ∈ prim_type_nums

end CakeML
