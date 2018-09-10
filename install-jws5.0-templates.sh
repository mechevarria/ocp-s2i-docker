#!/bin/bash

oc login -u admin

for resource in jws50-tomcat9-image-stream.json \
  jws50-tomcat9-basic-s2i.json \
  jws50-tomcat9-https-s2i.json \
  jws50-tomcat9-mongodb-persistent-s2i.json \
  jws50-tomcat9-mongodb-s2i.json \
  jws50-tomcat9-mysql-persistent-s2i.json \
  jws50-tomcat9-mysql-s2i.json \
  jws50-tomcat9-postgresql-persistent-s2i.json \
  jws50-tomcat9-postgresql-s2i.json
do
  oc replace -n openshift --force -f \
  https://raw.githubusercontent.com/jboss-container-images/jboss-webserver-5-openshift-image/webserver50-dev/templates/${resource}
done

oc -n openshift import-image webserver50-tomcat9-openshift --from=registry.access.redhat.com/jboss-webserver-5/webserver50-tomcat9-openshift --confirm
