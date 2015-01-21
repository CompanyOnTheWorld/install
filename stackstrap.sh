#/bin/bash

cd /tmp

wget https://raw.githubusercontent.com/stackstrap/install/master/files/minion
wget https://raw.githubusercontent.com/stackstrap/install/master/files/srv/environment/top.sls
mv minion /etc/salt/minion
mkdir -p /srv/environment
mv top.sls /srv/environment/.

apt-get install -y python-git
apt-get install -y python-virtualenv
apt-get install -y python-setuptools

pip install hjson

sudo salt-call state.highstate -l debug
