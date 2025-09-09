#!/usr/bin/env bash
# simple-interest.sh
# Usage: ./simple-interest.sh <principal> <rate_percent> <time_years>
# Example: ./simple-interest.sh 1000 5 2
# Output: Simple Interest: 100.00

set -e

# Check if exactly 3 arguments are passed
if [[ $# -ne 3 ]]; then
  echo "Usage: $0 <principal> <rate_percent> <time_years>"
  exit 1
fi

P="$1"
R="$2"
T="$3"

# Validate numeric inputs
re='^[0-9]+([.][0-9]+)?$'
if ! [[ $P =~ $re && $R =~ $re && $T =~ $re ]]; then
  echo "Error: All inputs must be numeric."
  exit 1
fi

# Formula: (P * R * T) / 100
INTEREST=$(echo "scale=2; ($P * $R * $T) / 100" | bc -l)

echo "Simple Interest: $INTEREST"
