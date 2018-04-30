root = File.expand_path File.dirname(__FILE__)

local_mode true
chef_repo_path = root
cookbook_path ["#{root}/cookbooks", "#{root}/site-cookbooks"]
role_path = "#{root}/roles"
