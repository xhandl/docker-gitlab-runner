#!/bin/sh

GITLAB_URL=$1
RUNNER_AUTH_TOKEN=$2
RUNNER_NAME=${3:-$(hostname)}

docker exec gitlab-runner gitlab-runner register \
   --non-interactive \
   --url $GITLAB_URL \
   --token $RUNNER_AUTH_TOKEN \
   --name $RUNNER_NAME \
   --executor "docker" \
   --docker-pull-policy if-not-present \
   --docker-image docker:git \
   --docker-volumes '/var/run/docker.sock:/var/run/docker.sock' \
   --docker-volumes '/builds:/builds'
