#!/usr/bin/env bash

# https://docs.okd.io/latest/dev_guide/copy_files_to_container.html

pod_name=$(oc get pods --selector app=jws-s2i | { read line1 ; read line2 ; echo "$line2" ; } | awk '{print $1;}')

# directory on pod
deploy_dir=/deployments/ROOT

# exploded war directory
exploded_dir=$(pwd)/target/jws-app/

oc rsync ${exploded_dir} ${pod_name}:${deploy_dir} --watch