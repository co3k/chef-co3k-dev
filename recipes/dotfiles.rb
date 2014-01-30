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
    environment "HOME" => "/home/vagrant"
    flags "-e"
    cwd "/home/vagrant/dotfiles"
    code <<-EOH
        cp _gitconfig.example _gitconfig
    EOH
end
