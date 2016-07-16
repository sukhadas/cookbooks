#
# Cookbook Name:: consul_server
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file '/etc/consul.d/bootstrap/config.json' do
  source 'bootstrap/config.json'
  mode '0755'
  action :create
end

cookbook_file '/etc/consul.d/server/config.json' do
  source 'server/config.json'
  mode '0755'
  action :create
end

#execute 'Start Consul Server' do
# command 'consul agent -server -bootstrap -data-dir /var/consul -config-dir /etc/consul.d'
#end
