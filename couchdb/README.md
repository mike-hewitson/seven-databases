# seven-databases - COUCHDB

Put the instructions etc for the team here

# Installing on Ubuntu 14.04
### for 14.04 release
```
$ sudo apt-get install software-properties-common -y
```
add the ppa
```
$ sudo add-apt-repository ppa:couchdb/stable -y
```

update cached list of packages
```
$ sudo apt-get update -y
```

remove any existing couchdb binaries
```
$ sudo apt-get remove couchdb couchdb-bin couchdb-common -yf
```

see my shiny goodness - note the version number displayed and ensure its what you expect
```
$ sudo apt-get install -V couchdb
```


You should see the following:
Reading package lists…
Done Building dependency tree
Reading state information…
Done
The following extra packages will be installed:
couchdb-bin (x.y.z0-0ubuntu2) couchdb-common (x.y.z-0ubuntu2) couchdb (x.y.z-0ubuntu2)
… Y …

### manage via upstart
```
$ sudo stop couchdb
```
couchdb stop/waiting

update /etc/couchdb/local.ini with 'bind_address=0.0.0.0' as needed
```
$ sudo start couchdb
```
couchdb start/running, process 3541

GUI is localhost:5984/_utils/

### Installing ruby gems:
```
$ sudo apt-get install zlib1g-dev
$ sudo apt-get install libxml2-dev
$ sudo apt-get install build-essential autoconf libncurses5-dev openssl libssl-dev fop xsltproc unixodbc-dev
$ sudo gem install libxml-ruby couchrest
```