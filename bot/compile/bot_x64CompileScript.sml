open preamble botProgTheory
open compilationLib

(* Compile the program *)

val _ = new_theory "bot_x64Compile"

(* Produce .S files *)
val x64 = save_thm("bot_x64", compile_x64 500 500 "bot_x64" bot_prog_def);

val _ = export_theory();
