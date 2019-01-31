#!/bin/bash

#Retrieve the latest git commit hash
BUILD_TAG=`git rev-parse --short HEAD`

#Build the docker image
<<<<<<< HEAD
docker build -t anshupande/kr8sswordz:$TAG -f applications/kr8sswordz-pages/Dockerfile applications/kr8sswordz-pages
=======
docker build -t 127.0.0.1:30400/kr8sswordz:$BUILD_TAG -f applications/kr8sswordz-pages/Dockerfile applications/kr8sswordz-pages
>>>>>>> upstream/master

#Setup the proxy for the registry
docker stop socat-registry; docker rm socat-registry; docker run -d -e "REG_IP=`minikube ip`" -e "REG_PORT=30400" --name socat-registry -p 30400:5000 socat-registry

echo "5 second sleep to make sure the registry is ready"
sleep 5;

#Push the images
<<<<<<< HEAD
docker push anshupande/kr8sswordz:$TAG
=======
docker push 127.0.0.1:30400/kr8sswordz:$BUILD_TAG
>>>>>>> upstream/master

#Stop the registry proxy
docker stop socat-registry

# Create the deployment and service for the front end aka kr8sswordz
<<<<<<< HEAD
sed 's#anshupande/kr8sswordz:latest#anshupande/kr8sswordz:'$TAG'#' applications/kr8sswordz-pages/k8s/deployment.yaml | kubectl apply -f -
=======
sed 's#127.0.0.1:30400/kr8sswordz:$BUILD_TAG#127.0.0.1:30400/kr8sswordz:'$BUILD_TAG'#' applications/kr8sswordz-pages/k8s/deployment.yaml | kubectl apply -f -
>>>>>>> upstream/master
