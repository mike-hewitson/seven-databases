execute "Install key" do
  command "sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10"
  action :run
end

execute "Create List file" do
  command "echo \"deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0  multiverse\" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list"
  action :run
end

execute "Update Packages" do
  command "sudo apt-get update"
  action :run
end

execute "Install mongo from apt-get" do
  command "sudo apt-get install -y mongodb-org=#{node['mongo']['version']} mongodb-org-server=#{node['mongo']['version']} mongodb-org-shell=#{node['mongo']['version']} mongodb-org-mongos=#{node['mongo']['version']} mongodb-org-tools=#{node['mongo']['version']}"
  action :run
end