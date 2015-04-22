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

apt-get install -y python-git
apt-get install -y unzip

pip install hjson

salt-call state.highstate --retcode-passthrough  --log-level=debug --no-color pillar="${PROJECT_CONFIG}"
