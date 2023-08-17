#!/bin/bash

set -e

# Check coverage percentage
#coverage_percentage=$(grep -oPm1 "(?<=line-rate=\")[^\"]*" coverage.xml)
#coverage_percentage=$(echo "$coverage_percentage*100" | bc)

#if [ $(echo "$coverage_percentage > 90" | bc -l) -eq 1 ]; then
#  echo "Coverage is above 90%: $coverage_percentage%"
#else
#  echo "Coverage is below 90%: $coverage_percentage%"
#  exit 1
#fi

cargo tarpaulin --ignore-tests --out Xml

COVERAGE_THRESHOLD=85

ACTUAL_COVERAGE=$(cat target/cov-report/index.html | grep -oP '(?<=<span class="strong">)[0-9]+\.[0-9]+(?=%</span>)')

if (( $(bc <<< "$ACTUAL_COVERAGE >= $COVERAGE_THRESHOLD") )); then
  echo "Coverage is above or equal to $COVERAGE_THRESHOLD%"
else
  echo "Coverage is below $COVERAGE_THRESHOLD%"
  exit 1
fi
