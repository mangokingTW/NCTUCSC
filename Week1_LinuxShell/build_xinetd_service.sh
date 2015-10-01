#!/bin/bash -ev

if [ $# != 2 ];then
	echo "[Usage] $0 (binary) (port)"
	exit
fi
if [ ! -f $1 ];then
	echo "File not exist"
	exit
fi

name=${1/'.'/'_'}
cp $1 /var/www/$name
chmod +x /var/www/$name
printf "\
service $name
{
	disable		= no
	socket_type	= stream
	protocol	= tcp
	user		= root
	port		= $2
	wait		= no
	server		= /var/www/$name
}                                                                              
" > /etc/xinetd.d/$name
echo "$name $2/tcp" >> /etc/services
service xinetd restart
