open preamble botProgTheory
open compilationLib

(* Compile the program *)

val _ = new_theory "bot_arm6Compile"

(* Produce .S files *)
val arm6 = save_thm("bot_arm6", compile_arm6 100 100 "bot_arm6" bot_prog_def);

val _ = export_theory();
