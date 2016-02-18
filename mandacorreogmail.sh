#!/bin/bash

DEST="XXXXXXXXXXXXX@gmail.com"
IFACE=ppp0

	sudo exim -bp | sudo exiqgrep -i | sudo xargs exim -Mrm
	sleep 120
	IPLOC=`sudo ifconfig $IFACE 2>&1|grep addr:|cut -d : -f 2|cut -d " " -f 1`

	if [ "$IPLOC" != "" ]
	then
       	 echo "$IPLOC" | /usr/bin/mail -s "ASUNTO" $DEST
       	 sudo exim -qff
	fi

exit
