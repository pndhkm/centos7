#!/usr/bin/bash

jb_not_found() {
  if type "$1" >/dev/null 2>&1; then # if given a valid command
    jb=$(jetbackup --version | awk 'NR==1 {print $2}')
  else
    jb=$(jetbackup5 --version | awk 'NR==1 {print $2}')
  fi
}


function versions() {
        cp=$(/usr/local/cpanel/cpanel -V)
        os=$(grep "PRETTY" /etc/os-release |  awk -F'=' '{print $2}' | tr -d '"')
        ls=$(/usr/local/lsws/bin/lshttpd -v | cut -d "/" -f2)
        db=$(mysql --version | awk '{print $1"-"$5}' | cut -d ',' -f1)
        php=$(php -v | awk 'NR==1 {print $2}')
        echo "Operating Systems|: $os"
        echo "Hostname|: $HOSTNAME"
        echo "WHM/Cpanel|: $cp"
        echo "Litespeed|: $ls"
        echo "Database|: $db"
        echo "PHP|: $php"
        echo "Jetbackup|: $(jb_not_found)"
}

versions | column -t -s'|'
