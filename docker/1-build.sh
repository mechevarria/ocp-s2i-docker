#!/usr/bin/env bash

registry=$(minishift openshift registry)
project=myproject
app=eap-docker
source_location=.
tag=${registry}/${project}/${app}:latest

docker build -t ${tag} ${source_location}

docker push ${tag}
