#!/bin/bash

systemctl start docker

# remove old stuff
docker rm -v $(docker ps -a -q -f status=exited)
docker rmi $(docker images -f "dangling=true" -q)

# removes everything (warning including docker volumes)
#docker system prune -f

# initial start of jenkins container
docker run -d -p 8080:8080 -v jenkins_home:/var/jenkins_home --name=jenkins-master judd/jenkins

# remove volumes not being used
docker volume rm $(docker volume ls -qf dangling=true)