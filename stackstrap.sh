#/bin/bash

cd /tmp

wget https://raw.githubusercontent.com/stackstrap/install/master/files/minion
mv minion /etc/salt/minion

sudo apt-get install  build-essential python-dev git-python python-pip
sudo pip install --upgrade pip 
pip install hjson

sudo salt-call state.highstate -l debug
