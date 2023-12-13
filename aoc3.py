f = open("aoc3in.txt", "r+t")
g = []
gears = {}
sp = 0
for l in f:
	g.append(l[0:len(l)-1])
def c(x, y):
	ch = get(x, y)
	return not(ch.isdigit()) and ch != "."
def get(x, y):
	if x < 0 or x >= len(g) or y < 0 or y >= len(g[x]):
		return "."
	else:
		return g[x][y]
s = 0
for i in range(len(g)):
	j = 0
	while j < len(g[i]): 
		if g[i][j].isdigit():
			n = g[i][j]
			tc = []
			tc.append([i, j-1])
			tc.append([i-1, j-1]) 
			tc.append([i+1, j-1]) 
			tc.append([i+1, j])
			tc.append([i-1, j])
			j+=1
			while get(i, j).isdigit():
				n+=g[i][j]
				tc.append([i-1, j])
				tc.append([i+1, j])
				j+=1
			tc.append([i-1, j])
			tc.append([i, j])
			tc.append([i+1, j])
			n=int(n)
			ok = False
			for co in tc:
				if c(co[0], co[1]):
					ok = True
				if get(co[0], co[1]) == "*":
					if (co[0], co[1]) in gears.keys():
						gears[(co[0], co[1])].append(n)
					else:
						gears[(co[0], co[1])] = [n]
			if ok:
				s+=n
		else:
			j+=1
for star in gears.keys():
	if len(gears[star]) == 2:
		sp+=gears[star][0]*gears[star][1]
print(s)
print(sp)
