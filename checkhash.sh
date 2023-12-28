#!/bin/bash

# Function to print text in green
print_green() {
  echo -e "\e[32m$1\e[0m"
}

# Function to print text in red
print_red() {
  echo -e "\e[31m$1\e[0m"
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

# Calculate the hash based on the specified algorithm
case "$algorithm" in
  -sha256)
    actual_hash=$(sha256sum "$filename" | awk '{print $1}')
    ;;
  -md5)
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
