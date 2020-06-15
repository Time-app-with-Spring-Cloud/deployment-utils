#!/bin/bash

CURRENT_DIR=`pwd`

# Create the Docker images of all the microservices
cd ../time-service           && mvn clean install -Dmaven.test.skip=true && cd $CURRENT_DIR
cd ../time-eureka-server     && mvn clean install -Dmaven.test.skip=true && cd $CURRENT_DIR
cd ../time-config-server     && mvn clean install -Dmaven.test.skip=true && cd $CURRENT_DIR
cd ../time-ui                && mvn clean install -Dmaven.test.skip=true && cd $CURRENT_DIR
cd ../time-hystrix-dashboard && mvn clean install -Dmaven.test.skip=true && cd $CURRENT_DIR
cd ../time-intake            && mvn clean install -Dmaven.test.skip=true && cd $CURRENT_DIR

# Start the Docker containers of all the microservices
cd docker && docker-compose up --scale time-service=2
