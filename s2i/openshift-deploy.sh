#!/usr/bin/env bash

# prefixing project with user to allow multiple people building the same project on the same cluster
proj_name="$(oc whoami)-eap-build"
proj_exists="$(oc projects | grep ${proj_name})"

# if project doesn't exist, make a new one.  Otherwise switch to that project
if [[ -z ${proj_exists} ]]; then
  oc new-project ${proj_name} --display-name="EAP Build Examples" --description="Examples of s2i, s2i-binary and docker builds with the EAP Openshift image"
else
  oc project ${proj_name}
fi

oc new-app \
--name=eap-s2i \
-p APPLICATION_NAME=eap-s2i \
-p SOURCE_REPOSITORY_URL=https://github.com/mechevarria/ocp-s2i-docker \
-p SOURCE_REPOSITORY_REF=eap \
-p CONTEXT_DIR=/s2i \
--template=eap71-basic-s2i