# NOTE: This file has to be run in Python3
#!/usr/bin/python3

import os
import glob
from subprocess import call

# Will go into the folder ~/server_updates/bash_scripts/
# and change permissions on the bash scripts
def main():
    homedir = os.environ['HOME']
    path = homedir + "/server_updates/bash_scripts/"
    directory = os.fsencode(path)

    for file in os.listdir(directory):
        filename = os.fsdecode(file)
        if filename.endswith(".sh"):
            print(filename + " can now be executed")
            call(["chmod", "+x", path + filename])


if __name__ == '__main__':
  main()
