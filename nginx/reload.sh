#!/bin/sh
nginx "$@"
oldcksum=`find /etc/nginx/conf.d -type f -exec md5sum {} \; | sort -k 2 | md5sum`

while true; do

    sleep 300

	newcksum=`find /etc/nginx/conf.d -type f -exec md5sum {} \; | sort -k 2 | md5sum`
	if [ "$newcksum" != "$oldcksum" ]; then
		echo "At ${time} on ${date}, config file update detected."
		oldcksum=$newcksum
		nginx "$@" -s reload
	fi

done
