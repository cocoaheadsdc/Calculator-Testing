//  MyClass.m
//  Calculator
//
//  Created by Grant Oladipo on 7/7/11.
//  Copyright 2011 Agilex. All rights reserved.

#import	"Stack.h"
#import "StackTest.h"

@implementation StackTest

- (void)setUpClass {

}

- (void)tearDownClass {

}

- (void)setUp {

}

- (void)tearDown {

}  

//- (void)testExample {       
//	
//	NSString *a = @"foo";
//	GHTestLog(@"I can log to the GHUnit test console: %@", a);
//	GHAssertNotNULL(a, nil);
//}

-(void)testPushAndPopOne {
	
	Stack *stack = [[Stack alloc] init];
	
	NSNumber *numPushed = [NSNumber numberWithInt:1];
	
	[stack push:numPushed];
	
	NSNumber *numPopped = [stack pop];
	
	GHAssertEqualObjects(numPopped, numPushed, nil);
	
	[stack release];
}

-(void)testPushManyAndPopOne {
	
	Stack *stack = [[Stack alloc] init];
	
	NSNumber *numPushed = [NSNumber numberWithInt:1];
	[stack push:numPushed];
	
	numPushed = [NSNumber numberWithInt:2];
	[stack push:numPushed];
	
	NSNumber *numPopped = [stack pop];
	
	GHAssertEqualObjects(numPopped, numPushed, nil);
	
	[stack release];
}

-(void)testPopOnEmpty {
	
	Stack *stack = [[Stack alloc] init];
	
	id object = [stack pop];
	
	GHAssertNil(object, nil);
}

@end