#
# Cookbook Name:: hostname
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/usr/local/bin/ddns-update.pl" do
	owner "ec2-user"
	group "ec2-user"
	mode 0777
end
