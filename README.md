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
4. Bring the VM up with vagrant
	
		cd basic-centos-vm
		vagrant up

5. You should now be able to hit http://10.10.10.101/phpinfo.php to view a phpinfo page.

## Details

* The VM uses [a pre-built CentOS 7.3 box](https://app.vagrantup.com/bento/boxes/centos-7.3)
from [the Bento project](https://github.com/chef/bento).
* The VM is configured with a VirtualBox internal private network on a second NIC, to enable
network traffic between host -> VM and (in future) between VMs (to enable things like a
database server or multiple web VMs). The VM is configured to use an IP of 10.10.10.101
on that second NIC.
* The VM is configured for a timezone of Australia/Adelaide.
* PHP is configured for a timezone of Australia/Adelaide.

### Provisioners

There are two provisioners configured in the Vagrantfile - shell only and puppet. They
both end up with the same result - httpd and php installed, and a phpinfo page available
at http://10.10.10.101/phpinfo.php.

You must pick one or the other, not both.

To use the shell only provisioner:

1. Uncomment the lines below the "Shell Only:" comment (approx. lines 30-32)
2. Comment out the lines below the "Puppet:" comment (approx. lines 35-45)

To use the puppet privisioner:

1. Comment out the lines below the "Shell Only:" comment (approx. lines 30-32)
2. Uncomment the lines below the "Puppet:" comment (approx. lines 35-45)

