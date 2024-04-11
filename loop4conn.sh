

while [ 1 == 1 ];
do
	ping -c 1 -W 1 8.8.8.8 > /dev/null
	#ping -c 1 -W 1 192.168.2.2 > /dev/null
	err=$?
	#echo err $err
	if [ "$err" == "0" ]; then
		echo connection alive
		beep; beep; beep; beep
		break
	fi
	#echo -n -e \\b\\b\\b\\b\\b\\bno conn
	echo -n -e \\rNo connection at $(date)
	sleep 60
done
