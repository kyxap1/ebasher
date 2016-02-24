#!/usr/bin/env bash
#===============================================================================
#
#          FILE:  lib/fs.sh
# 
#         USAGE:  source lib/fs.sh 
# 
#   DESCRIPTION:  Filesystem library
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Alexander Kyxap <kyxap@kyxap.pro>
#       COMPANY:  Fasten.com
#       VERSION:  1.0
#       CREATED:  02/20/2016 11:54:14 PM UTC
#      REVISION:  ---
#===============================================================================

set -e
set -o nounset

#===  FUNCTION  ================================================================
#          NAME: setup_dir
#   DESCRIPTION: make directories from array without logging
#    PARAMETERS: array of $path
#       RETURNS:
#===============================================================================
setup_dir()
{
  declare -l _dir
  for _dir in $@
  do
    [[ -d $_dir ]] || mkdir -p $_dir
  done
}

#===  FUNCTION  ================================================================
#          NAME: make_file
#   DESCRIPTION: make file with path provided
#    PARAMETERS: $path
#       RETURNS:
#===============================================================================
make_file()
{
  display "Creating file: $@"
  touch "$@" || die "Failed to create file: $@"
}

#===  FUNCTION  ================================================================
#          NAME: make_dir
#   DESCRIPTION: make directory with full path
#    PARAMETERS: $path
#       RETURNS:
#===============================================================================
make_dir()
{
  display "Creating dir: $@"
  mkdir -p "$@" || die "Failed to create dir: $@"
}

#===  FUNCTION  ================================================================
#          NAME: is_file
#   DESCRIPTION: check if path is file
#    PARAMETERS: $path
#       RETURNS:
#===============================================================================
is_file()
{
  [[ -f $@ ]] || display "Not such file or not a file: $@"
}

#===  FUNCTION  ================================================================
#          NAME: is_readable
#   DESCRIPTION: check if file is readable
#    PARAMETERS: $file
#       RETURNS:
#===============================================================================
is_readable()
{
  [[ -r $@ ]] || display "Path is not readable: $@"
}

#===  FUNCTION  ================================================================
#          NAME: is_writable
#   DESCRIPTION: check if file is writable
#    PARAMETERS: $file
#       RETURNS:
#===============================================================================
is_writable()
{
  [[ -w $@ ]] || display "Path is not writable: $@"
}

#===  FUNCTION  ================================================================
#          NAME: is_block
#   DESCRIPTION: check if file is block device
#    PARAMETERS: $file
#       RETURNS:
#===============================================================================
is_block()
{
  [[ -b $@ ]] || display "No such block device or not a block device: $@"
}

#===  FUNCTION  ================================================================
#          NAME: is_dir
#   DESCRIPTION: check if path is dir
#    PARAMETERS: $path
#       RETURNS:
#===============================================================================
is_dir()
{
  [[ -d $@ ]] || display "No such dir or not a dir: $@"
}

#===  FUNCTION  ================================================================
#          NAME: is_executable
#   DESCRIPTION: check if file is executable
#    PARAMETERS: $file
#       RETURNS:
#===============================================================================
is_executable()
{
  [[ -x $@ ]] || display "Is not executable: $@"
}

#===  FUNCTION  ================================================================
#          NAME: in_path
#   DESCRIPTION: look for file in $PATH and exports $file as FILE=full_path
#    PARAMETERS: array of filenames
#       RETURNS:
#===============================================================================
in_path()
{
  declare -l _res

  for _binary in $@
  do
    if ! _res=$(type -P "$_binary")
    then
      die "No $_binary binary found in $PATH"
    fi
    declare -rx ${_binary^^}="$_res"
  done
}

#===  FUNCTION  ================================================================
#          NAME: read_file
#   DESCRIPTION: read file from disk
#    PARAMETERS: $file
#       RETURNS:
#===============================================================================
read_file()
{
  is_file "$@" || die "Failed to read file: $@"
  cat "$@"
}

#===  FUNCTION  ================================================================
#          NAME: write_file
#   DESCRIPTION: save data on disk with file overwrite
#    PARAMETERS: $msg $file
#       RETURNS:
#===============================================================================
write_file()
{
  local _msg="$1"
  local _file="$2"
  is_writable "$_file" || die "Failed to write file: $_file"
  echo "$_msg" | tee "$_file"
}

#===  FUNCTION  ================================================================
#          NAME: append_file
#   DESCRIPTION: append data to file
#    PARAMETERS: $msg $file
#       RETURNS:
#===============================================================================
append_file()
{
  local _msg="$1"
  local _file="$2"
  is_writable "$_file" || die "Failed to append to file: $_file"
  echo "$_msg" | tee -a "$_file"
}

#===  FUNCTION  ================================================================
#          NAME: truncate_file
#   DESCRIPTION: Copy /dev/null to file
#    PARAMETERS: $file
#       RETURNS:
#===============================================================================
truncate_file()
{
  local _null="/dev/null"
  is_block "$_null" || die "Failed to truncate file: $@"
  cp "$_null" "$@"
}
