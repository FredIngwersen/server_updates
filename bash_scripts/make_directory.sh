#!/usr/bin/expect -f

# Will make directories if they don't exist

# Getting inforamtion as argument
set username [lindex $argv 0];
set address [lindex $argv 1];
set port [lindex $argv 2];
set password [lindex $argv 3];

spawn ssh $username@$address -p $port mkdir -p system_updates .logs
expect "assword:"
send "$password\r"
interact
