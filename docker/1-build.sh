#!/usr/bin/env bash

registry=$(minishift openshift registry)
project="$(oc whoami)-eap-build"
app=eap-docker
source_location=.
tag=${registry}/${project}/${app}:latest

docker login -u developer -p $(oc whoami -t) $(minishift openshift registry)

docker build -t ${tag} ${source_location}

docker push ${tag}
