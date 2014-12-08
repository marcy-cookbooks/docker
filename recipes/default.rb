#
# Cookbook Name:: docker
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "yum"

if node[:platform] == "amazon" then
  package "docker" do
    action :install
  end
else
  yum_repository "epel" do
    description "epel repo"
    baseurl "http://dl.fedoraproject.org/pub/epel/$releasever/$basearch/"
    gpgkey  "http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-#{releasever}"
    enabled true
  end
  package "docker-io" do
    action :install
  end
end

file "/etc/sysconfig/docker" do
  owner 'root'
  group 'root'
  mode "0755"
  notifies :restart, 'service[docker]', :delayed
  content <<-EOH
other_args="-H #{node['docker']['host']} --icc=false"
EOH
end

file "/etc/profile.d/docker.sh" do
  owner 'root'
  group 'root'
  mode "0755"
  content <<-EOH
export DOCKER_HOST=#{node['docker']['host']}
EOH
end

service "docker" do
  supports :status => true, :restart => true, :reload => false
  action [:enable, :start]
end
