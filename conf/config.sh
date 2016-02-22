#!/usr/bin/env bash
#===============================================================================
#
#          FILE:  conf/config.sh
#
#         USAGE:  source conf/config.sh
#
#   DESCRIPTION:  Core configuration and preload
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Alexander Kyxap <kyxap@kyxap.pro>
#       COMPANY:  Fasten.com
#       VERSION:  1.0
#       CREATED:  02/21/2016 01:43:35 AM UTC
#      REVISION:  ---
#===============================================================================

set -e
set -o nounset

LANG=C
PATH="/bin:/usr/sbin:/usr/bin:/sbin:/usr/local/bin:/usr/local/sbin"

DATADIR="$SCRIPT_DIR/../data"
LOGDIR="$SCRIPT_DIR/../log"
LIBDIR="$SCRIPT_DIR/../lib"
TMPDIR="$SCRIPT_DIR/../tmp"

# error logging
LOG="$LOGDIR/process.log"

# loading modules
MODULES="$(ls $LIBDIR/*)"
for _module in $MODULES
do
  [[ -f $_module ]] && source $_module
done

# create dirs if needed
setup_dir "$LOGDIR $DATADIR $TMPDIR"
