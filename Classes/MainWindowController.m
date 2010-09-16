//
//  MainWindowController.m
//  Printculator
//
//  Created by Miroslav Zoricak on 9/9/10.
//  Copyright (c) 2010 uDesign.sk. All rights reserved.
//

#import "ConstantsAndMacros.h"
#import "MainWindowController.h"


@implementation MainWindowController

- (id)initWithWindow:(NSWindow *)window {
    if ((self = [super initWithWindow:window])) {
		costs = [[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"costs" ofType:@"plist"]] retain];

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recalculateNotification:) name:NSTextDidChangeNotification object:nil];
		[sheetTabView setDelegate:self];
    }
    
    return self;
}

- (void)dealloc {
    // Clean-up code here.
    
    [super dealloc];
}

- (void)recalculate:(id)sender {
	NSLog(@"Recalculating...");
	NSDecimal totalPrice = [[NSNumber numberWithInt:0] decimalValue];
	
	NSDecimal quantity = [[NSNumber numberWithInt:[quantityTextField intValue]] decimalValue];
	
	NSDecimal folds = [[NSNumber numberWithInt:[foldingTextField intValue]] decimalValue];
	NSDecimal foldsPrice = [[NSNumber numberWithInt:0] decimalValue];
	NSDecimal pricePerFold = [[costs objectForKey:kPricePerFoldKey] decimalValue];
	
	NSDecimalMultiply(&foldsPrice, &folds, &pricePerFold, NSRoundPlain);
	NSDecimalMultiply(&foldsPrice, &foldsPrice, &quantity, NSRoundPlain);
	NSLog(@"Folds price %@", [NSDecimalNumber decimalNumberWithDecimal:foldsPrice]);
	
	NSDecimal fixedExpenses = [[NSDecimalNumber decimalNumberWithString:[fixedExpensesTextField stringValue]] decimalValue];
	NSDecimalAdd(&totalPrice, &totalPrice, &fixedExpenses, NSRoundPlain);
	
	NSString *totalPriceString = [[[NSDecimalNumber decimalNumberWithDecimal:totalPrice] stringValue] stringByAppendingString:@" €"];
	[totalPriceTextField setStringValue:totalPriceString];
	//NSDecimal perPiece = [[NSNumber
}

- (void)recalculateNotification:(NSNotification *)aNotification {
	[self recalculate:aNotification];
}

- (void)tabView:(NSTabView *)tabView didSelectTabViewItem:(NSTabViewItem *)tabViewItem {
	[self recalculate:tabView];
}

- (void)windowDidLoad {
    [super windowDidLoad];
}

@end
