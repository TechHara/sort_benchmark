LC_ALL=C

echo sort
for n in `seq 10`; do perf stat -e instructions sort --parallel 1 -o output input_$n.tsv 2>&1 | grep instructions | gawk '{print $1}' ; done
for n in `seq 10`; do /usr/bin/time -v sort --parallel 1 -o output input_$n.tsv 2>&1 | grep wall | gawk '{print $8}' | cut -f2 -d: ; done

echo target/release/sort_line
for n in `seq 10`; do perf stat -e instructions target/release/sort_line input_$n.tsv ouptut 2>&1 | grep instructions | gawk '{print $1}' ; done
for n in `seq 10`; do /usr/bin/time -v target/release/sort_line input_$n.tsv output 2>&1 | grep wall | gawk '{print $8}' | cut -f2 -d: ; done