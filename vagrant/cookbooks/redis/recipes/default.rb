bash "install_postgres_database" do
  code <<-EOH
	sudo apt-get -y install postgresql-#{node['postgres']['version']}
  EOH
end


bash "create_vagrant_database" do
  user "vagrant"
  environment ({'HOME' => '/home/vagrant', 'USER' => 'vagrant'})
  code <<-EOH
    sudo -u postgres createuser -s $(whoami); createdb $(whoami)
    psql -c "ALTER USER vagrant PASSWORD 'vagrant'"
  EOH
end

bash "install_couchdb" do
  code <<-EOH
  		sudo apt-get update
  		sudo apt-get install software-properties-common -y
  		sudo add-apt-repository ppa:couchdb/stable -y
  		sudo apt-get update	
  		sudo apt-get install couchdb -y
  EOH
end

bash "install_neo4j" do
  code <<-EOH
  		sudo apt-get update
  		wget -O - https://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add -
        echo 'deb http://debian.neo4j.org/repo stable/' | sudo tee /etc/apt/sources.list.d/neo4j.list
        sudo apt-get update
        sudo apt-get -y --force-yes install neo4j=1.9.4
  EOH
end

bash "install_redis" do
  code <<-EOH
		cd /home/vagrant
  		sudo apt-get update
  		sudo apt-get -y install redis-server
		sudo apt-get update
		curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
		sudo apt-get install -y nodejs
		sudo apt-get install -y build-essential
		sudo gem install redis
		sudo gem install bloomfilter -rb
		sudo npm install --unsafe-perm -g hiredis redis csv
		sudo npm install --unsafe-perm -g bricks mustache
        sudo npm install --unsafe-perm -g fast-csv
		
		cd /home/vagrant
		mkdir -p files
		cd files
  EOH
end

cookbook_file "home/vagrant/files/isbn.rb" do
  source "/isbn.rb"
  mode "755"
  owner 'root'
  group 'root'
end

cookbook_file "home/vagrant/files/isbn_bf.rb" do
  source "/isbn_bf.rb"
  mode "755"
  owner 'root'
  group 'root'
end

cookbook_file "home/vagrant/files/isbn_cluster.rb" do
  source "/isbn_cluster.rb"
  mode "755"
  owner 'root'
  group 'root'
end

cookbook_file "home/vagrant/files/isbn_pipelined.rb" do
  source "/isbn_pipelined.rb"
  mode "755"
  owner 'root'
  group 'root'
end

cookbook_file "home/vagrant/files/bands.js" do
  source "/bands.js"
  mode "755"
  owner 'root'
  group 'root'
end

cookbook_file "home/vagrant/files/graph_sync.js" do
  source "/graph_sync.js"
  mode "755"
  owner 'root'
  group 'root'
end

cookbook_file "home/vagrant/files/neo4j_caching_client.js" do
  source "/neo4j_caching_client.js"
  mode "755"
  owner 'root'
  group 'root'
end

cookbook_file "home/vagrant/files/neo4j_driver.js" do
  source "/neo4j_driver.js"
  mode "755"
  owner 'root'
  group 'root'
end

cookbook_file "home/vagrant/files/populate_couch.js" do
  source "/populate_couch.js"
  mode "755"
  owner 'root'
  group 'root'
end

cookbook_file "home/vagrant/files/pre_populate.js" do
  source "/pre_populate.js"
  mode "755"
  owner 'root'
  group 'root'
end

cookbook_file "home/vagrant/files/watch_changes_continuous.js" do
  source "/watch_changes_continuous.js"
  mode "755"
  owner 'root'
  group 'root'
end

cookbook_file "home/vagrant/files/telnet.sh" do
  source "/telnet.sh"
  mode "755"
  owner 'root'
  group 'root'
end

cookbook_file "home/vagrant/files/template.html" do
  source "/template.html"
  mode "755"
  owner 'root'
  group 'root'
end

cookbook_file "home/vagrant/files/BX-Books.csv.tar.gz" do
  source "/BX-Books.csv.tar.gz"
  mode "755"
  owner 'root'
  group 'root'
end

cookbook_file "home/vagrant/files/group_membership.tsv.tar.gz" do
  source "/group_membership.tsv.tar.gz"
  mode "755"
  owner 'root'
  group 'root'
end

cookbook_file "home/vagrant/files/performance.tsv.tar.gz" do
  source "/performance.tsv.tar.gz"
  mode "755"
  owner 'root'
  group 'root'
end

bash "unzip_packages" do
  code <<-EOH
		cd /home/vagrant/files
  		sudo tar xzvf group_membership.tsv.tar.gz
		sudo tar xzvf BX-Books.csv.tar.gz
		sudo tar xzvf performance.tsv.tar.gz
  EOH
end