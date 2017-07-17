#!/usr/bin/expect -f

# Will install security updates only

# Getting inforamtion as arguments
set username [lindex $argv 0];
set address [lindex $argv 1];
set port [lindex $argv 2];
set password [lindex $argv 3];

spawn ssh $username@$address -p $port
expect "assword:"
send "$password\r"
expect "$ "
send "sudo apt-get -s dist-upgrade | grep \"^Inst\" |
     grep -i securi | awk -F \" \" {'print $2'} |
     xargs apt-get install\r"
sleep 2
expect "assword:"
send "$password\r"
sleep 2
send "exit\r"
interact
