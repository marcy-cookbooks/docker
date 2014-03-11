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
  releasever = "6"
else
  releasever = "$releasever"
end

yum_repository "epel" do
  description "epel repo"
  baseurl "http://dl.fedoraproject.org/pub/epel/#{releasever}/$basearch/"
  gpgkey  "http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-#{releasever}"
  enabled true
end

package "docker-io" do
  action :install
end

service "docker" do
  supports :status => true, :restart => true, :reload => false
  action [:enable, :start]
end

