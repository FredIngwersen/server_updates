#!/usr/bin/expect -f

# This is a very simple script to make a directory if it doesn't exist
# Python will feed in the arguments

# Getting inforamtion as argument
# yes, getting passwords as arguments is not smart, though this script won't run manually, only through Python
set username [lindex $argv 0];
set address [lindex $argv 1];
set port [lindex $argv 2];
set password [lindex $argv 3];

spawn ssh $username@$address -p $port mkdir -p system_updates
expect "assword:"
send "$password\r"
interact
