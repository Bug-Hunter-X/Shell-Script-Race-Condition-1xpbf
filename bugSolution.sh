#!/bin/bash

# This script demonstrates a solution to the race condition using a lock file.

# Create two files
touch file1.txt
touch file2.txt

# Function to write to a file safely
write_to_file() {
  local file=$1
  local message=$2
  # Acquire lock
  flock -x 99 || exit 1
  echo "$message" > "$file"
  # Release lock
  flock -u 99
}

# Run two processes concurrently with locks
write_to_file file1.txt "This is file 1"
write_to_file file2.txt "This is file 2"

# Output the contents of both files
cat file1.txt
cat file2.txt

# Cleanup
rm file1.txt file2.txt