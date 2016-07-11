bash "install_riak_kv" do
  code <<-EOH
        curl https://packagecloud.io/gpg.key | sudo apt-key add -
        sudo apt-get install -y apt-transport-https
        curl -s https://packagecloud.io/install/repositories/basho/riak/script.deb.sh | sudo bash
        sudo apt-get install riak=#{node['riak']['version']}
  EOH
end