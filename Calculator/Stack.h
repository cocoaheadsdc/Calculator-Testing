@interface Stack : NSObject {
    
	NSMutableArray *stackArray;
}

-(void)push:(id)object;
-(id)pop;

@end