#!/bin/bash

# CheckHash v1.0 
# Author: hazeyez
# Copywright: a/k/a hazeyez (2023)
# License: GNU GPL Version 3, dated June 29, 2007 ("GPL3"). You can obtain a copy of the license at https://www.gnu.org/licenses/gpl-3.0-standalone.html
# Dual License: This software is distributed under GPL3 with additional restrictions; conveying commercial use or resale of any verbatim copies,...
##############  modified source versions, or non-source forms as defined within GPL3 sections 4, 5, and 6, are strictly prohibited without express...
##############  written consent and a previously agreed-upon compensation or licensing agreement with the original author. Any such reissuance...
##############  of this software under the aforementioned GPL3 sections, or other, in a non-commercial use or resale form must cite the original copywright.
##############  By downloading or copying the software as a whole or in part, you agree to these terms. If any provision of this Dual License conflicts...
##############  with the terms of GPL3, the terms of this Dual License shall supersede any such terms in GPL3 for legal means.

#####################################################
####  _                                          ####
#### | |                                         ####
#### | |__    __ _  ____  ___  _   _   ___  ____ ####
#### | '_ \  / _` ||_  / / _ \| | | | / _ \|_  / ####
#### | | | || (_| | / / |  __/| |_| ||  __/ / /  ####
#### |_| |_| \__,_|/___| \___| \__, | \___|/___| ####
####                            __/ |            ####
####                           |___/             ####
##################################################### 

print_green() {
  echo -e "\e[32m$1\e[0m"
}

print_red() {
  echo -e "\e[31m$1\e[0m"
}

is_valid_md5() {
  [[ "$1" =~ ^[0-9a-f]{32}$ ]]
}

is_valid_sha256() {
  [[ "$1" =~ ^[0-9a-f]{64}$ ]]
}

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 [-sha256|-md5] <expected_hash> <filename>"
  exit 1
fi

algorithm=$1
expected_hash=$2
filename=$3

if [ ! -e "$filename" ]; then
  print_red "Error: File '$filename' not found."
  exit 1
fi

case "$algorithm" in
  -sha256)
    if ! is_valid_sha256 "$expected_hash"; then
      print_red "Error: Invalid SHA-256 hash."
      exit 1
    fi
    actual_hash=$(sha256sum "$filename" | awk '{print $1}')
    ;;
  -md5)
    if ! is_valid_md5 "$expected_hash"; then
      print_red "Error: Invalid MD5 hash."
      exit 1
    fi
    actual_hash=$(md5sum "$filename" | awk '{print $1}')
    ;;
  *)
    print_red "Error: Unsupported hash algorithm. Use -sha256 or -md5."
    exit 1
    ;;
esac

if [ "$expected_hash" == "$actual_hash" ]; then
  print_green "HASH MATCHES"
else
  print_red "HASH DOES NOT MATCH"
fi
