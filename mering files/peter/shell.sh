FILES=$1
for file in $FILES*_out*
do
  python combine.py $file
done

