# Workaround for Fedora 25's behaviour of not setting VirtualBox as the default provider.
# https://developer.fedoraproject.org/tools/vagrant/vagrant-virtualbox.html
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

Vagrant.configure("2") do |config|
	# This is a CentOS 7.3 box from the public Vagrant catalog, built from the bento templates.
	# Bento: https://github.com/chef/bento
	# This box: https://app.vagrantup.com/bento/boxes/centos-7.3
	config.vm.box = "bento/centos-7.3"

	config.vm.define :web01 do |config|

		# Some config niceness for virtualbox
		config.vm.provider "virtualbox" do |vb|
			# Name the box "web01" in virtualbox's list
			vb.customize ["modifyvm", :id, "--name", "web01"]
		end
		
		# Give the box a hostname to match the virtualbox name
		config.vm.hostname = "web01"
		# Put it on 10.10.10.101, for predictability. It's local-only.
		config.vm.network "private_network", ip: "10.10.10.101"

		# PROVISIONERS
		#
		# To use the shell provisioner, comment out the puppet provisioner lines, and vice-versa.
		#

		# Shell only:
		#config.vm.provision :shell do |shell|
		#    shell.path = "provisioners/web01/shellonly.sh"
		#end

		# Puppet:
		# First, a shell provisioner to install puppet and related packages
		config.vm.provision :shell do |shell|
			shell.path = "provisioners/web01/puppet/install-puppet.sh"
		end
		# Then a puppet provisioner to do the rest of the config
		# This uses environments/dev/manifests/default.pp.
		# You must use a puppet environment if you want to provision with puppet >= 4.
		config.vm.provision :puppet do |puppet|
			puppet.environment_path = "provisioners/web01/puppet/environments"
			puppet.environment = "dev"
		end


	end

end
