#/bin/bash
for i in "$@"
do
case $i in
    -p=*|--project_config=*)
    PROJECT_CONFIG="${i#*=}"
    ;;
esac
done

cd /tmp

apt-get update

apt-get install -y python-dev
apt-get install -y python-pip
apt-get install -y python-git
apt-get install -y unzip

pip install hjson

if [ $PROJECT_CONFIG ] ; then
    echo "Project:"
    echo "${PROJECT_CONFIG}" | python -m json.tool

    salt-call state.highstate --retcode-passthrough --out json --log-level=quiet --log-file-level=all --log-file=/var/log/salt/minion pillar="${PROJECT_CONFIG}"
else
    salt-call state.highstate --retcode-passthrough --out json --log-level=quiet --log-file-level=all --log-file=/var/log/salt/minion
fi
