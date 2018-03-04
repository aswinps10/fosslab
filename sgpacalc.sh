#!/bin/bash

pdftotext -layout result_MDL.pdf s1.txt

tr -d '\040\011\012\015\014\054'< s1.txt> s1_1.txt

sed -i 's/MDL16CS/\nMDL16CS/g' s1_1.txt
sed -i "s/ELECTRONICS/\nELECTRONICS/g" s1_1.txt

grep MDL16CS s1_1.txt > s1cs.txt


sed -i "s/MA101(/ /g" s1cs.txt
sed -i "s/PH100(/ /g" s1cs.txt
sed -i "s/BE110(/ /g" s1cs.txt
sed -i "s/BE10105(/ /g" s1cs.txt
sed -i "s/BE103(/ /g" s1cs.txt
sed -i "s/EE100(/ /g" s1cs.txt
sed -i "s/PH110(/ /g" s1cs.txt
sed -i "s/EE110(/ /g" s1cs.txt
sed -i "s/CS110(/ /g" s1cs.txt
sed -i "s/)/ /g" s1cs.txt


sed -i "s/O/10/g" s1cs.txt
sed -i "s/A+/9/g" s1cs.txt
sed -i "s/A/8.5/g" s1cs.txt
sed -i "s/B+/8/g" s1cs.txt
sed -i "s/B/7/g" s1cs.txt
sed -i "s/C/6/g" s1cs.txt
sed -i "s/P/5/g" s1cs.txt
sed -i "s/F/0/g" s1cs.txt


sed -i "s/166/16C/g" s1cs.txt

grep -v "ELE6TR10NI6S" s1cs.txt > gradeps1.txt


pdftotext -layout result_MDLS2.pdf s2.txt


tr -d '\040\011\012\015\014\054'< s2.txt> s2_1.txt

sed -i 's/MDL16CS/\nMDL16CS/g' s2_1.txt
sed -i "s/ELECTRONICS/\nELECTRONICS/g" s2_1.txt

grep MDL16CS s2_1.txt > s2cs.txt


sed -i "s/EC100(/ /g" s2cs.txt
sed -i "s/CY100(/ /g" s2cs.txt
sed -i "s/BE100(/ /g" s2cs.txt
sed -i "s/CY110(/ /g" s2cs.txt
sed -i "s/EC110(/ /g" s2cs.txt
sed -i "s/MA102(/ /g" s2cs.txt
sed -i "s/BE102(/ /g" s2cs.txt
sed -i "s/CS100(/ /g" s2cs.txt
sed -i "s/CS120(/ /g" s2cs.txt
sed -i "s/)/ /g" s2cs.txt

sed -i "s/O/10/g" s2cs.txt
sed -i "s/A+/9/g" s2cs.txt
sed -i "s/A/8.5/g" s2cs.txt
sed -i "s/B+/8/g" s2cs.txt
sed -i "s/B/7/g" s2cs.txt
sed -i "s/C/6/g" s2cs.txt
sed -i "s/P/5/g" s2cs.txt
sed -i "s/F/0/g" s2cs.txt


sed -i "s/166/16C/g" s2cs.txt

grep -v "ELE6TR10NI6S" s2cs.txt > gradeps2.txt

>gpas1.txt

mapfile<s1cs.txt

for i in `seq 0 122`
do
  temp=(${MAPFILE[$i]})
  sum=$(printf "%.1f" "$(echo "((${temp[1]} *4) + (${temp[2]} * 4) + (${temp[3]} * 3) + (${temp[4]} * 3) + (${temp[5]} *3) + (${temp[6]} *3) + (${temp[7]}) + ${temp[8]} + ${temp[9]})/23"|bc -l)")
  echo "$sum" >> gpas1.txt
done

paste s1cs.txt gpas1.txt> sgpas1.txt


>gpas2.txt

sed -i 's/T6E16CS006/\nT6E16CS006/g' s2cs.txt

grep -v "T6E16CS" s2cs.txt> temps2cs.txt


mapfile < temps2cs.txt

for i in `seq 0 122`
do
  tmp=(${MAPFILE[$i]})
  sum=$(printf "%.1f" "$(echo "((${tmp[1]} *4) + (${tmp[2]} * 4) + (${tmp[3]} * 3) + (${tmp[4]} * 1) + (${tmp[5]} *1) + (${tmp[6]} *4) + (${tmp[7]} *3) + (${tmp[8]} *3) + ${tmp[9]})/24"|bc -l)")
  echo "$sum" >> gpas2.txt
done


paste temps2cs.txt gpas2.txt> sgpas2.txt


