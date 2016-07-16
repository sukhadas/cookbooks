#
# Cookbook Name:: consul_client
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


cookbook_file '/etc/consul.d/client/config.json' do
  source 'client/config.json'
  mode '0755'
  action :create
end

cookbook_file '/etc/consul.d/client/web.json' do
  source 'client/web.json'
  mode '0755'
  action :create
end

