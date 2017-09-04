#!/bin/bash

cd /var/r43ples
mkdir -p database/dataset
echo "Graph URI is set to $GRAPH_URI"
apache-jena-2.7.4/bin/tdbloader2 -loc database/dataset data/*.n[t,q]

java -jar target/r43ples-0.8.8-jar-with-dependencies.jar -c conf/r43ples.conf && \
  curl -d "query=CREATE GRAPH <${GRAPH_URI}>" http://localhost/r43ples/sparql
