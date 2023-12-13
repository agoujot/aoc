let f = "aoc1in.txt"
let rec rev s =
	if s = ""
	then ""
	else (String.make 1 (s.[String.length s - 1]))^rev(String.sub s 0 (String.length s - 1))
let ic = open_in f
let rec explode s i=
	if i = String.length s
	then []
	else s.[i]::explode s (i+1)
let rec di x =
	let l = input_line ic in
	let r = rev l in
	let rec it s =
		match s with
		| [] -> '_'
		| 'o'::'n'::'e'::b -> '1'
		| 'e'::'n'::'o'::b -> '1'
		| 't'::'w'::'o'::b -> '2'
		| 'o'::'w'::'t'::b -> '2'
		| 't'::'h'::'r'::'e'::'e'::b -> '3'
		| 'e'::'e'::'r'::'h'::'t'::b -> '3'
		| 'f'::'o'::'u'::'r'::b -> '4'
		| 'r'::'u'::'o'::'f'::b -> '4'
		| 'f'::'i'::'v'::'e'::b -> '5'
		| 'e'::'v'::'i'::'f'::b -> '5'
		| 's'::'i'::'x'::b -> '6'
		| 'x'::'i'::'s'::b -> '6'
		| 's'::'e'::'v'::'e'::'n'::b -> '7'
		| 'n'::'e'::'v'::'e'::'s'::b -> '7'
		| 'e'::'i'::'g'::'h'::'t'::b -> '8'
		| 't'::'h'::'g'::'i'::'e'::b -> '8'
		| 'n'::'i'::'n'::'e'::b -> '9'
		| 'e'::'n'::'i'::'n'::b -> '9'
		| a::b -> if '0' <= a && a<= '9' then a else it b
	in let res = (x+(int_of_string (String.make 1 (it (explode l 0))^String.make 1 (it (explode r 0))))) in (print_int res; print_newline(); di res)
let () = di 0
