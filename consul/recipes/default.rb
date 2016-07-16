#
# Cookbook Name:: consul
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


#execute 'Update the repo' do
#	command 'sudo apt-get -y update'
#end

package ['curl', 'wget', 'screen', 'unzip']

remote_file '/usr/local/bin/consul_0.6.4_linux_amd64.zip' do
  source 'https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip'
  mode '0755'
end

directory '/root/consul' do
  mode '0755'
  action :create
end

execute 'Clean the directory /root/consul if already has some content' do
  command 'rm -rf /root/consul/*'
end

remote_file '/root/consul/consul_0.6.4_web_ui.zip' do
  source 'https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_web_ui.zip'
end

execute 'Unzip UI package' do
  command 'unzip -o /root/consul/consul_0.6.4_web_ui.zip'
end

execute 'Unzip package' do
  command 'rm -rf /usr/local/bin/consul && sudo unzip -o /usr/local/bin/consul_0.6.4_linux_amd64.zip && rm -rf /usr/local/bin/consul_0.6.4_linux_amd64.zip'
end

directory '/etc/consul.d/bootstarp' do
  mode '0755'
  action :create
end

directory '/etc/consul.d/server' do
  mode '0755'
  action :create
end

directory '/etc/consul.d/client' do
  mode '0755'
  action :create
end

directory '/var/consul' do
  mode '0755'
  action :create
end

