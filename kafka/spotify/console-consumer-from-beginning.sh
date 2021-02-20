#!/usr/bin/env bash

./bin/kafka-console-consumer.sh --bootstrap-server 127.0.0.1:9092 --topic test --from-beginning
