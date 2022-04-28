#!/usr/bin/env bash

# exit on first error after this point to avoid redeploying with successful build
set -e

echo
echo ---------------------------------------------------------
echo "Step 1: Build and Deploy the contract the contract "
echo "(may take a few seconds)"
echo ---------------------------------------------------------
echo

yarn build:release

echo
echo
echo ---------------------------------------------------------
echo "Step 2: Prepare your environment for next steps"
echo
echo "(a) find the contract (account) name in the message above"
echo "    it will look like this: [ Account id: dev-###-### ]"
echo
echo "(b) set an environment variable using this account name"
echo "    see example below (this may not work on Windows)"
echo
echo ---------------------------------------------------------
echo 'export CONTRACT=<dev-123-456>'
# uncomment this line for a useful hint when using the singleton style
# echo "near call \$CONTRACT init --accountId \$CONTRACT"
echo ---------------------------------------------------------
echo

exit 0
