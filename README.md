# seven-databases
Repo for team to do the seven databases in seven weeks book

There is a document on how to contribute

There is a readme in each directory relating to the chapter

We will try and do everything on Unbuntu 14.04 Server with VM's

We will try and get a vagrant build for it all!

## Vagrant Instructions

1. Download version 4.x.x of virtual box and follow the prompts to install. (Note: DO NOT install version 5.x.x as it has network issues with vagrant). https://www.virtualbox.org/wiki/Download_Old_Builds_4_3
2. Download the latest version of vagrant from https://www.vagrantup.com/downloads.html.
3. Install vagrant after installing virtual box.  
4. Navigate to the "vagrant" folder within this project. There should be a Vagrantfile with all the appropriate settings.
5. Type "vagrant up {module}" and this should build your vm. {Module} refers to the name of the database you would like to install. By default postgres is installed. e.g "vagrant up riak" would setup a vm with riak installed.
 
##### Default Settings
###### All the below settings can be configured in the vagrantfile.

 * IP for the vm: 192.168.33.11.
 * Default User: vagrant Password: vagrant (Type "vagrant ssh" to use vagrant to login or "ssh vagrant@192.168.33.11")
 * Also note that the vagrant user is the root user.
 * Ports forwarded: 80 -> 9091, 8080 -> 9090, 22 -> 2222. 
 * Default ram for the vm is 1GB. (Please unsure you have 1GB to spare on your machine)
 
