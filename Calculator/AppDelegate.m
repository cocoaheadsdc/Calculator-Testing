#import "AppDelegate.h"
#import "CalculatorViewController.h"



@implementation AppDelegate

@synthesize window=_window;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	CalculatorViewController *calcVC = [[CalculatorViewController alloc] initWithNibName:@"Calculator" bundle:nil];
	self.window.rootViewController = calcVC;
	
	[calcVC release];
	
	[self.window makeKeyAndVisible];
    return YES;
}



- (void)dealloc {

	[_window release];
    
	[super dealloc];
}



@end