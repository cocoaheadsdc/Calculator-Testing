//
//  MyClass.h
//  Calculator
//
//  Created by Grant Oladipo on 7/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GHUnitIOS/GHUnit.h> 

@interface StackTest : GHTestCase {
    
}

//-(void)testExample;
-(void)testPushAndPopOne;
-(void)testPushManyAndPopOne;
-(void)testPopOnEmpty;

@end