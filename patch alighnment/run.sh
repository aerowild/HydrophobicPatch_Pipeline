for f in *.patch
do
  python amino.py $f
done
mv *_out out/
