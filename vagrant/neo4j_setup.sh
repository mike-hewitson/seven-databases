#!/bin/bash

echo
echo "Installing Java..."
cd /usr/local
wget -nv -O jre-7u45-linux-x64.gz http://javadl.sun.com/webapps/download/AutoDL?BundleId=81812
tar -xf jre-7u45-linux-x64.gz
rm jre-7u45-linux-x64.gz
ln -s /usr/local/jre1.7.0_45/bin/java /usr/bin/java

echo
echo "Installing Neo4j..."
cd /etc
wget -nv http://dist.neo4j.org/neo4j-community-2.2.5-unix.tar.gz
tar -xf neo4j-community-2.2.5-unix.tar.gz
rm neo4j-community-2.2.5-unix.tar.gz
ln -s /etc/neo4j-community-2.2.5/bin/neo4j /usr/bin/neo4j

echo
echo "Updating Neo4j Config..."
sed -i 's/#org\.neo4j\.server\.webserver\.address=0\.0\.0\.0/org.neo4j.server.webserver.address=0.0.0.0/' /etc/neo4j-community-2.2.5/conf/neo4j-server.properties

echo
echo "Starting Neo4j..."
neo4j start