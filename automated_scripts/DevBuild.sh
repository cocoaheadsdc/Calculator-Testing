#!/bin/bash

function exit_with_error ( ) {
   echo $@
   exit 1
}

# Check for xcodeproj in current directory
if [ ! -d *.xcodeproj ]; then 	
	exit_with_error "Cannot find *.xcodeproj file";
else
	
	development_build_target="DevBuild";
	development_configuration="Debug";
	development_sdk=iphonesimulator4.3;
	
	rm -rf build;
	WRITE_JUNIT_XML=YES GHUNIT_CLI=1 xcodebuild -target $development_build_target -configuration $development_configuration -sdk $development_sdk;
fi
