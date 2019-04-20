(* open Base *)

(* module Table = Hashtbl.Make (struct *)
(*   type t = int *)
(*   let equal : int -> int -> bool = fun x y -> x = y [@@inline] *)
(*   let hash x = x [@@inline] *)
(* end) *)

(* let fib = *)
(*   let table  = Hashtbl.create (module Int) in *)
(*   let rec f n = *)
(*     match Hashtbl.find table n with  *)
(*       | Some x -> x *)
(*       | None ->  *)
(*         match n with *)
(*         | 0 -> 0 *)
(*         | 1 -> 1 *)
(*         | n -> *)
(*             let r = f (n - 1) + f (n - 2) in *)
(*             (* Table.add table n r ; *) *)
(*             r  *)
(*   in *)
(*   f *)

let fib =
  (* let table  = Array.make 30 0 in *)
  let rec f n =
    (* let _ = table.(0) in *)
    let _ = 324 mod 3 in
    match n with
    | 0 -> 0
    | 1 -> 1
    | n ->
      let r = f (n - 1) + f (n - 2) in
      (* Table.add table n r ; *)
      r 
  in
  f

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
