#!/usr/bin/expect -f

# This script runs the system_update_check.py file

# Getting inforamtion as argument
set username [lindex $argv 0];
set address [lindex $argv 1];
set port [lindex $argv 2];
set password [lindex $argv 3];
set script_path [lindex $argv 4];

spawn ssh $username@$address -p $port nohup python $script_path
expect "assword:"
send "$password\r"
interact
