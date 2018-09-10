#!/usr/bin/env bash

pod_name=$(oc get pods --selector app=jws-s2i | { read line1 ; read line2 ; echo "$line2" ; } | awk '{print $1;}')

echo "Setup remote debugging in your IDE with localhost and port 8000"
oc port-forward ${pod_name} 8000:8000