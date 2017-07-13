#!/usr/bin/expect -f

# This script runs the "check_services.sh" file on the remote machine

# Getting inforamtion as argument
set username [lindex $argv 0];
set address [lindex $argv 1];
set port [lindex $argv 2];
set password [lindex $argv 3];
set script_path [lindex $argv 4];

spawn ssh $username@$address -p $port 'bash -s' < $script_path
expect "assword:"
send "$password\r"
interact
