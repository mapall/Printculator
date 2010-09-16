//
//  MainWindowController.h
//  Printculator
//
//  Created by Miroslav Zoricak on 9/9/10.
//  Copyright (c) 2010 uDesign.sk. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface MainWindowController : NSWindowController<NSTabViewDelegate> {
	IBOutlet NSTextField *quantityTextField;
    IBOutlet NSTextField *fixedExpensesTextField;
    IBOutlet NSTabView *sheetTabView;
    IBOutlet NSPopUpButton *paperFormatPopUpButton;
    IBOutlet NSTextField *printsPerSheetTextField;
    IBOutlet NSPopUpButton *paperTypePopUpButton;
    IBOutlet NSPopUpButton *frontColorPopUpButton;
    IBOutlet NSPopUpButton *backColorPopUpButton;
    IBOutlet NSPopUpButton *frontPostProcessPopUpButton;
    IBOutlet NSPopUpButton *backPostProcessPopUpButton;
    IBOutlet NSTextField *foldingTextField;
    IBOutlet NSTextField *trimmingTextField;
    IBOutlet NSTextField *totalPriceTextField;
    IBOutlet NSTextField *perPiecePriceTextField;
	
	NSMutableDictionary *costs;
}

- (IBAction)recalculate:(id)sender;
- (void)recalculateNotification:(NSNotification *)aNotification;

@end
