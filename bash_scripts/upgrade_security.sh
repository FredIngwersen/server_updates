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
send "(date \"+%H:%M:%S - %d/%m/%Y\" && sudo unattended-upgrade) &>> ~/system_updates/.logs/upgrade.log\r"
sleep 2
expect "assword:"
send "$password\r"
sleep 2
expect "$ "
send "printf \"=%.0s\" {1..100} >> ~/system_updates/.logs/upgrade.log\r"
expect "$ "
send "printf \"\n\" >> ~/system_updates/.logs/upgrade.log\r"
expect "$ "
send "printf \"\n\" >> ~/system_updates/.logs/upgrade.log\r"
expect "$ "
send "exit\r"
interact
