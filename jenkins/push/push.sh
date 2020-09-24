#!/bin/bash

echo "************************"
echo "***********push the image***"
echo "************************"


IMAGE="maven-project"

echo "*** Logging in ***"
docker login -u devopsforum -p $PASS
echo "***** Tagging the image ****"
docker tag $IMAGE:$BUILD_TAG devopsforum/$IMAGE:$BUILD_TAG
echo "*** Pushing the image ****"
docker push devopsforum/$IMAGE:$BUILD_TAG
