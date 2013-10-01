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

bash "Run script" do
  user 'ec2-user'
  group 'ec2-user'
  cwd '/home/ec2-user'
  environment "HOME" => '/home/ec2-user'
  code <<-EOH
    /usr/local/bin/ddns-update.pl
  EOH
end
