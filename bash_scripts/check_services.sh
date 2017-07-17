#!/usr/bin/expect -f

# Will check which upgraded processes need restarting
# Then write to a log file

# Getting inforamtion as argument
set username [lindex $argv 0];
set address [lindex $argv 1];
set port [lindex $argv 2];
set password [lindex $argv 3];

spawn ssh $username@$address -p $port
expect "assword:"
send "$password\r"
expect "$ "
send "sudo checkrestart | grep -E \"Found|distinct\" &&
     echo \"These are the systemd services:\" &&
     sudo checkrestart | grep \"systemctl restart\" &&
     echo \"These are the initd scripts:\" &&
     sudo checkrestart | grep ^\"service\" | grep \"restart\r"
sleep 1
expect "assword:"
send "$password\r"
expect "$ "
send "(date \"+%H:%M:%S - %d/%m/%Y\" &&
     sudo checkrestart | grep -E \"Found|distinct\" &&
     echo \"These are the systemd services:\" &&
     sudo checkrestart | grep \"systemctl restart\" &&
     echo \"These are the initd scripts:\" &&
     sudo checkrestart | grep ^\"service\" | grep \"restart\"$)
      &>> ~/system_updates/.logs/service_checks.log\r"
sleep 1
expect "$ "
send "printf \"=%.0s\" {1..100} &>> ~/system_updates/.logsservice_check.log\r"
expect "$ "
send "printf \"\n\" &>> ~/system_updates/.logsservice_check.log\r"
expect "$ "
send "printf \"\n\" &>> ~/system_updates/.logsservice_check.log\r"
sleep 1
expect "$ "
send "exit\r"
interact
