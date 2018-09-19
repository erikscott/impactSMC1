#!/bin/bash

# Step 1: Walk this way. 
if [ "$#" -ne 3 ]; then
    echo "usage: runSMC.sh numberToBeSummed controllinghost partyNumber" > /dev/stderr
    exit
fi

echo "ARGARG= " $1 $2 $3  > /tmp/arg
cd /home/ec2-user/SPDZ-2
export LD_LIBRARY_PATH=/usr/local/lib
/bin/kill Player-Online.x
sleep 3
rm -f /tmp/resultTotal /tmp/smcerr /tmp/se /tmp/so

echo $1 | /home/ec2-user/SPDZ-2/Player-Online.x -ip /home/ec2-user/parties $3 tripleadd 2>/tmp/se > /tmp/so

mv /tmp/se /tmp/smcerr
mv /tmp/so /tmp/resultTotal
