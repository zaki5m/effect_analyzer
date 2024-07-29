open Log

let trace_optimize = ref true

(* Parse command line arguments *)
let parse_args () =
  let log_level = ref NOLOG in
  let opt = ref true in
  let speclist = [
    (* logの有無 *)
    ("-log", Arg.String (fun s -> match String.lowercase_ascii s with
      | "debug" -> log_level := DEBUG
      | "info" -> log_level := INFO
      | _ -> failwith "Unknown log level"
    ), "Set log level (debug, info)");
    (* 最適化の有無 *)
    ("-noopt", Arg.Unit (fun () -> opt := false), "Optimize trace")
  ] in
  let usage_msg = "Usage: my_program [options]" in
  Arg.parse speclist (fun _ -> ()) usage_msg;
  set_log_level !log_level;
  trace_optimize := !opt

let option () =
  parse_args ()