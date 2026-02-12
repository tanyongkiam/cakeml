Theory location

Datatype: locn = UNKNOWNpt | EOFpt | POSN num num
End

Definition locnrow_def:
  locnrow (POSN r c) = r
End
val _ = add_record_field ("row", “locnrow”)

Definition locn_rowupdate_def:
  locn_rowupdate f (POSN r c) = POSN (f r) c
End
val _ = add_record_fupdate ("row", “locn_rowupdate”)

Definition locncol_def:
  locncol (POSN r c) = c
End
val _ = add_record_field ("col", “locncol”)
Definition locn_colupdate_def:
  locn_colupdate f (POSN r c) = POSN r (f c)
End
val _ = add_record_fupdate ("col", “locn_colupdate”)

Datatype: locs = Locs locn locn
End

Definition default_loc_def:
  default_loc = POSN 0 0
End

Definition start_locs_def: start_locs = Locs default_loc default_loc
End

Overload end_locn[local] = “EOFpt”
Overload unknown_locn[local] = “UNKNOWNpt”

Definition unknown_loc_def:
  unknown_loc = Locs unknown_locn unknown_locn
End

Definition locnle_def:
  locnle l1 l2 <=>
    l1 = l2 ∨ (* reflexivity, for free *)
    l1 = unknown_locn ∨ (* minimal element *)
    l2 = end_locn ∨ (* maximal element *)
    (* otherwise compare row and col lexicographically*)
    l2 ≠ unknown_locn ∧ l1 ≠ end_locn ∧
    (l1.row < l2.row ∨ l1.row = l2.row ∧ l1.col < l2.col)
End

(* for debugging *)

Definition map_loc_def[simp]:
  (map_loc [] _ = []) /\
  (map_loc (h :: t) n =
    (h, Locs (POSN 0 n) (POSN 0 n)) :: map_loc t (n+1))
End

