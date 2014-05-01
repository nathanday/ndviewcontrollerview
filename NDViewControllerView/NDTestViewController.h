//
//  NDTestViewController.h
//  NDViewControllerView
//
//  Created by Nathan Day on 28/04/14.
//  Copyright (c) 2014 Nathan Day. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NDViewController.h"

@interface NDTestViewController : NDViewController

@property (strong) IBOutlet NSTabViewItem		* tabViewItem;

@property(readonly,nonatomic)		NSUInteger		count;
@property(readonly,nonatomic)		NSString		* name;

@property(assign,nonatomic)			NSUInteger		viewDidLoadCalled;
@property(assign,nonatomic)			NSUInteger		viewWillAppearCalled;
@property(assign,nonatomic)			NSUInteger		viewDidAppearCalled;
@property(assign,nonatomic)			NSUInteger		viewWillDisappearCalled;
@property(assign,nonatomic)			NSUInteger		viewDidDisappearCalled;
@property(assign,nonatomic)			NSUInteger		viewWillLayoutSubviewsCalled;
@property(assign,nonatomic)			NSUInteger		viewDidLayoutSubviewsCalled;
@property(assign,nonatomic)			NSUInteger		updateViewConstraintsCalled;


- (instancetype)initWithCount:(NSUInteger)count;

@end
