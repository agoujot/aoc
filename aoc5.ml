type ens = {s:int; e:int}
let rec split s c i =
	if i = String.length s
	then [s]
	else
		if s.[i] = c
		then String.sub s 0 (i)::split (String.sub s (i+1) (String.length s - i - 1)) c 0
		else split s c (i+1)
let pie x = print_int x; print_newline()
let thws s = int_of_string (String.sub s (if s.[0] = ' ' then 1 else 0) (String.length s - (if s.[0] = ' ' then 1 else 0) - (if s.[String.length s - 1] = ' ' then 1 else 0)))
let f = "aoc5in.txt"
let ic = open_in f
let rec read() =
	try
	let l = input_line ic in l::(read())
	with _ -> []
let t = read()(*test: ["seeds: 1 100"; ""; "blabla"; "110 10 10"; "250 50 10"]*)
let s1 = List.hd(t)
let s2 = split s1 ':' 0 
let s3 = List.hd(List.tl(s2))
let s4 = split s3 ' ' 0 
let s5 = List.map thws (List.tl s4)
let rec bt l =
	match l with
	| [] -> []
	| a::b::c -> {s=a; e=a+b-1}::bt c
	| _ -> assert false
let seeds = bt s5
let rec lsub l i =
	if i = 0 then l else lsub (List.tl l) (i-1)
let rec lk l =
	match l with
	| [] -> []
	| ""::_ -> let rec un l_ = 
				match l_ with
				| [] -> []
				| ""::_ -> []
				| i::s -> Array.of_list(let sp = split i ' ' 0 in (List.map thws sp))::un s
				in let m = un (lsub l 2) in m :: lk (lsub l (2+List.length m))
	| _ -> assert false
let ms = lk (List.tl t)
let inter r1 r2 ad =
	if r1.s >= r2.e || r2.s >= r1.e
	then ([r2], [])
	else ([{s=(max r1.s r2.s)+ad; e=(min r1.e r2.e)+ad}], (if r1.e < r2.e then [{s=r1.e+1; e=r2.e}] else [])@(if r2.s < r1.s then [{s=r2.s; e=r1.s-1}] else []))
let rec it l fo =
	match l with
	| [] -> ([], [])
	| i::s -> let d = fo i and d_ = it s fo in (fst(d)@fst(d_), snd(d)@snd(d_))
let rec om l ra =
	match l with
	| [] -> ([ra], [])
	| i::s -> let inte = inter {s=i.(1); e=i.(1)+i.(2)-1} ra (i.(0)-i.(1)) in if inte = ([ra], []) then om s ra else inte
let rec di l v =
	match l with
	| [] -> v
	| i::s -> let rec di_ v_ =
				let nv = it v_ (om i) in 
				if snd(nv) = []
				then fst(nv)
				else fst(nv)@di_ (snd(nv))
			in di s (di_ v)
let rec fm l m = 
	match l with
	| [] -> m
	| i::s -> if i.s < m then fm s (i.s) else fm s m
let () = pie (fm (di ms seeds) max_int)
