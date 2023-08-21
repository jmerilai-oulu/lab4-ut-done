#!/bin/bash

# Run cargo tarpaulin and capture the coverage percentage
coverage_output=$(cargo tarpaulin)

# Extract the coverage percentage using grep and awk
coverage_percentage=$(echo "$coverage_output" | grep -oP '100\.00%' | awk '{print $1}')

# Convert coverage percentage to a floating-point number for comparison
coverage_float=$(echo "$coverage_percentage" | sed 's/%//')

# Check if coverage percentage is greater than or equal to 90
if (( $(echo "$coverage_float >= 90" | bc -l) )); then
  echo "Coverage is over 90%: $coverage_percentage"
else
  echo "Coverage is below 90%: $coverage_percentage"
fi