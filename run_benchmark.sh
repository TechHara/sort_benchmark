LC_ALL=C
exec=$1

#echo sort
#for n in `seq 10`; do perf stat -e instructions sort --parallel 1 -o output input_$n.tsv 2>&1 | grep instructions | gawk '{print $1}' ; done
#for n in `seq 10`; do /usr/bin/time -v sort --parallel 1 -o output input_$n.tsv 2>&1 | grep wall | gawk '{print $8}' | cut -f2 -d: ; done

for n in `seq 10`; do perf stat -e instructions $exec input_$n.tsv ouptut 2>&1 | grep instructions | gawk '{print $1}' ; done
for n in `seq 10`; do /usr/bin/time -v $exec input_$n.tsv output 2>&1 | grep wall | gawk '{print $8}' | cut -f2 -d: ; done
