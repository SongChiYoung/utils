$a=1
while($a -lt 10)
{
 .\adb shell taskset 4 sh '/data/util.sh & /data/simpleperf stat -e cpu-cycles,instructions,raw-instruction-retired,cache-references,cache-misses,raw-mem-access,raw-bus-access,raw-stall-frontend,raw-stall-backend -a --duration 0.1 --cpu 3 --csv'
}
