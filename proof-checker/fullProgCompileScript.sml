open preamble compilationLib fullProgTheory

val _ = new_theory "fullProgCompile"

val fullProg_compiled = save_thm("fullProg_compiled",
  compile_x64 1000 1000 "fullProg" full_prog_def);

val _ = export_theory ();
