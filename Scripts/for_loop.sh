#!/usr/bin/env bash
FILE=E_vs_ecut.dat 
echo "This is a FOR loop"
for i in 1 2 3 
do                #for NAME in LIST; do ... done
   NEWFILE="${FILE}_$i"
   echo "Using variable $i inside a loop: " $NEWFILE
   echo
done

echo 'Ranges can also be specified using "for i in {0..3}" '



i=20

echo "This is a WHILE loop"
while [ $i -ge 5 ]
do
  echo Number: $i
  let "i-=5" 
done

echo
echo "This is a FOR loop over strings"
for element in Hydrogen Helium Lithium Beryllium
do
  echo "Element: $element"
done
