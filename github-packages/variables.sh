#!/bin/bash
echo "Source variables.sh"
export GH_USERNAME="marianzarg"
export GH_TOKEN=$(sed -n '2p' token.txt)
export GH_VER="3.0.0"
export GH_IMAGE_NAME="hello-world-gh-packages"
export GH_TAG_NAME="ghcr.io/$GH_USERNAME/$GH_IMAGE_NAME:$GH_VER"