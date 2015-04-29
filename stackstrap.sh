#/bin/bash
BASE_BOX=false
for i in "$@"
do
case $i in
    -p=*|--project_config=*)
    PROJECT_CONFIG="${i#*=}"
    ;;
    *)
    BASE_BOX=true
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

if [ $BASE_BOX == true ] ; then
    salt-call state.highstate --retcode-passthrough  --log-level=debug --no-color
else
    echo "Project:"
    echo "${PROJECT_CONFIG}" | python -m json.tool

    salt-call state.highstate --retcode-passthrough  --log-level=debug --no-color pillar="${PROJECT_CONFIG}"
fi
