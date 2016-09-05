bash "install_couchdb" do
  code <<-EOH
  		sudo apt-get update
  		sudo apt-get install software-properties-common -y
  		sudo add-apt-repository ppa:couchdb/stable -y
  		sudo apt-get update	
  		sudo apt-get install couchdb -y
  EOH
end