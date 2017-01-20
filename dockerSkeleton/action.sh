#!/bin/bash
#
# This script expects one argument, a String representation of a JSON
# object with a single attribute called b64.   The script decodes
# the b64 value to a file, and then pipes it to aspell to check spelling.
# Finally it returns the result in a JSON object with an attribute called
# result
#
FILE=/tmp/output.txt

# Parse the JSON input ($1) to extract the value of the 'b64' attribute,
# then decode it from base64 format, and dump the result to a file.
echo $1 | sed -e 's/b64.://g' \
        | tr -d '"' | tr -d ' ' | tr -d '}' | tr -d '{' \
        | base64 -d >& $FILE

# Pipe the input file to aspell, and then format the result on one line with
# spaces as delimiters
RESULT=`cat $FILE | aspell list | tr '\n' ' ' `

# Return a JSON object with a single attribute 'result'
echo "{ \"result\": \"$RESULT\" }"
