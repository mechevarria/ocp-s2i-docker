#!/bin/bash

project=myproject
app=tomcat-war

oc project ${project}
oc delete all --selector app=${app}
