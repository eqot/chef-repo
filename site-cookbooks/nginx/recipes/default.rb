#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "nginx" do
	action :install
end

template "/etc/nginx/nginx.conf" do
	owner "root"
	group "root"
	mode 0644
end

template "/etc/nginx/conf.d/rails.conf" do
	owner "root"
	group "root"
	mode 0644
end

service "nginx" do
	supports :status => true, :restart => true, :reload => true
	action [ :enable, :start ]
	subscribes :restart, "template[/etc/nginx/nginx.conf]"
	subscribes :restart, "template[/etc/nginx/conf.d/rails.conf]"
end

directory "/usr/share/nginx/rails/" do
	owner "ec2-user"
	group "ec2-user"
	mode 0744
	action :create
end
