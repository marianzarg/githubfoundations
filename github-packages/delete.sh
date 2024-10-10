#!/bin/bash
source variables.sh
version_id=""

# Prompt the user for input and store it in 'flag'
while true; do
  read -p "Enter the flag (e.g., 'package (p)' or 'version(v)'): " flag
  # Convert the input to lowercase
  flag="${flag,,}"

  # Check if the flag is either "package" or "version"
  if [[ "$flag" == "package" || "$flag" == "p" || "$flag" == "version" || "$flag" == "v" ]]; then
    break
  else
    echo "Invalid input. Please enter 'package', 'p' or 'version', 'v'."
  fi
done


# Convert the input to lowercase using parameter expansion
flag="${flag,,}"

if [[ "$flag" == "package" || "$flag" == "p" ]]
then
echo "Opción $flag"
curl -X DELETE \
-H "Authorization: Bearer $GH_TOKEN" \
-H "Accept: application/vnd.github+json" \
"https://api.github.com/users/$GH_USERNAME/packages/container/$GH_IMAGE_NAME"
else
echo "Opción $flag"

read -p "Enter version_id: " version_id
echo $version_id

curl -X DELETE \
-H "Authorization: Bearer $GH_TOKEN" \
-H "Accept: application/vnd.github+json" \
"https://api.github.com/users/$GH_USERNAME/packages/container/$GH_IMAGE_NAME/versions/$version_id"
fi