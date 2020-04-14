#!/usr/bin/env bash
# Create by Arun for Apache setup by compiling binaries
# All PHP Releases -  https://php.net/releases/
# All Apache dist -   https://archive.apache.org/dist/
# Apache -            http://archive.apache.org/dist/httpd/
#########################################################################################################################

# Deploying required Packages for Red Hat
yum install -y gcc apr-devel apr-util-devel
yum install -y openssl-devel pcre-devel libxml2-devel libcurl-devel
yum install -y openssl-devel expat-devel
yum install -y openldap openldap-devel openldap*i686 openldap-devel*i686

cd /rep/apache
# Downloading Apache 
wget http://archive.apache.org/dist/httpd/httpd-2.4.4.tar.gz
tar -xvzf httpd-2.4.4.tar.gz

# Moving to src directory
cd httpd-2.4.4/srclib
# Downloading apr and apr-util required package required for apache compilation
wget https://archive.apache.org/dist/apr/apr-util-1.5.2.tar.gz
wget https://archive.apache.org/dist/apr/apr-1.4.8.tar.gz
tar -xvzf apr-1.4.8.tar.gz
tar -xvzf apr-util-1.5.2.tar.gz
mv apr-1.4.8 apr
mv apr-util-1.5.2 apr-util
cd /rep/apache/httpd-2.4.4
./configure --prefix=/rep/apache/httpd/ --enable-so --enable-ssl --with-included-apr --enable-mods-shared=all
make && make install
cd /rep/apache/
wget https://www.php.net/distributions/php-7.1.30.tar.gz
tar -xvzf php-7.1.30.tar.gz
cd php-7.1.30
./configure --prefix=/rep/jenkin/apache/httpd/php --with-apxs2=/rep/jenkin/apache/httpd/bin/apxs --with-mysqli --with-curl --with-openssl
 make && make install
 chmod 755 /rep/jenkin/apache/httpd/modules/libphp7.so



# Same thing can be done with php 5 as well
wget https://www.php.net/distributions/php-5.6.40.tar.gz
./configure --prefix=/rep/jenkin/apache/httpd/php --with-apxs2=/rep/jenkin/apache/httpd/bin/apxs --with-mysqli --with-curl --with-openssl --with-ldap --with-bz2 --enable-calender
 make && make install


## You can not use directoy php module with apache please read this article - https://www.php.net/manual/en/install.unix.apache2.php
## For Testing Create a page inside htdocs of apache - <?php phpinfo(); ?>

## Insatalling mysql
# Download MySQL 5.7 RPM tar
wget https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.24-1.el7.x86_64.rpm-bundle.tar
mkdir mysql-5.7-rpm-packages
tar -xvf mysql-5.7.24-1.el7.x86_64.rpm-bundle.tar -C mysql-5.7-rpm-packages
cd mysql-5.7-rpm-packages/
# Don't use 'yum install *.rpm'. It will not work and give error messages
yum install mysql-community-{server,client,common,libs}-* mysql-5.*­

# Start MySQL
systemctl start mysqld
# Enable mysqld service in startup
systemctl enable mysqld
grep 'temporary password' /var/log/mysqld.log
# ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass4!';
