#!/bin/bash

USERNAME="caiquemacedotargetdata"
PASSWORD="829d0a4e67e"

#get highest tag number
VERSION=`git describe --abbrev=0 --tags`

#replace . with space so can split into an array
VERSION_BITS=(${VERSION//./ })

#get number parts and increase last one by 1
echo "FOI " + VERSION_BITS
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
		VNUM3=$((VNUM3+1))
		;;
	
	*)
		echo "Sorry, I don't understand"
	;;
esac

