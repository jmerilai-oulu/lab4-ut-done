#!/bin/bash

set -e

# Run tests and generate coverage report
cargo tarpaulin --out Xml
bash <(curl -s https://codecov.io/bash) -f coverage.xml -t "$CODECOV_TOKEN" || echo "Codecov failed to upload"
