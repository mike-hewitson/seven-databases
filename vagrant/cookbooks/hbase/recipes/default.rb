bash "install_java" do
  code <<-EOH
 	sudo apt-get -y install default-jdk
  EOH
end

hadoop_temp_file="#{Chef::Config[:file_cache_path]}/#{node['hadoop']['tar']}"

remote_file hadoop_temp_file do
  owner node['hbase']['user']
  group node['hbase']['user']
  mode '0644'
  source node['hadoop']['url']
end

bash "install_hadoop" do
  code <<-EOH
 	sudo tar -zxf #{hadoop_temp_file} -C /usr/local/
 	sudo chown -R #{node['hbase']['user']}:#{node['hbase']['user']} /usr/local/hadoop*
   EOH
end


hbase_temp_file="#{Chef::Config[:file_cache_path]}/#{node['hbase']['tar']}"

remote_file hbase_temp_file do
  owner node['hbase']['user']
  group node['hbase']['user']
  mode '0644'
  source node['hbase']['url']
end

bash "install_hbase" do
  code <<-EOH
 	tar -zxf #{hbase_temp_file} -C /usr/local/
 	sudo chown -R #{node['hbase']['user']}:#{node['hbase']['user']} /usr/local/hbase*
   EOH
end

template "/home/vagrant/.bashrc" do
  source ".bashrc.erb"
   owner node['hbase']['user']
   group node['hbase']['user']
  mode "644"
end

template "/usr/local/hadoop-2.7.2/etc/hadoop/hadoop-env.sh" do
  source "hadoop-env.sh.erb"
   owner node['hbase']['user']
   group node['hbase']['user']
  mode "644"
end

template "/usr/local/hadoop-2.7.2/etc/hadoop/core-site.xml" do
  source "core-site.xml.erb"
   owner node['hbase']['user']
   group node['hbase']['user']
  mode "644"
end

template "/usr/local/hadoop-2.7.2/etc/hadoop/hdfs-site.xml" do
  source "hdfs-site.xml.erb"
   owner node['hbase']['user']
   group node['hbase']['user']
  mode "644"
end

template "/usr/local/hadoop-2.7.2/etc/hadoop/yarn-site.xml" do
  source "yarn-site.xml.erb"
   owner node['hbase']['user']
   group node['hbase']['user']
  mode "644"
end

template "/usr/local/hadoop-2.7.2/etc/hadoop/mapred-site.xml" do
  source "mapred-site.xml.erb"
   owner node['hbase']['user']
   group node['hbase']['user']
  mode "644"
end

template "/usr/local/hbase-1.2.3/conf/hbase-env.sh" do
  source "hbase-env.sh.erb"
   owner node['hbase']['user']
   group node['hbase']['user']
  mode "644"
end

template "/usr/local/hbase-1.2.3/conf/hbase-site.xml" do
  source "hbase-site.xml.erb"
   owner node['hbase']['user']
   group node['hbase']['user']
  mode "644"
end
