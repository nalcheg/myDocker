#!/usr/bin/env bash

./bin/kafka-console-producer.sh --broker-list 127.0.0.1:9092 --topic test
#docker exec -ti kafka /opt/kafka_2.11-0.10.1.0/bin/kafka-console-producer.sh --broker-list 127.0.0.1:9092 --topic test
