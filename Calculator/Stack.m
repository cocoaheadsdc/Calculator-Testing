#import "Stack.h"



@implementation Stack



-(id)init {
	
	self = [super init];
	
	if (self) {
		stackArray = [[NSMutableArray alloc] initWithCapacity:1];
	}
	
	return self;
}



-(void)push:(id)object {
	[stackArray addObject:object];
}

-(id)pop {
	
	id object = [[stackArray lastObject] retain];
	
	[stackArray removeObject:object];
	
	return [object autorelease];
}



-(void)dealloc {
	
	[stackArray release], stackArray = nil;
	
	[super dealloc];
}



@end