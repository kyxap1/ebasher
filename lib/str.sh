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
#          NAME: filter_str
#   DESCRIPTION: remove comments, line breaks, newlines from string
#    PARAMETERS: $string
#       RETURNS: 
#===============================================================================
filter_str()
{
  local _pattern='^\s*\(#\|$\)'
  grep -v "$_pattern" "$@"
}

#===  FUNCTION  ================================================================
#          NAME: is_word
#   DESCRIPTION: check if string is matched word pattern
#    PARAMETERS: $string
#       RETURNS: 
#===============================================================================
is_word()
{
  local _pattern='[[:alnum:]]'
  [[ $@ =~ $_pattern ]] || die "Is not alphabetic: $@"
}

#===  FUNCTION  ================================================================
#          NAME: is_numeric
#   DESCRIPTION: check if string is matched numeric pattern
#    PARAMETERS: 
#       RETURNS: 
#===============================================================================
is_numeric()
{
  local _pattern='[[:digit:]]'
  [[ $@ =~ $_pattern ]] || die "Is not numeric: $@"
}

