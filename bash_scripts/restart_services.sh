#!/usr/bin/expect -f

# Will restart all the services
# Then write a log

# Getting inforamtion as argument
set username [lindex $argv 0];
set address [lindex $argv 1];
set port [lindex $argv 2];
set password [lindex $argv 3];

spawn ssh $username@$address -p $port
expect "assword:"
send "$password\r"
expect "$ "
send "sudo checkrestart | grep ^\"service\" | grep \"restart\"$ > ~/system_updates/restart_services.sh\r"
expect "assword:"
send "$password\r"
sleep 1
send "sed -i -e \"s/^/sudo /\" ~/system_updates/restart_services.sh\r"
expect "$ "
send "echo '#!/usr/bin/bash' | cat - ~/system_updates/restart_services.sh > temp && mv temp ~/system_updates/restart_services.sh\r"
expect "$ "
send "chmod +x ~/system_updates/restart_services.sh\r"
expect "$ "
send "(bash ~/system_updates/restart_services.sh) &>> ~/system_updates/.logs/restart_services.log\r"
expect "$ "
send "exit\r"
interact
