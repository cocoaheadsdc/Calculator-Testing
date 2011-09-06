#!/bin/bash

function exit_with_error ( ) {
   echo $@
   exit 1
}

# Check for xcodeproj in current directory
if [ ! -d *.xcodeproj ]; then 	
	exit_with_error "Cannot find *.xcodeproj file";
else
	
	frank_build_target="Frank";
	frank_configuration="Debug";
	frank_sdk=iphonesimulator4.3;
	
	rm -rf build;
	xcodebuild -target $frank_build_target -configuration $frank_configuration -sdk $frank_sdk;
fi