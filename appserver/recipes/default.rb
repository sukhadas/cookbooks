#
# Cookbook Name:: appserver
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package ['tomcat7', 'git-core']

git "/root/app" do
  repository "https://github.com/sukhadas/GSL_App.git"
  reference "master"
  action :checkout
end

execute 'Move WAR to desired location' do
  command 'mv /root/app/myapp.war /var/lib/tomcat7/webapps/'
end

service 'tomcat7' do
   action :restart
end
