#!/usr/bin/expect -f

# Will install python2 and python3
# Python will feed in the arguments

# Getting inforamtion as argument
set username [lindex $argv 0];
set address [lindex $argv 1];
set port [lindex $argv 2];
set password [lindex $argv 3];

spawn ssh $username@$address -p $port
expect "assword:"
send "$password\r"
expect "$ "
send "sudo apt-get install -y python python3\r"
sleep 2
expect "assword:"
send "$password\r"
sleep 2
send "exit\r"
interact
