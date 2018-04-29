#
# Cookbook:: dotfiles
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

template 'zshrc' do
  path "#{ENV['HOME']}/.zshrc"
  source 'zshrc.erb'
  action :create
  force_unlink true
  manage_symlink_source false
end

template 'gitconfig' do
  path "#{ENV['HOME']}/.gitconfig"
  source 'gitconfig.erb'
  action :create
  force_unlink true
  manage_symlink_source false
  variables(
    :user => {
      'name' => node['gitconfig']['user']['name'],
      'email' => "#{ENV['GITCONFIG_USER_EMAIL']}"
    },
    :gopath => "#{ENV['HOME']}/go" ,
    :github => {
      'user' => node['gitconfig']['github']['user'],
      'oauth_token' => "#{ENV['GITCONFIG_GITHUB_OAUTHTOKEN']}"
    }
  )
end

cookbook_file 'gitignore' do
  path "#{ENV['HOME']}/.gitignore"
  source 'gitignore'
  action :create
  force_unlink true
  manage_symlink_source false
end
  
 
