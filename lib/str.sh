#!/usr/bin/env bash
#===============================================================================
#
#          FILE:  lib/str.sh
# 
#         USAGE:  source lib/str.sh 
# 
#   DESCRIPTION:  Strings library
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Alexander Kyxap <kyxap@kyxap.pro>
#       COMPANY:  Fasten.com
#       VERSION:  1.0
#       CREATED:  02/20/2016 11:58:13 PM UTC
#      REVISION:  ---
#===============================================================================

set -e
set -o nounset

#===  FUNCTION  ================================================================
#          NAME: filter_str() 
#   DESCRIPTION:  Purge input from comments, empty lines
#    PARAMETERS:  
#       RETURNS:  
#===============================================================================
filter_str()
{
  local _pattern='^\s*\(#\|$\)'
  grep -v "$_pattern" "$@"
}

#===  FUNCTION  ================================================================
#          NAME:  
#   DESCRIPTION:  
#    PARAMETERS:  
#       RETURNS:  
#===============================================================================
is_word()
{
  local _pattern='[[:alnum:]]'
  [[ $@ =~ $_pattern ]] || die "Is not alphabetic: $@"
}

is_numeric()
{
  local _pattern='[[:digit:]]'
  [[ $@ =~ $_pattern ]] || die "Is not numeric: $@"
}
