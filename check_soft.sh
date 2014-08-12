#!/bin/bash
# chmod 744 check_soft.sh

BLACK='tput setaf 0'
RED='tput setaf 1'
GREEN='tput setaf 2'
YELLOW='tput setaf 3'
BLUE='tput setaf 4'
MAGENTA='tput setaf 5'
CYAN='tput setaf 6'
WHITE='tput setaf 7'

STYLE_OFF='tput sgr0'

function title {
  echo `$CYAN`$1`$STYLE_OFF`
}

function not_found {
  echo `$RED` $1`$STYLE_OFF` ": Not found"
}

function check_soft {
  local PROGRAM_NAME=$1
  local EXECUTABLE_PROGRAM=$(which $PROGRAM_NAME)

  if [ $EXECUTABLE_PROGRAM ]; then
    echo `$GREEN` $EXECUTABLE_PROGRAM`$STYLE_OFF`
  else
    not_found $PROGRAM_NAME
  fi
}

function os_check {
  echo `$BLUE`$(uname -a)`$STYLE_OFF`

  if [ -d /etc ]; then
    # echo $(/etc/*release | wc | awk '{print $1}')
    echo `$BLUE`$(cat /etc/*release)`$STYLE_OFF`
  fi
}

title "Base:"

os_check

check_soft 'gcc'
check_soft 'checkinstall'

title "Langs:"

check_soft 'rvm'
check_soft 'ruby'
check_soft 'node'

title "Converters:"

check_soft 'ffmpeg'
check_soft 'convert'

title "CacheStores:"

check_soft 'memcached'
check_soft 'redis-server'

title 'DataBases:'

check_soft 'psql'
check_soft 'mysql'

title "Search:"

check_soft 'searchd'
check_soft 'elasticsearch'

title "Helpers:"

check_soft 'git'
check_soft 'tmux'
check_soft 'phantomjs'

title "Image Optimizers:"

check_soft 'gifsicle'
check_soft 'jhead'
check_soft 'jpegoptim'
check_soft 'jpegtran'
check_soft 'optipng'
check_soft 'pngcrush'
check_soft 'pngout'
