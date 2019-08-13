(* open Base *)

(* module Table = Hashtbl.Make (struct *)
(*   type t = int *)
(*   let equal : int -> int -> bool = fun x y -> x = y [@@inline] *)
(*   let hash x = x [@@inline] *)
(* end) *)

let fib =
  let table  = Hashtbl.create (256) in
  let rec f n =
    match Hashtbl.find_opt table n with 
      | Some x -> x
      | None -> 
        match n with
        | 0 -> 0
        | 1 -> 1
        | n ->
            let r = f (n - 1) + f (n - 2) in
            Hashtbl.add table n r ;
            r 
  in
  f

let fib =
  let table  = Hashtbl.create 1000 in
  let rec f n =
    try Hashtbl.find table n 
    with Not_found -> (
      match n with
      | 0 -> 0
      | 1 -> 1
      | n ->
          let r = f (n - 1) + f (n - 2) in
          Hashtbl.add table n r ;
          r 
    )
  in
  f


let rec fib n =
  match n with
  | 0 -> 0
  | 1 -> 1
  | n -> fib (n - 1) + fib (n - 2)



(* let _ =  *)
(*   let n = int_of_string (Sys.argv.(1)) in *)
(*   let r = fib n in *)
(*   Printf.printf "fib(%d) = %d\n" n r *)

let () =
  let iteration_count = 200 in
  (* let ms = ref 0.0 in  *)
  let rec loop = function
    | 1 -> ()
    | i ->
      let _ = fib 30 in
      loop (i-1)
  in
  loop iteration_count

(* for _ = 1 to (int_of_float iteration_count) do *)
(* let start = Unix.gettimeofday () in *)
(* let stop = Unix.gettimeofday () in *)
(* ms := ((stop -. start) *. 1000.0) *)
(* done; *)
(* Printf.printf "Execution time: %fms\n%!" (!ms /. iteration_count); *)
