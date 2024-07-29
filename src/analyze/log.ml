(* Define log levels *)
type log_level = NOLOG | DEBUG | INFO

(* Current log level *)
let current_log_level = ref INFO

(* Set the current log level *)
let set_log_level level =
  current_log_level := level

(* Logging function with log level *)
let log level message =
  let should_log = match level, !current_log_level with
    | DEBUG, DEBUG -> true
    | INFO, (DEBUG | INFO) -> true
    | _ -> false
  in
  if should_log then
    print_endline (Printf.sprintf "[%s] %s" (match level with
      | DEBUG -> "DEBUG"
      | INFO -> "INFO"
      | NOLOG -> "NOLOG"
    ) message)
