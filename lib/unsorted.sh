#!/usr/bin/env bash
#===============================================================================
#
#          FILE:  lib/unsorted.sh
# 
#         USAGE:  source lib/unsorted.sh 
# 
#   DESCRIPTION:  Uncategorized functions
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Alexander Kyxap <kyxap@kyxap.pro>
#       COMPANY:  Fasten.com
#       VERSION:  1.0
#       CREATED:  02/20/2016 11:59:23 PM UTC
#      REVISION:  ---
#===============================================================================

set -e
set -o nounset

#===  FUNCTION  ================================================================
#          NAME: runcmd
#   DESCRIPTION: run command with exit code check
#    PARAMETERS: $cmd
#       RETURNS: 
#===============================================================================
runcmd()
{
  [[ $@ ]]  || die "No args passed to function: $FUNCNAME()"
  "$@" || {
    local _exit_code=$?
    die "Command '$@' exited with code: $_exit_code"
  }
}

#===  FUNCTION  ================================================================
#          NAME: min_args
#   DESCRIPTION: set minimum args count to be passed to script
#    PARAMETERS: $min_arg_count
#       RETURNS: 
#===============================================================================
min_args()
{
  local _required="$@"
  local _passed="${#BASH_ARGV[@]}"
  [[ $_required -le $_passed ]] || die "Wrong arguments count: $_passed"
}

#===  FUNCTION  ================================================================
#          NAME: usage
#   DESCRIPTION: print usage information
#    PARAMETERS: ---
#       RETURNS: 
#===============================================================================
usage()
{
  display "Usage: $0"
}
