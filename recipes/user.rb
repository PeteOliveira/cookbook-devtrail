#
# Cookbook Name:: devtrail
# Recipe:: user
#
# The MIT License (MIT)

# Copyright (c) 2013 John Deatherage <john@routeoflastresort.com>

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

group node[:devtrail][:build][:group]

user node[:devtrail][:build][:user] do
  system true
  comment 'Contrail build user'
  home node[:devtrail][:build][:home]
  group node[:devtrail][:build][:group]
  supports :manage_home => true
  shell "/bin/bash"
end

template "/home/contrail/.gitconfig" do
  source "gitconfig.erb"
  mode "664"
  owner node[:devtrail][:build][:user]
  group node[:devtrail][:build][:group]
  variables({
    :github_name => node[:devtrail][:github][:name],
    :github_email => node[:devtrail][:github][:email]
  })
end
