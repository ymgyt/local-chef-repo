# coding: utf-8
#
# Cookbook:: go
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

src = "go#{node['go']['version']}.#{node['go']['os']}-#{node['go']['arch']}.tar.gz"
url = "https://redirector.gvt1.com/edgedl/go/#{src}"

# 異なるversionをinstallする際はrm -rf /usr/local/go をおこなっておくとよい
bash 'install-go' do
  user 'root'
  cwd '/tmp'
  code <<-EOF
    curl -fsSLO #{url}
    tar -C #{node['go']['install_path']} -xzf #{src}
    rm #{src}
    EOF
  not_if { ::File.exist?("#{node['go']['install_path']}/go")}
end

packages = node['go']['packages'].join(' ')

bash 'get-packages' do
  code <<-EOF
    #{node['go']['install_path']}/go/bin/go get #{packages}
    EOF
end
