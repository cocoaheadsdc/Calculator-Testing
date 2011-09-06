#import "Calculator.h"



@implementation Calculator



-(NSNumber *)add:(NSNumber*)num1 :(NSNumber*)num2 {

	int n1 = [num1 intValue];
	int n2 = [num2 intValue];
	return [NSNumber numberWithInt:(n1+n2)];
}



@end