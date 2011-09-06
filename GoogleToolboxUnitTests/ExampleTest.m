//  ExampleTest.m
//  Calculator
//
//  Created by Grant Oladipo on 6/22/11.
//  Copyright 2011 Agilex. All rights reserved.

#import "ExampleTest.h"

@implementation ExampleTest

- (void)setUp { //Run before each test
    [super setUp];
}

- (void)tearDown { //Run after each test
	[super tearDown];
}

-(void)testExample {
	
	NSString *a = @"foo";
	
	// Assert a is not NULL, with no custom error description
	STAssertNotNil(a, nil);
	
	// Assert equal objects, add custom error description
	// This test will fail if uncommented
//	NSString *b = @"bar";
//	STAssertEqualObjects(a, b, @"A custom error message. a should be equal to: %@.", b);
}




@end