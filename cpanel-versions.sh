#!/usr/bin/bash

function versions() {
        cp=$(/usr/local/cpanel/cpanel -V)
        os=$(grep "PRETTY" /etc/os-release |  awk -F'=' '{print $2}' | tr -d '"')
        ls=$(/usr/local/lsws/bin/lshttpd -v | cut -d "/" -f2)
        db=$(mysql --version | awk '{print $1"-"$5}' | cut -d ',' -f1)
        php=$(php -v | awk 'NR==1 {print $2}')
        jb=$(jetbackup --version | awk 'NR==1 {print $2}'  2>/dev/null )
        jb5=$(jetbackup5 --version | awk 'NR==1 {print $2}'  2>/dev/null )
        echo "Operating Systems|: $os"
        echo "Hostname|: $HOSTNAME"
        echo "WHM/Cpanel|: $cp"
        echo "Litespeed|: $ls"
        echo "Database|: $db"
        echo "PHP|: $php"
        echo "Jetbackup|: $jb||$jb5"
}

versions | column -t -s'|'
