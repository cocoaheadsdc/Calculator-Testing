#!/bin/bash

function exit_with_error ( ) {
   echo $@
   exit 1
}

cd build || exit_with_error "'build' directory does not exist."
cd Release-iphoneos || exit_with_error "'Release-iphoneos' directory does not exist."

for APP_FILENAME in *.app; do
	
	APP_NAME=$(echo "$APP_FILENAME" | sed -e 's/.app//')
	
	MANIFEST_OUTPUT_HTML_FILENAME="${APP_NAME}-index.html"
	MANIFEST_OUTPUT_MANIFEST_FILENAME="${APP_NAME}-manifest.plist"
	IPA_FILENAME="$APP_NAME.ipa"	
	DSYM_FILENAME="$APP_FILENAME.dSYM"
 
 	/usr/bin/xcrun -sdk iphoneos PackageApplication -v "$APP_FILENAME" -o "$PWD/$IPA_FILENAME"

 	python ../../automated_scripts/GenerateManifest.py -f "$APP_FILENAME" -d "http://grantagilexmbp.local/~oladipog/$APP_NAME/$MANIFEST_OUTPUT_MANIFEST_FILENAME"

done
