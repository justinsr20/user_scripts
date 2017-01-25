#!/bin/bash

systemctl start docker
#docker run -d -p 8080:8080 --volumes-from jenkins_home --name=jenkins-master judd/jenkins
docker start jenkins-master