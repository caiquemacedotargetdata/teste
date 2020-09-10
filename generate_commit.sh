#!/bin/bash

#variables globals
USERNAME="caiquemacedotargetdata"
PASSWORD="829d0a4e67e"
URI_PROJECT="caiquemacedotargetdata/teste.git"

MESSAGE=$1

if [ ! -z "$MESSAGE" ]; then
	git add .
	git commit -m "$MESSAGE"
	git push https://${USERNAME}:${PASSWORD}@github.com/${URI_PROJECT} --all
	
	# Call other bash script to generate a tag in git
	sh ./generate_tag.sh

else
	echo "Sorry, Need put the message to commit"
fi