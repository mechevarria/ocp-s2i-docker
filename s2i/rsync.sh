#!/usr/bin/env bash

# https://docs.okd.io/latest/dev_guide/copy_files_to_container.html

pod_name=$(oc get pods --selector app=jws-s2i | { read line1 ; read line2 ; echo "$line2" ; } | awk '{print $1;}')
echo "pod_name=${pod_name}"

deploy_dir=/opt/jws-5.0/tomcat/webapps/ROOT
echo "deploy_dir=${deploy_dir}"

dev_dir=$(pwd)/target/jws-app/
echo "dev_dir=${dev_dir}"

oc rsync ${dev_dir} ${pod_name}:${deploy_dir} --watch --delete