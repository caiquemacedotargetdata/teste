#!/bin/bash

#variables globals
USERNAME="caiquemacedotargetdata"
PASSWORD="829d0a4e67e"
URI_PROJECT="caiquemacedotargetdata/teste.git"

MESSAGE=$2
VERSION_OR_RELEASE=$2
echo MESSAGE
if [ "$1" ==  "-m" ] && [ ! -z "$MESSAGE" ] && [ ! -z "$VERSION_OR_RELEASE" ]; then
	git add .
	git commit -m "$MESSAGE"
	git push https://${USERNAME}:${PASSWORD}@github.com/${URI_PROJECT} --all
	
	# Call other bash script to generate a tag in git
	sh ./generate_tag.sh VERSION_OR_RELEASE

else
	echo "Sorry, Need put the message to commit"
fi