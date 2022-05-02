echo
echo "hint: you may search 'life' if you want to find something"
echo 
echo 'Please enter topic name you want to check:'
read -r phrase

echo
echo "output: "
eval "near view dev-1650380500352-69862590480549 get_dict_element '{\"phrase\":\"$phrase\"}'"

echo
echo "succesfully completed"
exit 0