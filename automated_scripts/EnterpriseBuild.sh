#!/bin/bash

function exit_with_error ( ) {
   echo $@
   exit 1
}

# Check for xcodeproj in current directory
if [ ! -d *.xcodeproj ]; then 	
	exit_with_error "Cannot find *.xcodeproj file";
else
	distribution_build_target="Distribution";
	distribution_configuration="Release";
	distribution_sdk=iphoneos4.3;
	
	rm -rf build;
	xcodebuild -target $distribution_build_target -configuration $distribution_configuration -sdk $distribution_sdk -xcconfig EnterpriseBuild.xcconfig;
fi