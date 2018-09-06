#!/usr/bin/env bash

# https://github.com/openshift/source-to-image/blob/master/docs/cli.md#s2i-build

port=8080
registry=$(minishift openshift registry)
project=myproject
app=jws-binary
tag=${registry}/${project}/${app}

docker run -p ${port}:${port} ${tag}
