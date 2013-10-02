#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash "install Ruby" do
    not_if { File.exists?("/home/ec2-user/.rvm/scripts/rvm") }
    user 'ec2-user'
    group 'ec2-user'
    cwd '/home/ec2-user'
    environment "HOME" => '/home/ec2-user'
    code <<-EOH
        curl -L https://get.rvm.io | bash -s
        source ~/.rvm/scripts/rvm
        rvm requirements
        rvm install 2.0.0
        rvm use 2.0.0@rails_4_0 --create --default
        echo "rvm use 2.0.0@rails_4_0 --default" >> ~/.bash_profile
    EOH
end

template "/home/ec2-user/.gemrc" do
    source "gemrc.erb"
    owner "ec2-user"
    group "ec2-user"
    mode 0644
end

bash "install Ruby on Rails" do
#    not_if <<-EOC, :user => 'ec2-user', :environment => { 'HOME' => '/home/ec2-user' }
#        'source ~/.rvm/scripts/rvm && which rails'
#    EOC
    not_if { File.exists?("/home/ec2-user/.rvm/gems/ruby-2.0.0-p247@rails_4_0/bin/rails") }
    user 'ec2-user'
    group 'ec2-user'
    cwd '/home/ec2-user'
    environment "HOME" => '/home/ec2-user'
    code <<-EOH
        source ~/.rvm/scripts/rvm
        gem install rails --version 4.0.0
    EOH
end
