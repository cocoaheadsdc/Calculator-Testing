#!/bin/bash

function exit_with_error ( ) {
   echo $@
   exit 1
}

cd build || exit_with_error "'build' directory does not exist."
cd Release-iphoneos || exit_with_error "'Release-iphoneos' directory does not exist."

for APP_FILENAME in *.app; do
	
	APP_NAME=$(echo "$APP_FILENAME" | sed -e 's/.app//')
	
	rm -rf "/Users/oladipog/Sites/$APP_NAME";
	mkdir "/Users/oladipog/Sites/$APP_NAME";
		
	cp -R ./ "/Users/oladipog/Sites/$APP_NAME";
	
done
