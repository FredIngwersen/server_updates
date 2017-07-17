This is a small guide for using the update scripts
It will feature what works and how it does so, and also what doesn't work as of writing this

All of the scripts are controlled by one script, which is the "master_script.py".


Here, a list of things which are working already:
 - [y/n] to running prerequisites
 - making sure the directory is there, creating one if not
 - copying the script(s) into the folder
 - running the script
 - getting a log file


DETAILS ABOUT HOW IT WORKS:
The master script will first ask the user to give some input:
- username
- address
- port
- password

When this has been given, the script will run on its own.

So, first it will make sure python 2 and 3 are install, then that the desired directory exists, create it if not.
After this, it will copy scripts from the local machine into the remote one, via scp.
The script will then ssh into the machine and execute the script which was just placed there.
The script being executed, as of now, will only update, not upgrade and write to the console and to a log file

The master script will contain all the file paths, this is only so, that it can be changed in a central location.

The scripts depend on paths a bit, so here, for reference, the folder structure:

~/server_updates/
                bash_scripts/
                python_scripts/


THIS IS A DOCUMENT IN THE WORKS, THUS WILL FEEL VERY INCOMPLETE
