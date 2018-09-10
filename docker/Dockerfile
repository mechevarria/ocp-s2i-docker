FROM registry.access.redhat.com/jboss-webserver-5/webserver50-tomcat9-openshift:latest

USER root
COPY example.properties /opt

COPY ROOT.war /deployments
EXPOSE 8080

USER jboss

CMD ["/opt/jws-5.0/tomcat/bin/launch.sh", "run"]
