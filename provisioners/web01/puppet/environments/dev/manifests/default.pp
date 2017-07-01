# conigure the system timezone
exec { '/usr/bin/timedatectl set-timezone Australia/Adelaide':
	path   =>  '/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/vagrant/.local/bin:/home/vagrant/bin',
	# only run this if it's not already set as such.
	# test -h returns true if the param is a symlink
	# the readlink test returns true if /etc/localtime already points to the Australia/Adelaide zoneinfo file
	unless => ['/usr/bin/test -h /etc/localtime', '"$(/usr/bin/readlink /etc/localtime)" = "../usr/share/zoneinfo/Australia/Adelaide"' ]
}

# ensure the httpd and php packages are installed
Package {
	ensure => 'installed',
}
package { 'httpd': }
package { 'php':   }

# configure the php timezone
file { '/etc/php.d/date.timezone.ini':
	ensure  =>  present,
	mode    =>  '0644',
	content =>  "# Set the default timeone to Australia/Adelaide\ndate.timezone = 'Australia/Adelaide'\n",
	require =>  Package['php'],
}

# configure the phpinfo.php file in the default DocumentRoot
file { '/var/www/html/phpinfo.php':
	ensure  =>  present,
	mode    =>  '0644',
	content =>  "<?php\n\tphpinfo();\n?>",
	require =>  Package['httpd'],
}

# ensure the httpd service is running
service { 'httpd':
	enable  => true,
	ensure  =>  'running',
	require =>  [ Package['httpd'], Package['php'], File['/etc/php.d/date.timezone.ini'], ]
}

# finally, echo a message for the user.
notify { 'welcome':
	message => "\n\n********\nHi! Pleae visit http://${::ipaddress_enp0s8}/phpinfo.php in your browser.\n********\n",
	# Making this require the httpd service means it will run last.
	require => Service['httpd']
} 
