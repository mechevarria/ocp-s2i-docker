#!/usr/bin/env bash

oc new-app myproject/tomcat9-builder:latest~https://github.com/mechevarria/ocp-s2i-docker \
--context-dir=builder/test/test-app \
--name=tomcat9-app

oc expose svc/tomcat9-app
