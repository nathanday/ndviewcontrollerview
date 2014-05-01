//
//  NDTestWindowController.h
//  NDViewControllerView
//
//  Created by Nathan Day on 28/04/14.
//  Copyright (c) 2014 Nathan Day. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NDViewController.h"

@interface NDTestWindowController : NDWindowController

@property(readonly,nonatomic)		NSArray			* everyTabTitle;
@property(readonly,nonatomic)		NSUInteger		maximumTabNumber;

@property(assign,nonatomic)			NSUInteger		selectedTabIndex;

- (IBAction)addTabAction:(id)sender;
- (IBAction)removeTabAction:(id)sender;

- (void)createTabAtIndex:(NSUInteger)anIndex display:(BOOL)display;
- (void)removeTabAtIndex:(NSUInteger)index;

@end
