#!/usr/bin/expect -f

# This script will use bash's "scp" command to copy the desired files
# to the remote host

# Getting inforamtion as argument
set username [lindex $argv 0];
set address [lindex $argv 1];
set port [lindex $argv 2];
set password [lindex $argv 3];
set lPath [lindex $argv 4];
set rPath [lindex $argv 5];

spawn bash -c "scp -P $port $lPath $username@$address:$rPath"
expect "assword:"
send "$password\r"
interact
