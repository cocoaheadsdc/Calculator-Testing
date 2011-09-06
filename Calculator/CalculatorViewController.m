#import "Calculator.h"
#import "CalculatorViewController.h"



@implementation CalculatorViewController



-(IBAction)touchedAddButton:(id)sender {
	
	[firstOperand release];
	firstOperand = [[NSNumber numberWithInt:[resultsL.text intValue]] retain];
	
	shouldEraseResults = YES;
}

-(IBAction)touchedClearButton:(id)sender {
	
}

-(IBAction)touchedEnterButton:(id)sender {
	
	[secondOperand release];
	secondOperand = [[NSNumber numberWithInt:[resultsL.text intValue]] retain];
	
	NSNumber *result = [calculator add:firstOperand 
									  :secondOperand];
	
	resultsL.text = [NSString stringWithFormat:@"%d", [result intValue]];
}

-(IBAction)touchedNumberButton:(id)sender {
	
	if (shouldEraseResults) {

		resultsL.text = @"0";
		shouldEraseResults = NO;
	}
	
	UIButton *buttonPressed = (UIButton *)sender;
	
	if ([resultsL.text isEqualToString:@"0"]) {
		resultsL.text = buttonPressed.titleLabel.text;
	} else {
		resultsL.text = [resultsL.text stringByAppendingString:buttonPressed.titleLabel.text];
	}
}



-(void)viewDidLoad {
	
	[super viewDidLoad];
	
	calculator = [[Calculator alloc] init];
}



-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return YES;
}



@end