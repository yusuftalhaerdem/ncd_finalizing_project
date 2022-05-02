#!/usr/bin/env bash

# exit on first error after this point to avoid redeploying with successful build
set -e

echo
echo ---------------------------------------------------------------------
echo "Step 0: Check for environment variable with contract and owner name"
echo ---------------------------------------------------------------------
echo

[ -z "$CONTRACT" ] && echo "Missing \$CONTRACT environment variable" && exit 1
[ -z "$CONTRACT" ] || echo "Found it! \$CONTRACT is set to [ $CONTRACT ]"
[ -z "$OWNER" ] && echo "Missing \$OWNER environment variable" && exit 1
[ -z "$OWNER" ] || echo "Found it! \$OWNER is set to [ $OWNER ]"

echo
echo
echo "enter the topic you want to add your entry: "
read -r phrase
echo
echo "enter the entry that you want to add: "
read -r entry
echo


eval "near call \"$CONTRACT\" add_to_dictionary '{\"phrase\":\"$phrase\", \"entry\":\"$entry\"}' --accountId $OWNER"

echo
echo "operation is succesfully completed"
exit 0
