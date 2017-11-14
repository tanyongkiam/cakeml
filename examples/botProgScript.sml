open preamble basis

val _ = new_theory "botProg"

val _ = translation_extends"basisProg";

(*
  This concretely instantiates the monitors
*)
val reval = rconc o EVAL

val const_vars_def = Define`
  const_vars = [ "V";"ep"]`
val sensor_pre_vars_def = Define`
  sensor_pre_vars = ["dpre";"vpre";"tpre"]`
val sensor_vars_def = Define`
  sensor_vars = ["d";"v";"t"]`
val ctrl_vars_def = Define`
  ctrl_vars = ["dpost";"vpost";"tpost"]`

val init_fml_def = Define`
  init_fml = Leq (Const 0w) (Var ("ep"))`

val ctrl_fml_def = Define`
  ctrl_fml =
  Or
    (And (Leq (Times (Var ("V")) (Var ("ep"))) (Var ("d")))
    (And (And (Leq (Const 0w) (Var ("vpost"))) (Leq (Var ("vpost")) (Var ("V"))))
    (And (Leq (Const 0w) (Var ("ep")))
    (And (Equals (Var ("dpost")) (Var ("d")))
         (Equals (Var ("tpost")) (Const 0w))))))

    (And (Leq (Const 0w) (Var ("ep")))
    (And (Equals (Var ("dpost")) (Var ("d")))
    (And (Equals (Var ("vpost")) (Const 0w))
         (Equals (Var ("tpost")) (Const 0w)))))`

val plant_fml_def = Define`
  plant_fml =
  ^(reval``Leq
  (Times (Const (-1w)) (Times (Var("vpre")) (Var("t"))))
  (Var ("d"))``)`

val cml_const_th = translate const_vars_def;
val cml_sensor_pre_th = translate sensor_pre_vars_def;
val cml_sensor_th = translate sensor_vars_def;
val cml_ctrl_th = translate ctrl_vars_def;

val cml_init_fml_th = translate init_fml_def;
val cml_ctrl_fml_th = translate ctrl_fml_def;
val cml_plant_fml_th = translate plant_fml_def;

(* The sensor that always returns d *)
val default_def = Define`
  default (const_ls:word32 list) (sense_ls:word32 list) =
  case sense_ls of
    [] => []
  | x::xs => [x; 0w:word32 ; 0w]`

val cml_default_th = translate default_def;

(* The looping control monitor program *)
val bot_main =
  process_topdecs`
  fun bot_main u =
    ctrl_monitor_loop init_fml ctrl_fml const_vars sensor_vars ctrl_vars default`

val _ = append_prog bot_main;

val st = get_ml_prog_state();

val trans_th = [cml_ctrl_th,cml_init_fml_th,cml_sensor_th,cml_ctrl_th,cml_ctrl_fml_th,cml_const_th,cml_default_th]

val comp_eq = [world_component_equality,
              world_config_component_equality,
              world_state_component_equality,
              world_oracle_component_equality];

(* Define all the possible initial states w.r.t. to our formulas *)
val init_state_def = Define`
  init_state w <=>
  ((w.wc = <|
      const_names  := const_vars;
      sensor_names := sensor_vars;
      ctrl_names   := ctrl_vars;
      init         := init_fml;
      ctrl_monitor := ctrl_fml |>)  (* Other two parts are ARB for this model *)
  ∧
  w.tr = [] ∧
  good_default default w ∧
  eventually $~ w.wo.step_oracle
  )`

val bot_main_spec = Q.store_thm("bot_main_spec",`
  (* These specify what the inputs should be *)
  init_state w ==>
  app (p:'ffi ffi_proj) ^(fetch_v "bot_main" st)
    [u]
  (STDIO fs * IOBOT w)
  (POSTv uv.
    &UNIT_TYPE () uv * (STDIO fs *
    (SEP_EXISTS w'. IOBOT w' *
     &(
      (* Either the initial world violates init immediately *)
      (w = w' ∧ ¬init_sat w.wc w.ws) ∨
      (* Or we transition to a final world,
         and good_world guarantees that the actuation trace all
         satisfy the control monitor *)
      good_world default w' ∧
      ¬w'.wo.step_oracle 0))))`,
  rw[]>>
  xcf "bot_main" st>>
  fs[init_state_def]>>
  xapp>>
  qexists_tac`STDIO fs`>>qexists_tac`w`>>
  qexists_tac`default`>>
  xsimpl>>fs[init_state_def]>>
  fs (comp_eq@trans_th)>>xsimpl>>
  fs[good_ctrl_trace_def]>>
  rw[]>>
  fs (comp_eq@trans_th)>>xsimpl>>
  qexists_tac`x`>>fs[]>>xsimpl);

val spec = bot_main_spec |> SPEC_ALL |> UNDISCH_ALL
            |> SIMP_RULE std_ss [STDIO_def] |> add_basis_proj;
val name = "bot_main"

(* ? broken *)
val (semantics_thm,prog_tm) = call_thm st name spec
val cat_prog_def = Define`cat_prog = ^prog_tm`;

val cat_semantics_thm =
  semantics_thm
  |> ONCE_REWRITE_RULE[GSYM cat_prog_def]
  |> DISCH_ALL
  |> SIMP_RULE(srw_ss())[STD_streams_add_stdout,AND_IMP_INTRO,GSYM CONJ_ASSOC]
  |> curry save_thm "cat_semantics_thm";

val _ = export_theory();
