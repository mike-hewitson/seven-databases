# seven-databases - HBase

Put the instructions etc for the team here
# Setup
## Docker
https://registry.hub.docker.com/u/banno/hbase-standalone/ Contains a docker image that seems to work
Open http://docker.ip.add.ress:60010 in a browser to access the admin portal
Worked under boot2docker on OS X
But…. you need to edit config files in the container, and the source directory needs to be set and this seems like too much trouble, so I went for straight OS X brew installation.

## OS X
brew install hbase
Gives version xxxx.x.x
base-site.xml is in /usr/local/Cellar/hbase/…/libexec/conf

### Thrift
Run: /usr/local/Cellar/hbase/1.0.1/libexec/bin/hbase-daemon.sh start thrift -b 127.0.0.1
Install Thrift command line using brew (or search for install instructions for Linux, it needs a build but it works)
To get the Hbase.thrift file, you need to download the hbase source and look in the /hbase-thrift/src/main/resources/org/apache/hadoop/hbase/thrift directory. Make sure you've got the right version that matches your installation
Some more info: http://diwakergupta.github.io/thrift-missing-guide/

### Whirr
Brew install whirr does not work
Download whirr tar (from apache attic) and unzip

# Usage
To start it: $ exec "/usr/local/Cellar/hbase/1.0.1/libexec/bin/start-hbase.sh" "$@"
To watch logs (from HBASE_HOME): $ find ./logs -name "hbase-*.log" -exec tail -f {} \;
hbase-site.xml: Uploaded to wiki, but causes HBase to fail, so I've removed the ip bindings etc (only keeping the first two properties)

## Useful Commands
Shell
status
version
describe '-'
status 'detailed'
count 'wiki', INTERVAL => 100000, CACHE => 10000