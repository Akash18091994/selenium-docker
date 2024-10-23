FROM bellsoft/liberica-openjre-alpine:11.0.24-cds

#Install curl and jq (Below command will install curl and jq
RUN apk add curl jq

#workspace
WORKDIR /home/selenium-docker

#Add the required files to run tests (add folder 'target/docker-resources' to WORKDIR (i.e. /home/selenium-docker) in docker container)
ADD target/docker-resources ./
#Add the runner.sh file (this file has is checking if selenium grid is ready and then command to run tests
ADD runner.sh runner.sh

#Start the runner.sh
ENTRYPOINT sh runner.sh