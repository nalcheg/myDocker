#!/usr/bin/env bash

#docker exec -ti kafka /opt/kafka_2.11-0.10.1.0/bin/kafka-topics.sh --zookeeper 127.0.0.1:2181 --list
docker exec -ti kafka /opt/kafka_2.11-0.10.1.0/bin/kafka-topics.sh --zookeeper 127.0.0.1:2181 --describe
#./kafka-topics.sh --describe --zookeeper localhost:2181 --topic topic_name