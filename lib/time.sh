#!/usr/bin/env bash 
#===============================================================================
#
#          FILE: date.sh
# 
#         USAGE: ./date.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Aleksandr Kukhar (kyxap), kyxap@kyxap.pro
#  ORGANIZATION: Operations
#       CREATED: 02/21/2016 21:00
#      REVISION:  ---
#===============================================================================

set -e
set -o nounset                              # Treat unset variables as an error

#===  FUNCTION  ================================================================
#          NAME: read_date
#   DESCRIPTION: return rfc formatted date
#    PARAMETERS: ---
#       RETURNS: 
#===============================================================================
read_date()
{
	local _format="${1:-iso8601}"
	local _tz="GMT${2:-0}"

	# 2016-02-21T21:28:37,044997932+0000
	local iso8601="--iso-8601=ns"

	# Sun, 21 Feb 2016 21:28:55 +0000
	local rfc2822="--rfc=2822"

	# 2016-02-21 21:29:14.212127506+00:00
	local rfc3339="--rfc-3339=ns"

	# 1456090198
	local epoch="+%s"

	# 2016-02-21
	local date_only="+%F"

	# 21:48:09
	local time="+%T"

	local _arg=""

	declare -l _date

	#echo "$_format $_tz"

	#runcmd date "${_format}"
}

