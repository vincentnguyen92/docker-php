#!/bin/bash
echo "Hello, World!" 
echo "Knowledge is power."

# CONSTANT
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

SERVICE=$1

if [ $# -eq 0 ]
  then
    echo "No arguments supplied...be careful...will be anable with NGINX default"
    SERVICE='nginx'
fi

printf "${GREEN}Start rebuilding........ \n\n${NC}"
eval "docker-compose build --no-cache ${SERVICE}"

if [ $? -eq 1 ]; then #build fail without have service in Docker
    read -n 1 -p "Don't exist service...plz check docker-compose file again..."
    exit;
fi

printf "\nRestart compose\n"
docker-compose up -d

printf "\nRemoving all images without using\n"
eval 'docker image rm $(docker image ls -aq)'


printf "\n.................................\n"
read -n 1 -p "Done...........Press any keys to exit"