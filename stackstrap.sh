#! /bin/bash

cd /tmp

curl -L https://raw.githubusercontent.com/stackstrap/salt-bootstrap/fork/bootstrap-salt.sh | sudo sh -s -- git develop

wget https://raw.githubusercontent.com/stackstrap/environment/master/files/minion
cp minion /etc/salt/minion

sudo salt-call state.highstate -l debug
