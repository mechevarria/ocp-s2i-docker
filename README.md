# Examples for Building Java Applications on Openshift

For developers using JBoss EAP on [Openshift](https://www.openshift.com/). Included are examples of [source to image](https://github.com/openshift/source-to-image), **source to image** binary deployment (copy the WAR) and a build from a **docker** file.

![screenshot](./screenshot.png)

Examples of when to use each:

* **s2i** covers compilation, movement of binaries and copying all custom configuration
* **docker** is needed **only** if you need root access, such as modifying a folder outside the application server directory or additional **yum** installation commands. If you are only modifying the app server deployment, docker is not needed
* More details can be found in the secure [Red Hat Container Catalog](https://access.redhat.com/containers/)

## Requirements

* The [Container Development Kit](https://access.redhat.com/documentation/en-us/red_hat_container_development_kit/3.5/html-single/getting_started_guide/) installed. A [developers.redhat.com](https://developers.redhat.com/) account, which is free to developers, is all that is needed to install and run the enterprise tooling. 
* [docker](https://www.docker.com/get-started) for development
  * For development it is recommended to have your local docker use the [image registry](https://docs.okd.io/latest/minishift/openshift/openshift-docker-registry.html) of the Container Development Kit
* [s2i](https://github.com/openshift/source-to-image) as the build tool using docker

## Usage
Each folder has bash scripts that are used to build the same basic Java Webapp in multiple ways to deploy on Openshift. By linking your local docker to the Container Development Kit registry you can easily spin up the application in Openshift as well via `docker run`

The **s2i** directory does a full build from source and includes an additional script,  **.s2i/bin/assemble**,  to enable remote debugging. You can then use `openshift-debug.sh` to debug in your local IDE and hot deploying changes as a WAR with `openshift-hotdeploy`

The **s2i-binary** directory is the same as the s2i folder, but skips the maven build and copies over the war file. Debugging is also enabled via the **.s2i/bin/assemble** script

The **docker** directory uses a docker file to build the application and pushes to the local docker registry. If linked to Openshift, the image can be deployed using the web console or `oc` tool.
