#!/bin/bash

# Kairos launcher: update the connector address to local host ip
IP=$(hostname -i)
sed -i "s/kairosdb.service.datastore=.*/kairosdb.service.datastore=org.kairosdb.datastore.cassandra.CassandraModule/" /opt/kairosdb/conf/kairosdb.properties
sed -i "s/kairosdb.datastore.cassandra.host_list=.*/kairosdb.datastore.cassandra.host_list=$IP/" /opt/kairosdb/conf/kairosdb.properties
sed -i "s/kairosdb.jetty.address=.*/kairosdb.jetty.address=$IP/" /opt/kairosdb/conf/kairosdb.properties
sed -i "s/kairosdb.telnetserver.address=.*/kairosdb.telnetserver.address=$IP/" /opt/kairosdb/conf/kairosdb.properties

# Wait till Scylla Thrift port is up
while ! echo exit | nc $IP 9160; do sleep 10; done
/opt/kairosdb/bin/kairosdb.sh run
