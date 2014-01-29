include_recipe "yum"

directory "/etc/yum/vars" do
    owner "root"
    group "root"
    mode 00755
    action :create
end

file "/etc/yum/vars/releasever" do
    content "6"
    owner "root"
    group "root"
    mode 00755
    action :create_if_missing
end

yum_package "yum-fastestmirror" do
    action :install
end

execute "yum-update" do
    user "root"
    command "yum -y update"
    action :run
end
