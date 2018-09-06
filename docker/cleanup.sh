#!/bin/bash

registry=$(minishift openshift registry)
project=myproject
app=jws-docker
tag=${project}/${app}:latest

oc project ${project}
oc delete all --selector app=${app}
oc delete is ${app}
oc tag -d ${tag}
