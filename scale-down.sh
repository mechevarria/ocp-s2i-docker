#/bin/bash

proj_name="$(oc whoami)-eap-build"
oc project ${proj_name}

oc scale --replicas=0 dc eap-s2i
oc scale --replicas=0 dc eap-s2i-binary
oc scale --replicas=0 dc eap-docker