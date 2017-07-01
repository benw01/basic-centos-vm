# Install httpd and php
/usr/bin/yum -y install httpd php

# Set the system timezone
/usr/bin/timedatectl set-timezone Australia/Adelaide

# Set the php timezone via writing /etc/php.d/date.timezone.ini
echo -e "# Set the default timeone to Australia/Adelaide\ndate.timezone = 'Australia/Adelaide'\n" > /etc/php.d/date.timezone.ini

# Create a phpinfo.php file in the default DocumentRoot
echo -e "<?php\n\tphpinfo();\n?>" > /var/www/html/phpinfo.php

# Start httpd
/usr/sbin/service httpd start

# And finally, log a message for the user.
# In the VM I'm provisioning, the second interface is always the useful IP. Thus the cut -f2.
echo -e "\n********\nHi! Pleae visit http://$(/usr/bin/hostname -I | /usr/bin/cut -f2 -d' ')/phpinfo.php in your browser.\n********\n",
