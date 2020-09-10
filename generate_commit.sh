#!/bin/bash

#variables globals
URI_PROJECT="caiquemacedotargetdata/teste.git"

USERNAME=$2
PASSWORD=$4
MESSAGE=$6
VERSION_OR_RELEASE=$7

if [ "$1" ==  "-u" ] && [ "$3" ==  "-p" ] && [ "$5" ==  "-m" ] && [ ! -z "$MESSAGE" ] && [ ! -z "$VERSION_OR_RELEASE" ]; then
	git add .
	git commit -m "$MESSAGE"
	git push https://${USERNAME}:${PASSWORD}@github.com/${URI_PROJECT} --all
	
	# Call other bash script to generate a tag in git
	bash ./generate_tag.sh $1 USERNAME $3 PASSWORD $VERSION_OR_RELEASE

else
	echo "Sorry, Need put the message to commit"
fi