#!/usr/bin/env bash

# https://github.com/openshift/source-to-image/blob/master/docs/cli.md#s2i-build

registry=$(minishift openshift registry)
project=myproject
app=jws-s2i
source_location=.
builder_image=jboss-webserver-5/webserver50-tomcat9-openshift
tag=${registry}/${project}/${app}
flags="-c --incremental=true"

docker login -u developer -p $(oc whoami -t) ${registry}

s2i build ${source_location} ${builder_image} ${tag} ${flags}

docker push ${tag}