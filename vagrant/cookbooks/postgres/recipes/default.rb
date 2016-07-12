bash "install_postgres_database" do
  code <<-EOH
        sudo apt-get -y install postgresql-#{node['postgres']['version']}
  EOH
end