#!/bin/bash

help () {
  echo "dxignore : Tools for disable dropbox sync"
  echo ""
  echo "dxignore [file]		ignore a file"
  echo "dxignore -r [file]	don't ignore a file"
  echo "dxignore -g [file]	say if a file is ignored"
  echo "dxignore -h		help"
}

set() {
  attr -s com.dropbox.ignored -V 1 "$file" &> /dev/null && echo "$file will be ignored by Dropbox" || echo "Error with file $file"
}

get () {
  attr -g com.dropbox.ignored "$file" &> /dev/null && echo "$file is ignored by Dropbox" || echo "$file isn't ignored by Dropbox"
}

remove () {
  attr -r com.dropbox.ignored "$file" &> /dev/null && echo "$file won't be ignoré by Dropbox" || echo "Error with file $file"
}

if [ $# -eq 1 ] && [ "$1" != "-h" ]; then
  action="set" # Set ignoring by default
  file=$1
else
  while getopts "hr:g:" arg; do
    case $arg in
      h)
        help 
        exit 0
        ;;
      r)
        file=$OPTARG
        action="remove"
        ;;
      g)
        file=$OPTARG
        action="get"
        ;;
      *)
        echo "Bad usage"
        help
        exit 1
    esac
  done
fi

if [ ! -f "$file" ] && [ ! -d "$file" ] ; then
  echo "$file file doesn't exist"
  exit 1
fi

$action

