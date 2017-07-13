# NOTE: This file has to be run in Python3
#!/usr/bin/python3
from subprocess import call
import subprocess

# This script will one or more files to a remote host
# the user will be prompted for a username and an address to begin with
# once the connection is established; the user will be prompted for a password

def main(user, address, port, password):

    # As of now, the files only include "root/update_servers/python_scripts/system_update_check.py"
    local_path      =   "/home/administrator/server_updates/python_scripts/system_update_check.py"
    remote_path     =   "~/system_updates/system_update_check.py"
    mkdir_script    =   "/home/administrator/server_updates/bash_scripts/make_directory.sh"
    scp_script      =   "/home/administrator/server_updates/bash_scripts/copy_file.sh"

    # Call a bash script to ensure that the desired folder exists
    print("\nSSH'ing into server and making sure the correct directories are there\n")
    call([mkdir_script, user, address, port, password])

    # Call the command and input the information given above
    print("\nCopying the script(s) into the server via scp\n")
    call([scp_script, user, address, port, password, local_path, remote_path])

    print("\nScripts are now in the right place\n")

if __name__ == '__main__':
  main()
