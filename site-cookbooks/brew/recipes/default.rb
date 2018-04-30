#
# Cookbook:: brew
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

node['brew']['packages'].each do |pkg,cfg|
  options = cfg['options']
  
  homebrew_package pkg do
    action :install
    options options.join(' ') unless options.nil?
  end
end

node['brew']['casks'].each do |pkg|
  homebrew_cask pkg
end
