#!/bin/sh
# Define the process name to grep for
process_name="your_process_name_here"

# Grep for the process
grep_result=$(ps aux | grep "$process_name")

# Define the output file name
output_file="process_output.txt"

# Store the grep result in the output file
echo "$grep_result" > "$output_file"

# Notify user about the completion
echo "Process grep result stored in $output_file"
