#!/usr/bin/env bash

oc login -u developer

proj_name="$(oc whoami)-ntier"
oc project ${proj_name}

oc new-app \
--name=eap-s2i \
-p SOURCE_REPOSITORY_URL=https://github.com/mechevarria/ocp-s2i-docker \
-p SOURCE_REPOSITORY_REF=eap \
-p CONTEXT_DIR=/s2i \
--template=eap71-basic-s2i