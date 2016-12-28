# phpMyAdmin - Web based MySQL browser written in php
#
# Allows only localhost by default
#
# But allowing phpMyAdmin to anyone other than localhost should be considered
# dangerous unless properly secured by SSL

Alias /phpMyAdmin /var/www/html
Alias /phpmyadmin /var/www/html

<Directory /var/www/html/>
   AddDefaultCharset UTF-8

   <IfModule mod_authz_core.c>
     # Apache 2.4
     <RequireAll>
       Require all granted
     </RequireAll>
   </IfModule>
   <IfModule !mod_authz_core.c>
     # Apache 2.2
     Order Allow,Deny
     Allow from All
   </IfModule>
</Directory>

<Directory /var/www/html/setup/>
   <IfModule mod_authz_core.c>
     # Apache 2.4
     <RequireAll>
       Require all granted
     </RequireAll>
   </IfModule>
   <IfModule !mod_authz_core.c>
     # Apache 2.2
     Order Allow,Deny
     Allow from All
   </IfModule>
</Directory>

# These directories do not require access over HTTP - taken from the original
# phpMyAdmin upstream tarball
#
<Directory /var/www/html/libraries/>
    Order Deny,Allow
    Deny from All
    Allow from None
</Directory>


<Directory /var/www/html/setup/lib/>
    Order Deny,Allow
    Deny from All
    Allow from None
</Directory>

<Directory /var/www/html/setup/frames/>
    Order Deny,Allow
    Deny from All
    Allow from None
</Directory>

# This configuration prevents mod_security at phpMyAdmin directories from
# filtering SQL etc.  This may break your mod_security implementation.
#
#<IfModule mod_security.c>
#    <Directory /usr/share/phpMyAdmin/>
#        SecRuleInheritance Off
#    </Directory>
#</IfModule>

