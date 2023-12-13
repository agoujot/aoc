from math import floor
f = open("aoc4in.txt", "r+t")
s = 0
cs = []
def inter(a, b):
	return (sum([1 if e in a else 0 for e in b]))
for l in f:
	t = l.split(":")[1].split("|")
	t[0], t[1] = t[0].split(), t[1].split()
	a= inter(t[0], t[1])
	cs.append(a)
	s+=floor(2**(a-1))
print(s)
t = 0
def cop(i):
	if cs[i] == 0:
		return 1
	else:
		so = 0
		for j in range(i+1, i+cs[i]+1):
			so+=cop(j)
		return so+1
for it in range(len(cs)):
	t+=cop(it)
print(t)
