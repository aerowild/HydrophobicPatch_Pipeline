

#How to run in linux command line: python amino.py 
import sys

def numeric_compare(x, y):
  if x[1] > y[1]:
    return -1
  elif x[1] == y[1]:
    return 0
  else:  #x < y
    return 1

#reading pam250 input file
f = open ( 'pam250' , 'r')
pam = [ map(int,line.split(',')) for line in f ]
f.close()

#amino acid array
acids = ['A','R','N','D','C','Q','E','G','H','I','L','K','M','F','P','S','T','W','Y','V']

#GroES
groes="GGIVLTG"

#reading input file
f = open(str(sys.argv[1]), 'r')
lines = [line.strip() for line in f]
f.close

#reversed elements
b = [x[::-1] for x in lines]

#combine input and reversed elements
lines = lines + b

max_val = -99999                #maximum value won't be less than this
all_items = []
for item in lines:
  value = 0
  for i in range(0,7):
    main_index = acids.index(groes[i])
    acid_index = acids.index(item[i])
    if main_index < acid_index :
      main_index, acid_index = acid_index,main_index #swapping
    value+= pam[main_index][acid_index]
  all_items.append([item,value])
  if value > max_val :
    max_val=value
    result = []
    result.append(item)
  elif value == max_val :       #for multiple acids with same value
    result.append(item)

all_items.sort(numeric_compare)


f = open(str((sys.argv[1])[:-6]+"_out"),'w')
for i in all_items:
  f.write(i[0] + ' : ' + str(i[1]) + '\n')
f.close()

