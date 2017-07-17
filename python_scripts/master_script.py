# NOTE: This file has to be run in Python3
#!/usr/bin/python3
from subprocess import call
import getpass
import cp_file_to_host

# This script is made up of three parts; information gathering, prerequisites & execution
# Step number two can be skipped if the admin knows that the remote machine already ran the script before


####################################           ##
###        Gathering            ###           # #
###          user               ###             #
###       information           ###             #
###################################          ######

user                =   input("User on remote host: ")
address             =   input("Address of remote host: ")
port                =   input("Port: ")
password            =   getpass.getpass("The remote host's password: ")

print("\nInformation gathered\n")
print("User: {} \nAddress: {} \nPort:{} \n".format(user, address, port))

# Python scripts
update_script       =   "~/system_updates/system_update_check.py"

# Bash scripts
run_update          =   "/home/administrator/server_updates/bash_scripts/run_update.sh"
install_packages    =   "/home/administrator/server_updates/bash_scripts/install_packages.sh"
upgrade_all         =   "/home/administrator/server_updates/bash_scripts/upgrade_all.sh"
upgrade_security    =   "/home/administrator/server_updates/bash_scripts/upgrade_security.sh"
check_services      =   "/home/administrator/server_updates/bash_scripts/check_services.sh"
restart_services    =   "/home/administrator/server_updates/bash_scripts/restart_services.sh"

###################################           ###
###         Ensuring            ###          #   #
###      prerequisites          ###             #
###         are met             ###           #
###################################         #######

# Prerequisites are:
# - Python2 & 3
# - Correct directory
# - "system_update_check.py" file in the right directory

# Option to not run the prerequisites
prerequisites_y_n = input("Do you want to run through the prerequisites before running the scripts? [y/n]: ")
if "y" in prerequisites_y_n or "Y" in prerequisites_y_n:
    call([install_packages, user, address, port, password])
    cp_file_to_host.main(user, address, port, password)
else:
    pass

###################################          ####
###         Executing           ###             #
###         specified           ###           ###
###         scripts             ###             #
###################################          ####

# This part, execution, will be split into update & upgrade parts

###
###        Part 1
###       Updates

# Runs the "system_update_check.py" file on the remote host
print("\nRunning updates on remote server\n")
call([run_update, user, address, port, password, update_script])
print("\nUpdates complete\nLog file updated\n")

###
###        Part 2
###       Upgrades

upgrade_y_n = input("Do you want to install updates? [y/n]: ")
if "y" in upgrade_y_n or "Y" in upgrade_y_n:
    install_all_y_n = input("Type 'y' for all updates, 'n' for security updates only [y/n]: ")
    if "y" in install_all_y_n or "Y" in install_all_y_n:
        # Run script to install all
        call([upgrade_all, user, address, port, password])
    else:
        # Run script to install security updates
        call([upgrade_security, user, address, port, password])
else:
    pass

# Check for services that needs a restart
print("\nA check for services needing a restart is about to be made\n")
call([check_services, user, address, port, password])

# Make some check for the services, to see if there is anything to restart, then run the code below
restart_services_y_n = input("Do you want to restart the services? [y/n]: ")
if "y" in restart_services_y_n or "Y" in restart_services_y_n:
    print("")
    call([restart_services, user, address, port, password])
else:
    pass
