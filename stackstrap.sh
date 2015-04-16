#/bin/bash

cd /tmp

apt-get update
apt-get install -y build-essentials
apt-get install -y python
apt-get install -y python-dev
apt-get install -y python-git
apt-get install -y python-pip
apt-get install -y python-setuptools
apt-get install -y python-virtualenv

pip install hjson
