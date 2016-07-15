# seven-databases - NEO4J

Put the instructions etc for the team here

# Installation
## The Short Way
Download 1.9.9 (SPOILER ALERT, NO LONGER AVAILABLE, YOU'RE ON YOUR OWN!!!!!)
Follow instruction to download tar, unzip it to home and cd to it
$ bin/neo4j start
Done

## The Long Way
Follow instruction to download tar, unzip it to home and cd to it

Switch off authentication in cong/neo4j-server.properties

Require (or disable the requirement of) auth to access Neo4j
dbms.security.auth_enabled=false

$ bin/neo4j start

Install gremlin from https://github.com/tinkerpop/gremlin/wiki/Getting-Started using the download option
The book uses Gremlin 1.3
gremlin uses it's own encapsulated Neo4j engine, and puts it's data somewhere else (/tmp/neo4j), and can be used as follows (you cannot share the same data as with neo4j running):
gremlin> g = new Neo4jGraph('/tmp/neo4j')
==>neo4jgraph[EmbeddedGraphDatabase [/tmp/neo4j]]
gremlin> g.addVertex([name:'stephen'])
==>v[0]
gremlin> g.V.map
==>{name=stephen}
gremlin> g.commit()
==>null
gremlin> g.shutdown()
==>null
gremlin> g = new Neo4jGraph('/tmp/neo4j')
==>neo4jgraph[EmbeddedGraphDatabase [/tmp/neo4j]]
gremlin> g.V.map
==>{name=stephen}

And also http://www.slideshare.net/maxdemarzi/introduction-to-gremlin

Don't think one needs to install Groovy
Install groovy via gvm http://gvmtool.net/
$ curl -s get.gvmtool.net | bash
$ source "/home/mikehewitson1/.gvm/bin/gvm-init.sh"
$ gvm install groovy

## Neo4J Enterprise
Downloaded the version 1.9.9 30 day trail
http://neo4j.com/docs/stable/ha-setup-tutorial.html#ha-local-cluster

## Usage
Console: http://localhost:7474
Wedadmin: heetp://localhost:7474/webadmin/

Some useful info http://www.slideshare.net/maxdemarzi/introduction-to-gremlin

## Data files

I've included the performance.tsv file in the repo. You won't find it anywhere.

