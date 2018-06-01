#
# Cookbook:: dotfiles
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

user = "#{ENV['ME']}"

directory 'zsh' do
  path "#{ENV['HOME']}/.zsh/completion"
  recursive true
  owner user
  action :create
end

cookbook_file 'docker_completion' do
  path "#{ENV['HOME']}/.zsh/completion/_docker"
  source "zsh_docker_completion"
  owner user
  action :create
end

template 'zshrc' do
  path "#{ENV['HOME']}/.zshrc"
  source 'zshrc.erb'
  action :create
  force_unlink true
  owner user
  manage_symlink_source false
end

template 'gitconfig' do
  path "#{ENV['HOME']}/.gitconfig"
  source 'gitconfig.erb'
  action :create
  force_unlink true
  owner user
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

template 'aspell_conf' do
  path "#{ENV['HOME']}/.aspell.conf"
  source 'aspell_conf.erb'
  action :create
  force_unlink true
  owner user
  manage_symlink_source false
end

cookbook_file 'gitignore' do
  path "#{ENV['HOME']}/.gitignore"
  source 'gitignore'
  action :create
  force_unlink true
  owner user
  manage_symlink_source false
end

cookbook_file 'aspell_user_dict' do
  path "#{ENV['HOME']}/.aspell.en.pws"
  source 'aspell_en_pws'
  action :create
  force_unlink true
  owner user
  manage_symlink_source false
end
  
