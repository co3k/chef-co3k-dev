include_recipe "apt"

execute "apt-get-upgrade" do
    user "root"
    command "apt-get upgrade"
    action :run
end
