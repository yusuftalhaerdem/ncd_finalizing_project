#!/usr/bin/env bash

# exit on first error after this point to avoid redeploying with successful build
set -e

echo
echo --------------------------------------------------------
echo "Step 0: Check for environment variable with contract and owner name"
echo --------------------------------------------------------
echo

[ -z "$CONTRACT" ] && echo "Missing \$CONTRACT environment variable" && exit 1
[ -z "$CONTRACT" ] || echo "Found it! \$CONTRACT is set to [ $CONTRACT ]"
[ -z "$OWNER" ] && echo "Missing \$OWNER environment variable" && exit 1
[ -z "$OWNER" ] || echo "Found it! \$OWNER is set to [ $OWNER ]"

echo
echo
echo ----------------------------------------------------------
echo "Step 1: Call 'view' functions on the contract"
echo
echo "(run this script again to see changes made by this file)"
echo ----------------------------------------------------------
echo

near view $CONTRACT get_dict_element '{"phrase": "trial"}'

echo
echo
echo ----------------------------------------------------------
echo "Step 2: Call 'change' functions on the contract"
echo ----------------------------------------------------------
echo

# the following line fails with an error because we can't write to storage without signing the message
# --> FunctionCallError(HostError(ProhibitedInView { method_name: "storage_write" }))
# near view $CONTRACT write '{"key": "some-key", "value":"some value"}'
near call $CONTRACT add_to_dictionary '{"phrase": "script trial","entry": "script file is working"}' --accountId $OWNER
echo
echo "now run this script again to see changes made by this file"
exit 0
