#!/usr/bin/env bash

source_location=test/test-app
registry=$(minishift openshift registry)
project=myproject
app=tomcat9-app
builder=${registry}/${project}/tomcat9-builder
tag=${registry}/${project}/${app}:latest

s2i build ${source_location} ${builder} ${tag} -c

docker push ${tag}
