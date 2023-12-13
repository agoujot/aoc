let t = [|40; 81; 77; 72|]
let d = [|219; 1012; 1365; 1089|]
let rec di i =
	if i = 4
	then 1
	else
		let rec it x =
			if x = t.(i)
			then 0
			else (if (t.(i)-x)*x > d.(i) then 1 else 0) + it (x+1)
		in it 0 * di (i+1)
let () = print_int (di 0); print_newline()
let t = 40817772
let d = 219101213651089
let rec diB x s = 
	if x = t
	then s
	else diB (x+1) (s+(if (t-x)*x > d then 1 else 0))
let () = print_int (diB 0 0); print_newline()
