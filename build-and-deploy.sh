#!/bin/bash

CURRENT_DIR=`pwd`

# Create the Docker images of all the microservices
cd ../time-service && mvn clean install && cd $CURRENT_DIR
cd ../time-eureka-server && mvn clean install && cd $CURRENT_DIR
cd ../time-config-server && mvn clean install && cd $CURRENT_DIR

# Start the Docker containers of all the microservices
cd docker && docker-compose up
