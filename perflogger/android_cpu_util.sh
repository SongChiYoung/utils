RR=`cat /proc/stat | head -n 30`
CHK=1
NUM=0
NAME=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
USER=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
NICE=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
SYSTEM=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
IDLE=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
IOWAIT=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
IRQ=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
SOFT=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
STEAL=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
GUEST=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)

#cpu_info->user, cpu_info->nice, cpu_info->system, cpu_info->idle, cpu_info    ->iowait,cpu_info->irq, cpu_info->softirq, cpu_info->steal, cpu_info->guest);

for i in $RR
do
	if [ $CHK -eq 1 ]
	then
		if [[ "$i" == "cpu"* ]]; then
			CHK=2
			NAME[$NUM]=$i
		else
			#echo "done..."
			break
		fi	

	elif [ $CHK -eq 2 ] 
	then
		CHK=3
		USER[$NUM]=$i		
	elif [ $CHK -eq 3 ] 
	then
		CHK=4
		NICE[$NUM]=$i
	elif [ $CHK -eq 4 ] 
	then
		CHK=5
		SYSTEM[$NUM]=$i

	elif [ $CHK -eq 5 ] 
	then
		CHK=6
		IDLE[$NUM]=$i
	elif [ $CHK -eq 6 ] 
	then
		CHK=7
		IOWAIT[$NUM]=$i
	elif [ $CHK -eq 7 ] 
	then
		CHK=8
		IRQ[$NUM]=$i

	elif [ $CHK -eq 8 ] 
	then
		CHK=9
		SOFT[$NUM]=$i

	elif [ $CHK -eq 9 ] 
	then
		CHK=10
		STEAL[$NUM]=$i

	elif [ $CHK -eq 10 ] 
	then
		CHK=11
		GUEST[$NUM]=$i
	elif [ $CHK -eq 11 ]
	then
		CHK=1
		NUM=$((NUM+1))
	fi
	
done


OLD=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
OLD_IDL=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
for i in $(seq 0 1 $((NUM-1)))
do
	OLD[$i]=$((USER[$i]+NICE[$i]+SYSTEM[$i]+IDLE[$i]+IOWAIT[$i]+IRQ[$i]+SOFT[$i]+STEAL[$i]+GUEST[$i]))
	OLD_IDL[$i]=${IDLE[$i]}
done

sleep 0.1

RR=`cat /proc/stat | head -n 30`
CHK=1
NUM=0
NAME=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
USER=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
NICE=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
SYSTEM=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
IDLE=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
IOWAIT=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
IRQ=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
SOFT=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
STEAL=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
GUEST=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)

#cpu_info->user, cpu_info->nice, cpu_info->system, cpu_info->idle, cpu_info    ->iowait,cpu_info->irq, cpu_info->softirq, cpu_info->steal, cpu_info->guest);

for i in $RR
do
	if [ $CHK -eq 1 ]
	then
		if [[ "$i" == "cpu"* ]]; then
			CHK=2
			NAME[$NUM]=$i
		else
			#echo "done..."
			break
		fi	

	elif [ $CHK -eq 2 ] 
	then
		CHK=3
		USER[$NUM]=$i		
	elif [ $CHK -eq 3 ] 
	then
		CHK=4
		NICE[$NUM]=$i
	elif [ $CHK -eq 4 ] 
	then
		CHK=5
		SYSTEM[$NUM]=$i

	elif [ $CHK -eq 5 ] 
	then
		CHK=6
		IDLE[$NUM]=$i
	elif [ $CHK -eq 6 ] 
	then
		CHK=7
		IOWAIT[$NUM]=$i
	elif [ $CHK -eq 7 ] 
	then
		CHK=8
		IRQ[$NUM]=$i

	elif [ $CHK -eq 8 ] 
	then
		CHK=9
		SOFT[$NUM]=$i

	elif [ $CHK -eq 9 ] 
	then
		CHK=10
		STEAL[$NUM]=$i

	elif [ $CHK -eq 10 ] 
	then
		CHK=11
		GUEST[$NUM]=$i
	elif [ $CHK -eq 11 ]
	then
		CHK=1
		NUM=$((NUM+1))
	fi
	
done


NEW=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
NEW_IDL=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
for i in $(seq 0 1 $((NUM-1)))
do
	NEW[$i]=$((USER[$i]+NICE[$i]+SYSTEM[$i]+IDLE[$i]+IOWAIT[$i]+IRQ[$i]+SOFT[$i]+STEAL[$i]+GUEST[$i]))
	NEW_IDL[$i]=${IDLE[$i]}
done

for i in $(seq 0 1 $((NUM-1)))
do
	#echo ${NAME[$i]}" IDLE,""$((((NEW_IDL[$i]-OLD_IDL[$i])*100)/(NEW[$i]-OLD[$i])))""%"
	echo ${NAME[$i]}" UTIL,""$((100-$((((NEW_IDL[$i]-OLD_IDL[$i])*100)/(NEW[$i]-OLD[$i])))))""%"
	#echo ${NAME[$i]}" USAGE : "`echo "scale=3;100-(($((NEW_IDL[$i]))-$((OLD_IDL[$i])))*100)/($((NEW[$i]))-$((OLD[$i])))" | bc`"%"
done

