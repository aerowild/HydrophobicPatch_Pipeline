import sys

filename = str(sys.argv[1])[:-8]

f = open ( str(sys.argv[1]) , 'r')
out = [ line.split() for line in f ]
f.close()

for a in out : 
	a.remove(':')
	a[1] = int(a[1])
#print out


f = open ( filename+"patch.txt" , 'r')
patch = [ line.split() for line in f ]
f.close()

for a in patch : 
	a[1] = float(a[1])

#print patch

f = open(filename+".combined.txt",'w')

for a in out :
	normal = a[0]
	reverse = (a[0])[::-1]
	for b in patch : 
		if normal==b[0] or reverse==b[0] :
			f.write(normal + ' ' + str(a[1]) + ' ' + str(b[1]) + '\n')
			break

f.close()


