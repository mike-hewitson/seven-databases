# seven-databases - Redis

Put the instructions etc for the team here

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