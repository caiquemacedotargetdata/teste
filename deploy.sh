#!/bin/bash

#variables globals
USERNAME="caiquemacedotargetdata"
PASSWORD="829d0a4e67e"
URI_PROJECT="caiquemacedotargetdata/teste.git"

#get highest tag number
VERSION=`git describe --abbrev=0 --tags`

#replace . with space so can split into an array
VERSION_BITS=(${VERSION//./ })

#get number parts and increase last one by 1

case $1 in

	"-v")
		echo "Generated a version"
  
		VNUM1=${VERSION_BITS[0]}
		VNUM2=0
		VNUM3=0
		VNUM1=$((VNUM1+1))
	;;

	"-r")
		echo "Generated a release"
	  
		VNUM1=${VERSION_BITS[0]}
		VNUM2=${VERSION_BITS[1]}
		VNUM3=${VERSION_BITS[2]}
		
		if [ ${VNUM3/v/} -eq "9" ]; then
			VNUM3=0
		
			if [ VNUM2 -eq "9" ]; then
				VNUM1=$((VNUM1+1))
				VNUM2=0
				VNUM3=0
			else
				VNUM2=$((VNUM2+1))
			fi
		else
			VNUM3=$((VNUM3+1))
		fi
	;;
	
	*)
		echo "Sorry, I don't understand"
		
		exit;
	;;
esac

#create new tag
NEW_TAG="$VNUM1.$VNUM2.$VNUM3"

echo "Updating $VERSION to $NEW_TAG"

#get current hash and see if it already has a tag
GIT_COMMIT=`git rev-parse HEAD`
NEEDS_TAG=`git describe --contains $GIT_COMMIT 2>/dev/null`

#only tag if no tag already
if [ -z "$NEEDS_TAG" ]; then
    git tag $NEW_TAG
    echo "Tagged with $NEW_TAG"
    git push https://${USERNAME}:${PASSWORD}@github.com/${URI_PROJECT} --tags
else
    echo "Already a tag on this commit -> ${GIT_COMMIT}"
fi

