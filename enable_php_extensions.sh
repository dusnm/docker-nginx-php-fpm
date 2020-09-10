#!/bin/sh
#
# Copyright (C) 2020 Dusan Mitrovic <dusan@dusanmitrovic.xyz>
# Licensed under the terms of the GNU General Public License, version 3
#
# Enables certain php extensions in a dockerized environment

# Absolute path to the PHP configuration file
ini_file="/etc/php/php.ini"

# These extensions are commented out in the configuration file
extensions="bcmath bz2 curl exif ffi gd imap mysqli pdo_mysql pdo_sqlite pgsql sodium sqlite3 zip"

# Zend extensions commented out in the configuration file
zend_extensions="opcache"

# These extensions need to be added manually
custom_extensions="igbinary redis"

for extension in $extensions;
do
    sed -i "s/\;extension=$extension/extension=$extension/g" $ini_file
done

for zend_extension in $zend_extensions;
do
    sed -i "s/\;zend_extension=$zend_extension/zend_extension=$zend_extension/g" $ini_file
done

for custom_extension in $custom_extensions;
do
    echo "extension=$custom_extension" >> $ini_file
done
