#!/usr/bin/env bash

port=8080
registry=$(minishift openshift registry)
project=myproject
app=tomcat9-app
tag=${registry}/${project}/${app}:latest

docker run -p ${port}:${port} ${tag}
