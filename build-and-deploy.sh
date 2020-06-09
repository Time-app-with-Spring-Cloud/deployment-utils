#!/bin/bash

# Create the Docker images of all the microservices
cd ../time-service && mvn clean install && cd -

# Start the Docker containers of all the microservices
cd docker && docker-compose up
