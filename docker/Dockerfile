FROM registry.access.redhat.com/jboss-eap-7/eap71-openshift:latest

USER root
COPY example.properties /opt

COPY ROOT.war /deployments
EXPOSE 8080

USER jboss

CMD ["/opt/eap/bin/openshift-launch.sh", "run"]
