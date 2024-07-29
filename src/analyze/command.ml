open Log

(* Parse command line arguments *)
let parse_args () =
  let log_level = ref NOLOG in
  let speclist = [
    ("-log", Arg.String (fun s -> match String.lowercase_ascii s with
      | "debug" -> log_level := DEBUG
      | "info" -> log_level := INFO
      | _ -> failwith "Unknown log level"
    ), "Set log level (debug, info)")
  ] in
  let usage_msg = "Usage: my_program [options]" in
  Arg.parse speclist (fun _ -> ()) usage_msg;
  !log_level

let option () =
  let log_level = parse_args () in
  set_log_level log_level;