# Install the puppet 5 repo rpm
rpm -Uvh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm

# Install the puppet package
/usr/bin/yum -y install puppet-agent
