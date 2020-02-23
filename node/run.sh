#!/usr/bin/env bash

docker run -ti --rm \
       -v `pwd`:/app \
       node
