/-
  Definition of the FFI type.
  Translated from: hol4_sources/ffiScript.sml
-/
import CakeML.Lib.HOL4Prelude
import CakeML.Lib.Words
import CakeML.Lib.Llist
import CakeML.Core.Mlstring

namespace CakeML

open HOL4
open mlstring

inductive ffi_outcome where
  | FFI_failed : ffi_outcome
  | FFI_diverged : ffi_outcome
deriving Repr, BEq, Inhabited, DecidableEq

inductive oracle_result (ffi : Type) where
  | Oracle_return : ffi → List word8 → oracle_result ffi
  | Oracle_final : ffi_outcome → oracle_result ffi
deriving Repr, BEq, Inhabited

inductive shmem_op where
  | MappedRead : shmem_op
  | MappedWrite : shmem_op
deriving Repr, BEq, Inhabited, DecidableEq

inductive ffiname where
  | ExtCall : mlstring → ffiname
  | SharedMem : shmem_op → ffiname
deriving Repr, BEq, Inhabited, DecidableEq

/-- Type aliases for oracle functions -/
abbrev oracle_function (ffi : Type) := ffi → List word8 → List word8 → oracle_result ffi
abbrev oracle (ffi : Type) := ffiname → oracle_function ffi

/-- An I/O event -/
inductive io_event where
  | IO_event : ffiname → List word8 → List (word8 × word8) → io_event
deriving Repr, BEq, Inhabited

inductive final_event where
  | Final_event : ffiname → List word8 → List word8 → ffi_outcome → final_event
deriving Repr, BEq, Inhabited

/-- FFI state record -/
structure ffi_state (ffi : Type) where
  oracle_field : oracle ffi
  ffi_state_field : ffi
  io_events : List io_event
deriving Inhabited

def initial_ffi_state (oc : oracle ffi) (f : ffi) : ffi_state ffi :=
  { oracle_field := oc, ffi_state_field := f, io_events := [] }

inductive ffi_result (ffi : Type) where
  | FFI_return : ffi_state ffi → List word8 → ffi_result ffi
  | FFI_final : final_event → ffi_result ffi
deriving Inhabited

def call_FFI (st : ffi_state ffi) (s : ffiname) (conf bytes : List word8) : ffi_result ffi :=
  match s with
  | ffiname.ExtCall name =>
    if name != strlit [] then
      match st.oracle_field s st.ffi_state_field conf bytes with
      | oracle_result.Oracle_return ffi' bytes' =>
        if bytes'.length = bytes.length then
          ffi_result.FFI_return
            { st with ffi_state_field := ffi',
                      io_events := st.io_events ++ [io_event.IO_event s conf (HOL4.ZIP (bytes, bytes'))] }
            bytes'
        else ffi_result.FFI_final (final_event.Final_event s conf bytes ffi_outcome.FFI_failed)
      | oracle_result.Oracle_final outcome =>
        ffi_result.FFI_final (final_event.Final_event s conf bytes outcome)
    else ffi_result.FFI_return st bytes
  | _ =>
    match st.oracle_field s st.ffi_state_field conf bytes with
    | oracle_result.Oracle_return ffi' bytes' =>
      if bytes'.length = bytes.length then
        ffi_result.FFI_return
          { st with ffi_state_field := ffi',
                    io_events := st.io_events ++ [io_event.IO_event s conf (HOL4.ZIP (bytes, bytes'))] }
          bytes'
      else ffi_result.FFI_final (final_event.Final_event s conf bytes ffi_outcome.FFI_failed)
    | oracle_result.Oracle_final outcome =>
      ffi_result.FFI_final (final_event.Final_event s conf bytes outcome)

inductive outcome where
  | Success : outcome
  | Resource_limit_hit : outcome
  | FFI_outcome : final_event → outcome
deriving Repr, BEq, Inhabited

/-- A program can Diverge, Terminate, or Fail -/
inductive behaviour where
  | Diverge : llist io_event → behaviour
  | Terminate : outcome → List io_event → behaviour
  | Fail : behaviour
deriving Inhabited

/-- Trace-based oracle -/
def trace_oracle (s : ffiname) (io_trace : llist io_event)
    (conf input : List word8) : oracle_result (llist io_event) :=
  match io_trace.LHD with
  | none => oracle_result.Oracle_final ffi_outcome.FFI_failed
  | some (io_event.IO_event s' conf' bytes2) =>
    if s == s' && bytes2.map Prod.fst == input && conf == conf' then
      match io_trace.LTL with
      | some tl => oracle_result.Oracle_return tl (bytes2.map Prod.snd)
      | none => oracle_result.Oracle_final ffi_outcome.FFI_failed
    else oracle_result.Oracle_final ffi_outcome.FFI_failed

end CakeML
