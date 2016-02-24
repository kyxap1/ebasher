#!/usr/bin/env bash
#===============================================================================
#
#          FILE:  lib/net.sh
# 
#         USAGE:  source lib/net.sh 
# 
#   DESCRIPTION:  Networking library
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Alexander Kyxap <kyxap@kyxap.pro>
#       COMPANY:  Fasten.com
#       VERSION:  1.0
#       CREATED:  02/21/2016 01:28:30 AM UTC
#      REVISION:  ---
#===============================================================================

set -e
set -o nounset

#===  FUNCTION  ================================================================
#          NAME: is_ipv4
#   DESCRIPTION: check if string is rfc ipv4 addr match
#    PARAMETERS: $ipaddr
#       RETURNS: 
#===============================================================================
is_ipv4()
{
	local _addr="$@"
	local _pattern="(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"
	declare -l _res
	if ! _res=$(echo $_addr | grep -Exo "$_pattern")
	then
		die "Invalid IP pattern: $_addr"
	fi
}

#===  FUNCTION  ================================================================
#          NAME: is_host
#   DESCRIPTION: check if string is rfc host match
#    PARAMETERS: $host
#       RETURNS: 
#===============================================================================
is_host()
{
	:
}

#===  FUNCTION  ================================================================
#          NAME: is_up
#   DESCRIPTION: check if host is listening on specified port
#    PARAMETERS: $host $port $protocol
#       RETURNS: 
#===============================================================================
is_up()
{
	local _host="${1:?}"
	local _port="${2:-80}"
	local _proto="${3:-tcp}"
	[[ $_proto == udp ]] && local _arg="-u"
	
	if ! nc -q 1 -w 1 -z ${_host} ${_port} ${_arg:-}
	then
		die "No listener on ${_host}:${_port} proto $_proto"
	fi
}

