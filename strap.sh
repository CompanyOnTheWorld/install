#! /bin/bash

cd /tmp

wget -O install_salt.sh https://raw.githubusercontent.com/stackstrap/salt-bootstrap/fork/bootstrap-salt.sh
sudo sh install_salt.sh

wget https://raw.githubusercontent.com/stackstrap/boot/master/files/minion
cp minion /etc/salt/minion

sudo salt-call state.highstate -l debug
