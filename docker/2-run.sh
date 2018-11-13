#!/usr/bin/env bash

port=8080
registry=$(minishift openshift registry)
project="$(oc whoami)-eap-build"
app=eap-docker
tag=${registry}/${project}/${app}:latest

docker run -p ${port}:${port} ${tag}
