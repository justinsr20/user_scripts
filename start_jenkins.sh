#!/bin/bash

systemctl start docker

# remove old exited containers
docker rm -v $(docker ps -a -q -f status=exited)

# initial start of jenkins container
docker run -d -p 8080:8080 -v jenkins_home:/var/jenkins_home --name=jenkins-master judd/jenkins
