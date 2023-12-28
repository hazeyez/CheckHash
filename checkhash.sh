#!/bin/bash

# Function to print text in green
print_green() {
  echo -e "\e[32m$1\e[0m"
}

# Function to print text in red
print_red() {
  echo -e "\e[31m$1\e[0m"
}

# Function to check if a string is a valid MD5 hash
is_valid_md5() {
  [[ "$1" =~ ^[0-9a-f]{32}$ ]]
}

# Function to check if a string is a valid SHA-256 hash
is_valid_sha256() {
  [[ "$1" =~ ^[0-9a-f]{64}$ ]]
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 [-sha256|-md5] <expected_hash> <filename>"
  exit 1
fi

# Extract arguments
algorithm=$1
expected_hash=$2
filename=$3

# Check if the file exists
if [ ! -e "$filename" ]; then
  print_red "Error: File '$filename' not found."
  exit 1
fi

# Validate the hash based on the specified algorithm
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

# Compare the hashes
if [ "$expected_hash" == "$actual_hash" ]; then
  print_green "HASH MATCHES"
else
  print_red "HASH DOES NOT MATCH"
fi
