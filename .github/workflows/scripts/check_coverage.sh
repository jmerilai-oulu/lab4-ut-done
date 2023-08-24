#!/bin/bash

coverage_output=$(cargo tarpaulin)

coverage_percentage=$(echo "$coverage_output" | grep -oP '(\d+\.\d+)%' | awk '{print $1}')

coverage_float=$(echo "$coverage_percentage" | sed 's/%//')

if (( $(echo "$coverage_float >= 95" | bc -l) )); then
  echo "Coverage is over 95%: $coverage_percentage"
else
  echo "Coverage is below 95%: $coverage_percentage"
  exit 1
fi
