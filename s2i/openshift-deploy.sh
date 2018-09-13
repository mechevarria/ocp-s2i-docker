#!/usr/bin/env bash

oc login -u developer

oc project myproject

oc new-app \
--name=jws-s2i \
-p SOURCE_REPOSITORY_URL=https://github.com/mechevarria/ocp-s2i-docker \
-p SOURCE_REPOSITORY_REF=master \
-p CONTEXT_DIR=/s2i \
jws50-tomcat9-basic-s2i