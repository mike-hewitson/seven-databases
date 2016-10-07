# seven-databases - Redis

Put the instructions etc for the team here

# Builds

'vagrant up redis' It should be very quick

# Server

'sudo service redis-server status redis-server is running' Check if redis server is up
'sudo service redis-server restart' restart redis server

# Notes

Nodejs is installed
NPM is installed

This Vm is running Postgres, CouchDB, Neo4j and Redis

Please note that this VM is running version 1.9.4 of Neo4j for now

Some useful commands

redis-server
redis-cli

------------------------------------------------------------------------------------------------------------------------------------------
----------------------------- When executing the below Please cd into the following path /home/vagrant/files -----------------------------
ruby isbn.rb BX-Books.csv
ruby isbn_pipelined.rb BX-Books.csv
ruby isbn_cluster.rb BX-Books.csv
ruby isbn_bf.rb BX-Books.csv
------------------------------------------------------------------------------------------------------------------------------------------


node pre_populate.js
node populate_couch.js
node graph_sync.js
node bands.js

# Installation
Download current off Redis website
Unzip, and change into directory
$ make
$ make test (runs a full set of tests)

# Usage
$ src/redis-server
$ src/redis-cli
Use help space tab to cycle through command lists

# Data files

Iv'e included BX-Books.csv for use insteed of the missing tsv file.

isbn.rb is updated updated to to handle the BX-Books.csv file.

isbn_pipelined.rb updated as well isbn_bf.rb too.

pre-populate.js needed to be changed to use fast-csv and some syntax changes made.

added group_membership.tsv into repo.