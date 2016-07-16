#
# Cookbook Name:: haproxy
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

apt_package 'haproxy'

cookbook_file '/etc/default/haproxy' do
  source 'haproxy'
  mode '0755'
  action :create
end

cookbook_file '/etc/haproxy/haproxy.cfg' do
  source 'haproxy.cfg'
  mode '0755'
  action :create
end

service 'haproxy' do
  action :restart
end
