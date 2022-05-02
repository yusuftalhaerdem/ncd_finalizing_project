echo
echo 'Please enter near account:'

read acc

echo
echo 'Please enter topic name:'
read -r phrase

echo
echo 'Please enter the entry'
read -r entry

eval "near call dev-1650380500352-69862590480549 add_to_dictionary '{\"phrase\":\"$phrase\", \"entry\":\"$entry\"}' --accountId $acc"

echo
echo "succesfully completed"
exit 0
