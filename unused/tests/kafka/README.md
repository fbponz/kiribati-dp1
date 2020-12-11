Kiribati_dp1

Steps to configure and start-up the Kafka component

kafka execute $ docker-compose up -d

Create the topic to kafka
docker-compose exec broker kafka-topics --create --topic mysql_kafka --bootstrap-server broker:9092 --replication-factor 1 --partitions 1

(Test) kafka-console-consumer --topic mysql_kafka --bootstrap-server broker:9092
(Test) kafka-console-producer --topic mysql_kafka --broker-list ker:9092
