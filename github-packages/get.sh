#!/bin/bash
source variables.sh

curl -H "Authorization: Bearer $GH_TOKEN" \
-H "Accept: application/vnd.github+json" \
"https://api.github.com/users/$GH_USERNAME/packages/container/$GH_IMAGE_NAME/versions"
