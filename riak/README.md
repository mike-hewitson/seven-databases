# seven-databases - RIAK

Put the instructions etc for the team here

# Builds

Dev tools, which are automatically installed by the vagrant build

https://github.com/basho/riak-client-tools/tree/master/devrel

This is installed in the vagrant home, under Projects/basho/dervrel










# WARNING - IGNORE THE STUFF BELOW
 
# Install Erlang using kerl Ubuntu 14.04 64:
### Install dependencies:
```
$ sudo apt-get update
$ sudo apt-get install build-essential autoconf libncurses5-dev openssl libssl-dev fop xsltproc unixodbc-dev
```

### Get kerl
```
$ curl -O https://raw.githubusercontent.com/spawngrid/kerl/master/kerl
$ chmod a+x kerl
```

### Install Erlang
```
$ ./kerl build git git://github.com/basho/otp.git OTP_R16B02_basho8 R16B02-basho8
$ ./kerl install R16B02-basho8 ~/erlang/R16B02-basho8
$ . ~/erlang/R16B02-basho8/activate
```

### Test using Erlang shell
```
$ erl
Crypto:start().
q().
```
No errors expected

## Install Riak from Source
Failed on canola pam header, needed:
```
$ sudo apt-get install libpam0g-dev
```

### Install from source:
(http://docs.basho.com/riak/latest/ops/building/installing/debian-ubuntu/)
```
$ wget http://s3.amazonaws.com/downloads.basho.com/riak/2.1/2.1.1/riak-2.1.1.tar.gz
$ tar zxvf riak-2.1.1.tar.gz
$ cd riak-2.1.1
$ make rel
```

### Setting up a dev cluster after installation
From Riak directory
```
$ make rel
$ make all
```

Create five nodes
(http://docs.basho.com/riak/latest/quickstart/)
```
$ make devrel DEVNODES=5
```

Check
```
$ cd dev;ls
```

Start
```
$ dev1/bin/riak start
```
…. or
```
$ for node in dev*; do $node/bin/riak start; done
```

Check
```
$ ps aux | grep beam
$ for node in dev*; do $node/bin/riak ping; done
```

Create cluster
```
$ for n in {2..5}; do dev$n/bin/riak-admin cluster join dev1@127.0.0.1; done
$ dev1/bin/riak-admin cluster plan
$ dev2/bin/riak-admin cluster commit
```

Testing the cluster
```
$ dev1/bin/riak-admin member-status
$ curl -XPUT http://localhost:10018/buckets/welcome/keys/german -H 'Content-Type: text/plain' -d 'herzlich willkommen'
```

Your HTTP port might differ, so check your configuration files for the valid port in your cluster. That information can be found in /etc/riak.conf if you're using the newer configuration system or in /etc/app.config if you're using the older system.
```
$ curl http://localhost:10018/buckets/welcome/keys/german
```


# Install OSX Dev Cluster
## Quick start development cluster when all else fails
```
$ git clone git://github.com/basho/riak-dev-cluster.git
$ cd riak-dev-cluster
$ rake bootstrap
$ rake member_status
```