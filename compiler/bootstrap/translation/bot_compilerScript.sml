open preamble compilerTheory MonitorProgTheory
open ml_translatorLib ml_progLib

(* This just modifies the existing compilers with the bot program*)
val _ = new_theory"bot_compiler";

val _ = translation_extends"MonitorProg"
(*"*)
val basis_st = get_ml_prog_state ();

val basis_prog = basis_st |> remove_snocs
  |> get_thm |> concl |> rator |> rator |> rator |> rand

val bot_basis_def = Define `bot_basis = ^basis_prog`;

val bot_compile_to_bytes_def = Define `
  bot_compile_to_bytes backend_conf bytes_export cl input =
    let ext_conf = extend_with_args cl backend_conf in
    let (heap,stack) = parse_heap_stack cl in
    let compiler_conf =
      <| inferencer_config := init_config;
         backend_config := ext_conf;
         input_is_sexp := MEM (strlit"--sexp") cl |> in
    format_compiler_result bytes_export heap stack
      (compiler$compile compiler_conf bot_basis input)`;

val _ = export_theory();
