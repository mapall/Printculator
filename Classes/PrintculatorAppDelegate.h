//
//  PrintculatorAppDelegate.h
//  Printculator
//
//  Created by Miroslav Zoricak on 9/9/10.
//  Copyright (c) 2010 uDesign.sk. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PrintculatorAppDelegate : NSObject <NSApplicationDelegate> {
	NSWindow *window;
}

@property (retain) IBOutlet NSWindow *window;

@end
