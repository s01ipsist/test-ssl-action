#!/bin/bash

# Validate that INPUT_URI is provided
if [ -z "$INPUT_URI" ]; then
  echo "Error: INPUT_URI is required"
  exit 1
fi

# Generate a filename based on the INPUT_URI and timestamp
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
OUTPUT_FILE="testssl_results_${TIMESTAMP}.json"

echo "Testing SSL/TLS for: $INPUT_URI"
echo "Output will be saved to: $OUTPUT_FILE"

# Run testssl.sh with the provided INPUT_URI and save JSON output
# Using proper quoting to prevent any injection issues
testssl.sh --jsonfile "$OUTPUT_FILE" -- "$INPUT_URI"

EXIT_CODE=$?

echo "testssl.sh completed with exit code: $EXIT_CODE"
echo "Results saved to: $OUTPUT_FILE"

exit $EXIT_CODE
