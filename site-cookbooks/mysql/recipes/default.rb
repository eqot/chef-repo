#
# Cookbook Name:: sqlite
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "mysql" do
  action :install
end

package "mysql-devel" do
  action :install
end
