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

eval $(ssh-agent)

if [ $PROJECT_CONFIG ] ; then
    echo "Project:"
    echo "${PROJECT_CONFIG}" | python -m json.tool
fi
