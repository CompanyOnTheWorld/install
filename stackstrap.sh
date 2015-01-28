#/bin/bash

cd /tmp

wget https://raw.githubusercontent.com/stackstrap/install/master/files/minion
wget https://raw.githubusercontent.com/stackstrap/install/master/files/srv/top.sls
mv minion /etc/salt/minion
mkdir -p /srv
mv top.sls /srv/.

apt-get install -y python-git
apt-get install -y python-virtualenv
apt-get install -y python-setuptools

pip install hjson

sudo salt-call state.highstate -l debug
