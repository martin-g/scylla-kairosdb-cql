#!/bin/bash

# Kairos launcher: update the connector address to local host ip
IP=$(hostname -i)
sed -i "s/kairosdb.service.datastore=.*/kairosdb.service.datastore=org.kairosdb.datastore.cassandra.CassandraModule/" /opt/kairosdb/conf/kairosdb.properties
sed -i "s/kairosdb.datastore.cassandra.host_list=.*/kairosdb.datastore.cassandra.host_list=$IP/" /opt/kairosdb/conf/kairosdb.properties

/opt/kairosdb/bin/kairosdb.sh run

