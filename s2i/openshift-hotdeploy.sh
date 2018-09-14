#!/usr/bin/env bash

# https://docs.okd.io/latest/dev_guide/copy_files_to_container.html

pod_name=$(oc get pods --selector app=jws-s2i | { read line1 ; read line2 ; echo "$line2" ; } | awk '{print $1;}')

# directories on pod
root_dir=/opt/jws-5.0/tomcat/webapps/ROOT
classes_dir=${root_dir}/WEB-INF

# local build directories
compile_dir=$(pwd)/target/classes
web_dir=$(pwd)/src/main/webapp/

# sync java classes and html in parallel since they are in different directories
oc rsync ${compile_dir} ${pod_name}:${classes_dir} --watch & \
java_pid=$!
oc rsync ${web_dir} ${pod_name}:${root_dir} --watch & \
html_pid=$!

sleep 1
read -p "Press any key to exit..."  -n1 -s
kill ${java_pid}
kill ${html_pid}