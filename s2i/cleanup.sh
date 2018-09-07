#!/bin/bash

registry=$(minishift openshift registry)
project=myproject
app=jws-s2i
tag=${project}/${app}:latest

oc project ${project}
oc delete all --selector app=${app}
oc delete is ${app}
