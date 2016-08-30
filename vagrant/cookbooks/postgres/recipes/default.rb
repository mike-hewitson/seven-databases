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
  EOH
end

