#/bin/bash
for i in "$@"
do
case $i in
    -p=*|--project_config=*)
    PROJECT_CONFIG="${i#*=}"
    ;;
    --default)
    DEFAULT=YES
    ;;
    *)
            # unknown option
    ;;
esac
done

echo "Project:"
echo "${PROJECT_CONFIG}" | python -m json.tool

cd /tmp

apt-get update

apt-get install -y python-dev
apt-get install -y python-pip
apt-get install -y python-git
apt-get install -y unzip

pip install hjson

wget https://raw.githubusercontent.com/stackstrap/install/master/salt/minion
cp minion /etc/salt/minion
mkdir -p /srv/salt
wget https://raw.githubusercontent.com/stackstrap/install/master/salt/srv/top.sls
cp top.sls /srv/salt/top.sls
wget https://raw.githubusercontent.com/stackstrap/install/master/salt/srv/environment.sls
cp environment.sls /srv/salt/environment.sls

salt-call state.highstate --retcode-passthrough  --log-level=debug --no-color pillar="${PROJECT_CONFIG}"
