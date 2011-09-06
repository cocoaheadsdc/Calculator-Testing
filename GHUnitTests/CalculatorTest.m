#import "Calculator.h"
#import "CalculatorTest.h"



@implementation CalculatorTest



-(void)testAddTwoNumbers {
	
	NSNumber *num1 = [NSNumber numberWithInt:2];
	NSNumber *num2 = [NSNumber numberWithInt:3];
	
	Calculator *calculator = [[Calculator alloc] init];
	
	NSNumber *result = [calculator add:num1:num2];
	NSNumber *expected = [NSNumber numberWithInt:5];
	
	GHAssertEquals(result, expected, nil);
}

-(void)testAddWithZero {
	
	NSNumber *num1 = [NSNumber numberWithInt:2];
	NSNumber *num2 = [NSNumber numberWithInt:0];
	
	Calculator *calculator = [[Calculator alloc] init];
	
	NSNumber *result = [calculator add:num1:num2];
	NSNumber *expected = [NSNumber numberWithInt:2];
	
	GHAssertEquals(result, expected, nil);
}



@end