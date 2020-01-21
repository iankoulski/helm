# Helm
Depend on Docker Container with helm, tiller, and kubectl installed.

## Purpose
If Docker is available, there is no need to install helm or kubectl. These tools can be run in a container instead.

## Build
The build.sh script from the project repository will create a container image locally. Alternatively the image can be pulled from Docker Hub (docker pull iankoulski/helm).

## Run

### Interactive
The following command provides an interactive shell where helm, tiller, and kubectl are available.

    docker run -it --rm iankoulski/helm sh

### Non-interactive

    docker run -it --rm iankoulski/helm sh -c "helm version --client"

## Stop
This helm container normally runs only while there is an active session, then the container stops. If you need to remove the stopped container execute stop.sh or "docker rm -f helm".
