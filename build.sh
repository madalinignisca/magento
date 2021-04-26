#!/bin/env bash
. ./.credentials
docker build . -t magento2 --build-arg REPO_USERNAME=$REPO_USERNAME --build-arg REPO_PASSWORD=$REPO_PASSWORD
