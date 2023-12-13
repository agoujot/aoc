f = open("aoc2in.txt", "r+t")
s = 0
i = 1
sp = 0
for l in f:
	ok = True
	l = l.split(":")
	l = l[1].split(";")
	maxi = [0, 0, 0]
	for t in l:
		t = t.split(",")
		for d in t:
			d = d.split()
			if d[1] == "red":
				if int(d[0]) > 12:
					ok = False
				if int(d[0]) > maxi[0]:
					maxi[0] = int(d[0])
			elif d[1] == "green":
				if int(d[0]) > 13:
					ok = False
				if int(d[0]) > maxi[1]:
					maxi[1] = int(d[0])
			else:
				if int(d[0]) > 14:
					ok = False
				if int(d[0]) > maxi[2]:
					maxi[2] = int(d[0])
	sp+=maxi[0]*maxi[1]*maxi[2]				
	if ok:
		s+=i
	i+=1
print(s)
print(sp)
