#
# Cookbook Name:: consul_template
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


remote_file '/usr/local/bin/consul_0.6.4_web_ui.zip' do
  source 'https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_web_ui.zip'
  mode '0755'
  action :create
end

execute 'Unzip the zip file' do
   command 'unzip -o consul_0.6.4_web_ui.zip'
end


execute 'Start the template' do
   command 'consul-template -consul 172.27.59.243:8500 -template /root/HA/haproxy.ctmpl:/etc/haproxy/haproxy.cfg -once'
end
