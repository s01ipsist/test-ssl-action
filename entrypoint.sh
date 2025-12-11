#!/bin/sh

# Get the URI from the first argument
URI="$1"

# Set the output directory to /github/workspace
OUTPUT_DIR="/github/workspace"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Generate a filename based on the URI and timestamp
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
OUTPUT_FILE="$OUTPUT_DIR/testssl_results_${TIMESTAMP}.json"

echo "Testing SSL/TLS for: $URI"
echo "Output will be saved to: $OUTPUT_FILE"

# Run testssl.sh with the provided URI and save JSON output
testssl.sh --jsonfile "$OUTPUT_FILE" "$URI"

EXIT_CODE=$?

echo "testssl.sh completed with exit code: $EXIT_CODE"
echo "Results saved to: $OUTPUT_FILE"

exit $EXIT_CODE
