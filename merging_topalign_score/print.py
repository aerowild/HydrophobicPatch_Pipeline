import glob
import sys
path = str(sys.argv[1])+"/*combined*"

for fname in glob.glob(path):
	with open(fname, 'r') as f:
		data = [line.strip() for line in f]
#		print name[2:]
		res = []
		for item in data:
			a = item.split(" ")
			a[1] = int(a[1])
			if a[1] >=12 :
				res.append(a)
		if len(res) > 0 :
			print fname[2:-13]
			for items in res:
				print items[0],items[1],items[2]
