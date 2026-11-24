#!/usr/bin/env bash
set -euo pipefail
command -v aws >/dev/null || { echo "AWS CLI is not installed"; exit 1; }
aws sts get-caller-identity
echo "Confirm the account and role above are the intended non-production target."
