#!/bin/bash

ps xh -o pid |
while read PROCID; do
       grep 'so.* (deleted)$' /proc/$PROCID/maps 2> /dev/null
       if [ $? -eq 0 ]; then
               CMDLINE=$(sed -e 's/\x00/ /g' < /proc/$PROCID/cmdline)
               echo -e "\tPID $PROCID $CMDLINE\n"
       fi
done
