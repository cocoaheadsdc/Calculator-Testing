@class Calculator;

@interface CalculatorViewController : UIViewController {
	
	IBOutlet UIButton *zeroB;	
	IBOutlet UIButton *oneB;
	IBOutlet UIButton *twoB;
	IBOutlet UIButton *threeB;
	IBOutlet UIButton *fourB;
	IBOutlet UIButton *fiveB;
	IBOutlet UIButton *sixB;
	IBOutlet UIButton *sevenB;
	IBOutlet UIButton *eightB;
	IBOutlet UIButton *nineB;
	IBOutlet UIButton *plusB;
	IBOutlet UIButton *enterB;
	IBOutlet UIButton *clearB;
	IBOutlet UILabel *resultsL;
	
	Calculator *calculator;
	
	NSNumber *firstOperand;
	NSNumber *secondOperand;
	
	BOOL shouldEraseResults;
}

@end