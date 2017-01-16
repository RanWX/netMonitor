#!/bin/bash
FILENAME=config.txt
i=0
j=0
k=0
while read line
do   

    if (( $i == 0 ));then
        ipLine=$line
        ip=${ipLine#*:}
#        echo $ip
    fi
    if (( $i%2 == 1 )); then
   	    # echo $line
    	arraySize[$j]=${line#*:}

    	j=`expr $j + 1`
    	#statements
    fi
    if (( $i%2 == 0 && $i != 0 )); then
   	    # echo $line
    	arrayCount[$k]=${line#*:}
    	k=`expr $k + 1`
    fi
   i=`expr $i + 1`
done < $FILENAME

n=0
while [ $n -lt $k ]; do
	m=0
	while [ $m -lt ${arrayCount[$n]} ]; do
        cmd=$ip${arraySize[$n]}
        echo $cmd
        nohup ./runCmd.sh $cmd &
        let m=m+1   
    done 
	let n=n+1
done 
