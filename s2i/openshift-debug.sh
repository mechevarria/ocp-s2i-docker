#!/usr/bin/env bash

# https://docs.openshift.com/container-platform/3.10/dev_guide/port_forwarding.html

pod_name=$(oc get pods --selector app=eap-s2i | { read line1 ; read line2 ; echo "$line2" ; } | awk '{print $1;}')

echo "Setup remote debugging in your IDE with localhost and port 8787"
oc port-forward ${pod_name} 8787:8787