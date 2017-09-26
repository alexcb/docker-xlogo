#!/bin/bash

export uid=${HOSTUID}
export gid=${HOSTUID}
mkdir -p /home/graphicaluser
echo "graphicaluser:x:${HOSTUID}:${gid}:graphicaluser,,,:/home/graphicaluser:/bin/bash" >> /etc/passwd
echo "graphicaluser:x:${uid}:" >> /etc/group
chown ${uid}:${gid} -R /home/graphicaluser
pwconv

echo "dropping down to graphicaluser user"
su graphicaluser -c /bin/go.sh
