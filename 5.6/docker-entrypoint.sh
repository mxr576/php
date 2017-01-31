#!/usr/bin/env bash

set -e

if [[ -n $DEBUG ]]; then
  set -x
fi

execTpl() {
    if [[ -f "/etc/gotpl/$1" ]]; then
        gotpl "/etc/gotpl/$1" > "$2"
    fi
}

execInitScripts() {
    shopt -s nullglob
    for f in /docker-entrypoint-init.d/*.sh; do
        echo "$0: running $f"
        . "$f"
    done
    shopt -u nullglob
}

mountSshKeys() {
    if [ -d /mnt/ssh ]; then
        mkdir -p /home/www-data/.ssh
        cp /mnt/ssh/* /home/www-data/.ssh/
        chown -R www-data:www-data /home/www-data/.ssh
        chmod -R 700 /home/www-data/.ssh
    fi
}

fixPermissions() {
    chown www-data:www-data /var/www/html
}

execTpl 'php.ini.tpl' '/etc/php5/php.ini'
execTpl 'php-fpm.conf.tpl' '/etc/php5/php-fpm.conf'
execTpl 'opcache.ini.tpl' '/etc/php5/conf.d/opcache.ini'
execTpl 'xdebug.ini.tpl' '/etc/php5/conf.d/xdebug.ini'

mountSshKeys
fixPermissions
execInitScripts

exec "$@"
