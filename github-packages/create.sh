#!/bin/bash
source variables.sh

echo ""
echo "Docker build image"
docker build -q -t $GH_IMAGE_NAME .
echo "#################"

echo ""
echo "Docker Login"
echo $GH_TOKEN | docker login ghcr.io -u $GH_USERNAME --password-stdin
echo "#################"

echo ""
echo "Image name | Tag name"
echo "$GH_IMAGE_NAME $GH_TAG_NAME"
echo "#################"

echo ""
echo "Create a docker tag"
docker tag $GH_IMAGE_NAME $GH_TAG_NAME
echo "#################"

echo ""
echo "Push docker tag"
docker push $GH_TAG_NAME
echo "#################"

echo ""
echo "Remove local image"
docker image rm -f $GH_IMAGE_NAME $GH_TAG_NAME
echo "#################"

echo ""
echo "Print Docker image ls"
docker image ls gh
echo "#################"

echo ""
echo "Clean Environment Variables"
unset GH_TAG_NAME 
unset GH_IMAGE_NAME
unset GH_VER
unset GH_TOKEN
unset GH_USERNAME
echo "#################"

echo ""
echo "Print Clean ENV"
env | grep GH
echo "#################"

echo ""
echo "Logout ghcr.io"
docker logout ghcr.io 
echo "################"