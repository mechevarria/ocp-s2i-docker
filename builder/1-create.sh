#!/usr/bin/env bash

registry=$(minishift openshift registry)
project=myproject
app=tomcat9-builder
tag=${registry}/${project}/${app}:latest
source_location=.

docker build -t ${tag} ${source_location}

docker push ${tag}
