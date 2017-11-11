open preamble ml_progLib ml_translatorLib
     basisFunctionsLib basis_ffiLib
     cfTacticsLib cfLetAutoLib
     ctrl_monitorProgTheory
open cfHeapsBaseTheory
open compilationLib

(* Here we add in the formula and compile the whole thing *)

val _ = new_theory "ctrl_monitorCompile";

val _ = translation_extends "ctrl_monitorProg";

val reval = rconc o EVAL;

val Apps_def = tDefine "Apps" `
  (Apps [x;y] = App Opapp [x;y]) /\
  (Apps [] = ARB) /\
  (Apps xs = App Opapp [Apps (FRONT xs); LAST xs])`
  (WF_REL_TAC `measure LENGTH` \\ fs [LENGTH_FRONT]);

val ctrl_fml_def = Define`
  ctrl_fml =
  Or
    (And (Leq (Times (Var (strlit"V")) (Var (strlit"ep"))) (Var (strlit"d")))
    (And (And (Leq (Const 0w) (Var (strlit"vpost"))) (Leq (Var (strlit"vpost")) (Var (strlit"V"))))
    (And (Leq (Const 0w) (Var (strlit"ep")))
    (And (Equals (Var (strlit"dpost")) (Var (strlit"d")))
         (Equals (Var (strlit"tpost")) (Const 0w))))))

    (And (Leq (Const 0w) (Var (strlit"ep")))
    (And (Equals (Var (strlit"dpost")) (Var (strlit"d")))
    (And (Equals (Var (strlit"vpost")) (Const 0w))
         (Equals (Var (strlit"tpost")) (Const 0w)))))`

val cml_ctrl_fml_th = translate ctrl_fml_def;

val const_vars_def = Define`
  const_vars = [strlit "V";strlit"ep"]`
val sensor_vars_def = Define`
  sensor_vars = [strlit"d";strlit"v";strlit"t"]`
val ctrl_vars_def = Define`
  ctrl_vars = [strlit"dpost";strlit"vpost";strlit"tpost"]`

val cml_const_th = translate const_vars_def;
val cml_sensor_th = translate sensor_vars_def;
val cml_ctrl_th = translate ctrl_vars_def;

(* The sensor that always returns d *)
val default_def = Define`
  default (const_ls:word32 list) (sense_ls:word32 list) =
  case sense_ls of
    [] => []
  | x::xs => [x; 0w:word32 ; 0w]`

val cml_default_th = translate default_def;

(* The final call that does 1 shot monitoring
   TODO: remove soon-ish? *)
val main_body =
  process_topdecs`
  fun main_body u = ctrl_monitor ctrl_fml const_vars sensor_vars ctrl_vars default`

val _ = append_prog main_body;

val st = get_ml_prog_state();

val trans_th = [cml_ctrl_th,cml_sensor_th,cml_ctrl_th,cml_ctrl_fml_th,cml_const_th,cml_default_th]

val comp_eq = [world_component_equality,
              world_config_component_equality,
              world_state_component_equality];

val main_body_spec = Q.store_thm("main_body_spec",`
    (* These specify what the inputs should be *)
    (w.wc =  <|
      const_names  := const_vars;
      sensor_names := sensor_vars;
      ctrl_names   := ctrl_vars;
      ctrl_monitor := ctrl_fml |>) ∧
    good_default default w ⇒
    app (p:'ffi ffi_proj) ^(fetch_v "main_body" st)
      [u]
    (IOBOT w)
    (POSTv u. IOBOT w)`,
  rw[]>>
  xcf "main_body" st>>
  xapp>>
  fs (comp_eq@trans_th)>>
  metis_tac trans_th);

val main = reval ``Tdec (Dlet unknown_loc (Pvar "u") (Apps [Var (Short "main_body"); Con NONE []]))``

val (ML_code (ss,envs,vs,th)) = get_ml_prog_state ();

val prog = (rconc o EVAL) ``SNOC ^main ^(th |> concl |> strip_comb |> #2 |> el 3)``

val prog_def = Define`bot_prog = ^prog`;

(* Produce .S files *)
val x64 = compile_x64 500 500 "bot_x64" prog_def;
val arm6 = compile_arm6 100 100 "bot_arm6" prog_def;

val _ = export_theory();

