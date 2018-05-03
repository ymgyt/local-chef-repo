#
# Cookbook:: site-git
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

file "/tmp/git_ssh_wrapper.sh" do
  owner "#{ENV['USER']}"
  mode "0755"
  content "#!/bin/sh\nexec /usr/bin/ssh -i #{ENV['HOME']}/.ssh/github_rsa -o StrictHostKeyChecking=no \"$@\""
end

git "doc" do
  destination "#{ENV['GOPATH']}/src/github.com/ymgyt/documents"
  action :checkout
  repository "git@github.com:ymgyt/documents.git"
  ssh_wrapper "/tmp/git_ssh_wrapper.sh"
end

git "emacs.d" do
  destination "#{ENV['HOME']}/.emacs.d"
  action :checkout
  repository "git@github.com:ymgyt/emacsd.git"
  ssh_wrapper "/tmp/git_ssh_wrapper.sh"
end

launchd "doc-server" do
  program "#{ENV['GOPATH']}/src/github.com/ymgyt/documents/_bin/server"
  action :enable
  run_at_load true
  standard_out_path "/tmp/server.out"
  standard_error_path "/tmp/server.err"
  environment_variables(
    {"DOC_DIR" => "#{ENV['GOPATH']}/src/github.com/ymgyt/documents/_build/html",
  })
end
