//
//  PrintculatorAppDelegate.m
//  Printculator
//
//  Created by Miroslav Zoricak on 9/9/10.
//  Copyright (c) 2010 uDesign.sk. All rights reserved.
//

#import "PrintculatorAppDelegate.h"

@implementation PrintculatorAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application
}

- (void)dealloc {

	[window release];
    [super dealloc];
}

@end
