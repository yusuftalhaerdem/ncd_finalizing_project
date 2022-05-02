#!/usr/bin/env bash

# exit on first error after this point to avoid redeploying with successful build
set -e

echo
echo -----------------------------------------------------------
echo "Step 0: Check for environment variable with contract name"
echo -----------------------------------------------------------
echo

[ -z "$CONTRACT" ] && echo "Missing \$CONTRACT environment variable" && exit 1
[ -z "$CONTRACT" ] || echo "Found it! \$CONTRACT is set to [ $CONTRACT ]"

echo
echo
echo "enter the topic you want to search: "
read -r phrase
echo


eval "near view  \"$CONTRACT\" get_dict_element '{\"phrase\":\"$phrase\"}'"

echo
echo "operation is succesfully completed"
exit 0
