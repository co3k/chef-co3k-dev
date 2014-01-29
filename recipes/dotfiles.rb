include_recipe "ssh_known_hosts"
include_recipe "git"

ssh_known_hosts_entry 'github.com'

git "/home/vagrant/dotfiles" do
    user "vagrant"
    repository "git://github.com/ebihara/dotfiles.git"
    action :sync
end

bash "install dotfiles" do
    user "vagrant"
    flags "-e"
    cwd "/home/vagrant/dotfiles"
    code <<-EOH
        ./install.sh
    EOH
end
