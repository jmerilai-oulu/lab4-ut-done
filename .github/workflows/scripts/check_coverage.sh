#!/bin/bash

set -e

# Check coverage percentage
coverage_percentage=$(grep -oPm1 "(?<=line-rate=\")[^\"]*" coverage.xml)
coverage_percentage=$(echo "$coverage_percentage*100" | bc)

if [ $(echo "$coverage_percentage > 90" | bc -l) -eq 1 ]; then
  echo "Coverage is above 90%: $coverage_percentage%"
else
  echo "Coverage is below 90%: $coverage_percentage%"
  exit 1
fi