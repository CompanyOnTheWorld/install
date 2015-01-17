#/bin/bash

cd /tmp

wget https://raw.githubusercontent.com/stackstrap/install/master/files/minion
mv minion /etc/salt/minion

apt-get install -y build-essential 
apt-get install -y python-dev 
apt-get install -y python-git 
apt-get install -y python-virtualenv

pip install --upgrade pip 
pip install hjson

sudo salt-call state.highstate -l debug
