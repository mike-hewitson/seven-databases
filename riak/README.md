# seven-databases - RIAK

Put the instructions etc for the team here

# Builds

Dev tools, which are automatically installed by the vagrant build

https://github.com/basho/riak-client-tools/tree/master/devrel

A development cluster is automativally built for you, with five nodes. To check, test etc, follow the instructions below:

Check installation of cluster
```
$ cd Projects/basho/riak/dev
$ cd ls
```
You should see dev1, dev2 etc

Start
```
$ dev1/bin/riak start
```
…. or
```
$ for node in dev*; do sudo $node/bin/riak start; done
```

Check
```
$ ps aux | grep beam
$ for node in dev*; do sudo $node/bin/riak ping; done
```

Create cluster
```
$ for n in {2..5}; do sudo dev$n/bin/riak-admin cluster join dev1@127.0.0.1; done
$ sudo dev1/bin/riak-admin cluster plan
$ sudo dev2/bin/riak-admin cluster commit
```

Testing the cluster
```
$ sudo dev1/bin/riak-admin member-status
$ sudo dev1/bin/riak-admin cluster status
$ curl -XPUT http://localhost:10018/buckets/welcome/keys/german -H 'Content-Type: text/plain' -d 'herzlich willkommen'
```

Your HTTP port might differ, so check your configuration files for the valid port in your cluster. That information can be found in /etc/riak.conf if you're using the newer configuration system or in /etc/app.config if you're using the older system. (Look for listener.http.internal = 127.0.0.1:10018)
```
$ curl http://localhost:10018/buckets/welcome/keys/german
```

## Notes when going through book:
 * Remember to run every command with sudo. e.g "dev1/bin/riak start" will not work. "sudo dev1/bin/riak start" will work.
 * dev/dev2/bin/riak-admin join ... has been depricated from this version of riak. Please refer to the notes above on how to create and test a cluster.
 * The book referes to dev/dev1/etc/app.config which is depricated. It is now dev/dev1/etc/riak.conf.
 * The polly.jpg image has been placed in Projects/basho/riak.
 * The hotel.rb script has been placed in Projects/basho/riak as well. Note the scrip has not been executed.
 * The validators script has been placed in Projects/basho/riak/js_source. Note that the method mentioned in the book regarding including custom js files is depricated. A new file called advanced.config has been created and placed in dev/dev1/etc for the respetive nodes.

## Access outside virtual machine

To access the riak cluster outside of the virtual machine, open the node's config file and replace 
"listener.http.internal = 127.0.0.1:10018" with 
"listener.http.internal = 0.0.0.0:10018".

Run the following to restart the nodes.

```
$ for node in dev*; do sudo $node/bin/riak stop; done
$ for node in dev*; do sudo $node/bin/riak start; done
```

From your host machine, do the following to check if it works from any http client: 
```
http://192.168.33.11:10018/ping 
```


For the brave, you can get the server stats by using this:
```
curl -s http://localhost:10018/stats | python -mjson.tool
```

# General instructions

Updated hotel.rb to fix Riak version change issues. You may need to adjust the port number.
