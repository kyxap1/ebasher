#!/usr/bin/env bash
#===============================================================================
#
#          FILE:  lib/log.sh
# 
#         USAGE:  source lib/log.sh 
# 
#   DESCRIPTION:  Logging library
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Alexander Kyxap <kyxap@kyxap.pro>
#       COMPANY:  Fasten.com
#       VERSION:  1.0
#       CREATED:  02/20/2016 11:55:55 PM UTC
#      REVISION:  ---
#===============================================================================

set -e
set -o nounset

#===  FUNCTION  ================================================================
#          NAME: write_log 
#   DESCRIPTION: append timestamp + msg to file
#    PARAMETERS: $msg
#       RETURNS: 
#===============================================================================
write_log()
{
  local _log="$LOG"
	local _msg="$(date -R -u) $@"
  echo "$_msg" >> "$_log"
}

#===  FUNCTION  ================================================================
#          NAME: die
#   DESCRIPTION: print error msg to stderr with [ERROR] handler and exit
#    PARAMETERS: $msg
#       RETURNS: 
#===============================================================================
die()
{
  local _h="[ERROR]"
  local _msg="${_h^^} $@"
  echo "$_msg" >&2
  write_log "$_msg"
  exit 1
}

#===  FUNCTION  ================================================================
#          NAME: display
#   DESCRIPTION: print msg to stdout with [INFO] handler
#    PARAMETERS: $msg
#       RETURNS: 
#===============================================================================
display()
{
  local _h="[INFO]"
  local _msg="${_h^^} $@"
  write_log "$_msg" || exit 1
}

