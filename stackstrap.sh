#/bin/bash
for i in "$@"
do
case $i in
    -p=*|--project_config=*)
    PROJECT_CONFIG="${i#*=}"
    ;;
    -s=*|--short_name=*)
    SHORT_NAME="${i#*=}"
    ;;
    --default)
    DEFAULT=YES
    ;;
    *)
            # unknown option
    ;;
esac
done

echo PROJECT_CONFIG = ${PROJECT_CONFIG}
echo SHORT_NAME = ${SHORT_NAME}

cd /tmp

apt-get update

apt-get install -y build-essential
apt-get install -y python
apt-get install -y python-dev
apt-get install -y python-git
apt-get install -y python-pip
apt-get install -y python-setuptools
apt-get install -y python-virtualenv
apt-get install -y unzip

pip install hjson
