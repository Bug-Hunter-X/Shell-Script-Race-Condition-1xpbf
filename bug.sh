#!/bin/bash

# This script demonstrates a race condition in shell scripting.

# Create two files
touch file1.txt
touch file2.txt

# Run two processes concurrently
(echo "This is file 1" > file1.txt) &
(echo "This is file 2" > file2.txt) &

# Wait for both processes to finish
wait

# The problem is that the output in the files can be incomplete if both 
# processes try to write to the same file at the same time
cat file1.txt
cat file2.txt