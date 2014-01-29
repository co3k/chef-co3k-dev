case node["platform_family"]
when "rhel", "fedora"
    include_recipe "co3k-dev::yum_setup"
when "debian"
    include_recipe "co3k-dev::apt_setup"
end

include_recipe "co3k-dev::dotfiles"
include_recipe "co3k-dev::config_iptables"
