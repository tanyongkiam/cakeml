open preamble botProgTheory
open compilationLib

(* Compile the program *)

val _ = new_theory "botCompile"

(* Produce .S files *)
val arm6 = save_thm("bot_arm6", compile_arm6 100 100 "bot_arm6" bot_prog_def);

val x64 = save_thm("bot_x64", compile_x64 500 500 "bot_x64" bot_prog_def);

val _ = export_theory();
