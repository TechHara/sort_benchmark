trap "exit" INT
N=10

# prepare input file
FILE=input.tsv
if [[ ! -f "$FILE" ]]; then
    echo "downloading input file"
    curl https://datasets.imdbws.com/title.basics.tsv.gz | gunzip > input.tsv
fi
for n in `seq $N`; do
    FILE=input_$n.tsv
    if [[ ! -f "$FILE" ]]; then
        echo "generating $FILE"
        shuf input.tsv | head -n ${n}00000 > $FILE
    fi
done

# build programs
make -j

# run benchmark
for exec in ./c ./cc ./rust "java -Dfile.encoding=UTF-8 Main" "python3 src/main.py" ./cs/cs "node src/main.js"; do 
    TAG=$(basename `echo ${exec} | awk '{print $1}'`)
    LOGi=${TAG}_instr
    LOGt=${TAG}_time
    echo "$TAG" > "$LOGi"
    echo "$TAG" > "$LOGt"
    for n in `seq $N`; do    
        INPUT=input_$n.tsv
        OUTPUT=output_${TAG}_${n}.tsv
        echo "running $TAG:$n"
        
        perf stat -e instructions taskset -c 0 $exec $INPUT $OUTPUT 2>&1 | grep instructions | awk '{print $1}' >> "${LOGi}"
        /usr/bin/time -v taskset -c 0 $exec $INPUT $OUTPUT 2>&1 | grep wall | awk '{print $8}' | cut -f2 -d: >> "${LOGt}"
    done
done

# verify sorted result
for n in `seq $N`; do
    if md5sum output_*_${n}.tsv | awk '{print $1}' | sort | uniq | wc -l | grep -Fxq 1; then 
        echo "results verified for n=$n"
    fi
    rm output_*_${n}.tsv
done

# create tables
echo
paste *_instr > instructions.tsv
paste *_time > time.tsv
rm *_instr *_time
echo "generated instructions.tsv and time.tsv files"