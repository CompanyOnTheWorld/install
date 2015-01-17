#/bin/bash

cd /tmp

wget https://raw.githubusercontent.com/stackstrap/install/master/files/minion
mv minion /etc/salt/minion

apt-get install -y python-git 
apt-get install -y python-virtualenv
apt-get install -y python-setuptools

pip install hjson

sudo salt-call state.highstate -l debug
