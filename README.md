# Basic Centos VM

A Basic Centos VM. Provisioned via vagrant. Installs & does basic config on apache & php.

## Usage

1. Install VirtualBox.
	* If you're running Fedora:

		sudo dnf install VirtualBox
	
	* For other distros, see https://www.virtualbox.org for instructions.
2. Install vagrant
	* If you're running Fedora:

		sudo dnf install vagrant
	
	* For other distros, see https://www.vagrantup.com for instructions.
3. Clone this git repo
	
	git clone https://github.com/benw01/basic-centos-vm.git

4. Bring the VM up with vagrant
	
	cd basic-centos-vm
	vagrant up

5. You should now be able to hit http://10.10.10.101/phpinfo.php to view a phpinfo page.
