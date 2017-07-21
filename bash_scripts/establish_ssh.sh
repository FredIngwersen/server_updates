#!/usr/bin/expect -f

# Will establish ssh-key if not found

# Getting inforamtion as argument
set username [lindex $argv 0];
set address [lindex $argv 1];
set port [lindex $argv 2];
set password [lindex $argv 3];

spawn ssh -q $username@$address -p $port
expect {
  "(yes/no)?" {
    send "yes\r"
  }
  "assword:"{
  }
}
expect "assword:"
send "$password\r"
expect "$ "
send "exit\r"
interact
