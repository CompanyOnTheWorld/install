#! /bin/bash

cd /tmp
wget https://raw.githubusercontent.com/stackstrap/boot/master/files/minion
cp minion /etc/salt/minion
sudo salt-call state.highstate -l debug
