FROM registry.access.redhat.com/jboss-webserver-3/webserver31-tomcat8-openshift:latest

USER root
COPY example.properties /opt

COPY ROOT.war /deployments
EXPOSE 8080

USER jboss

CMD ["/opt/webserver/bin/launch.sh", "run"]
