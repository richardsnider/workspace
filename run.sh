#!/usr/bin/env bash

docker build -t workspace .
docker run --detach --publish 666:22 --name workspace workspace
