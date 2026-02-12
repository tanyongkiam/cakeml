(*
  Pure functions for the List module.
*)
Theory mllist
Libs
  preamble
Ancestors
  indexedLists[qualified] toto[qualified]
  sorting mergesort

(* ===== TODO: TO BE PORTED TO HOL (better theorems for mergesort_tail) ===== *)
(* ^^^^^ TO BE PORTED TO HOL ^^^^^ *)

Definition sort_def:
  sort = mergesort$mergesort_tail
End

Definition getItem_def:
  (getItem [] = NONE) /\
  (getItem (h::t) = SOME(h, t))
End

Definition nth_def:
  nth l i = EL i l
End

Definition take_def:
  take l i = TAKE i l
End

Definition drop_def:
  drop l i = DROP i l
End

Definition takeUntil_def:
  (takeUntil p [] = []) /\
  (takeUntil p (x::xs) = if p x then [] else x :: takeUntil p xs)
End

Definition dropUntil_def:
  (dropUntil p [] = []) /\
  (dropUntil p (x::xs) = if p x then x::xs else dropUntil p xs)
End

Definition mapi_def:
  (mapi f (n: num) [] = []) /\
  (mapi f n (h::t) = (let y = f n h in (y::(mapi f (n + 1) t))))
End

Definition mapPartial_def:
  (mapPartial f [] = []) /\
  (mapPartial f (h::t) = case (f h) of
    NONE => mapPartial f t
    |(SOME x) => x::mapPartial f t)
End

Definition partition_aux_def:
  (partition_aux f [] pos neg =
    (REVERSE pos, REVERSE neg)) /\
    (partition_aux f (h::t) pos neg = if f h then partition_aux f t (h::pos) neg
      else partition_aux f t pos (h::neg))
End

Definition partition_def:
  partition (f : 'a -> bool) l = partition_aux f l [] []
End

Definition foldl_def:
  (foldl f e [] = e) /\
  (foldl f e (h::t) = foldl f (f h e) t)
End

Definition foldli_aux_def:
  (foldli_aux f e n [] = e) /\
  (foldli_aux f e n (h::t) = foldli_aux f (f n h e) (SUC n) t)
End

Definition foldli_def:
  foldli f e l = foldli_aux f e 0 l
End

(* these definitions are in A normal form in
   order to be able to prove CF specs about them
   (in addition to the translator-generated ones)
   (the CF specs allow more general arguments f) *)

Definition tabulate_aux_def:
  tabulate_aux n m f acc =
    let b = (n >= m) in
    if b then REVERSE acc
    else
      let v = f n in
      let n = n+1n in
      let acc = v::acc in
      tabulate_aux n m f acc
Termination
  wf_rel_tac`measure (λ(n,m,_,_). m-n)`
End

Definition tabulate_def:
  tabulate n f = let l = [] in tabulate_aux 0 n f l
End

Definition collate_def:
  (collate f [] [] = EQUAL) /\
  (collate f [] (h::t) = LESS) /\
  (collate f (h::t) [] = GREATER) /\
  (collate f (h1::t1) (h2::t2) =
    if f h1 h2 = EQUAL
      then collate f t1 t2
    else f h1 h2)
End

Definition cpn_to_reln_def:
  cpn_to_reln f x1 x2 = (f x1 x2 = LESS)
End

(* from std_preludeLib *)
Definition LENGTH_AUX_def:
  (LENGTH_AUX [] n = (n:num)) /\
  (LENGTH_AUX (x::xs) n = LENGTH_AUX xs (n+1))
End

(* tail-recursive MAP *)

Definition map_rev'_def:
  map_rev' f [] acc = acc ∧
  map_rev' f (x :: xs) acc = map_rev' f xs (f x :: acc)
End

Definition map_rev_def:
  map_rev f xs = map_rev' f xs []
End

(* tail-recursive FILTER *)

Definition filter_rev'_def:
  filter_rev' P [] acc = acc ∧
  filter_rev' P (h::t) acc = if P h then filter_rev' P t (h::acc) else filter_rev' P t acc
End

Definition filter_rev_def:
  filter_rev P xs = filter_rev' P xs []
End

(* tail-recursive FLAT *)

Definition flat_rev'_def:
  flat_rev' [] acc = acc ∧
  flat_rev' (x::xs) acc = flat_rev' xs (REV x acc)
End

Definition flat_rev_def:
  flat_rev xs = flat_rev' xs []
End

