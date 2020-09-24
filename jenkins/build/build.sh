#!/bin/bash

# COpy the new jar to the build location 
cp -f java-app/target/*.jar jenkins/build/

echo "********************************"
echo "*************Build the jar******"
echo "********************************"

cd jenkins/build/ && docker-compose -f docker-compose-java.yml build --no-cache

