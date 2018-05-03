# coding: utf-8
#
# Cookbook:: pip
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

python_runtime '3' do
  version '3.6'
  pip_version true
end

node['python']['packages'].each do |pkg| 
  python_execute 'install awcsli' do
    user "#{ENV['USER']}"
    python '/usr/local/bin/python3'
    command "-m pip install #{pkg}"
  end
end
