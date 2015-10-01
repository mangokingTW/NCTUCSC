#!/bin/bash -ev

if [[ $(uname -r) == *"kali"* ]]
then
	echo "Update source list of Kali Linux"
	echo "deb http://http.kali.org/kali sana main non-free contrib" > /etc/apt/sources.list
	echo "deb http://security.kali.org/kali-security sana/updates main non-free contrib" >> /etc/apt/sources.list
fi
apt-get update
apt-get install xinetd -y
./build_xinetd_service.sh can_you_type.py 5566
