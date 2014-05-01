//
//  NDTestViewController.m
//  NDViewControllerView
//
//  Created by Nathan Day on 28/04/14.
//  Copyright (c) 2014 Nathan Day. All rights reserved.
//

#import "NDTestViewController.h"

@interface NDTestViewController ()
{
	NSTabViewItem		* _tabViewItem;
	NSUInteger			_count;

	NSUInteger			_viewDidLoadCalled;
	NSUInteger			_viewWillAppearCalled;
	NSUInteger			_viewDidAppearCalled;
	NSUInteger			_viewWillDisappearCalled;
	NSUInteger			_viewDidDisappearCalled;
	NSUInteger			_viewWillLayoutSubviewsCalled;
	NSUInteger			_viewDidLayoutSubviewsCalled;
	NSUInteger			_updateViewConstraintsCalled;
}

@end

@implementation NDTestViewController

- (NSString *)name { return [NSString stringWithFormat:@"View Controller %lu", (unsigned long)self.count]; }

- (instancetype)initWithCount:(NSUInteger)aCount
{
	if( (self = [super initWithNibName:@"NDTestViewController" bundle:nil]) != nil)
		_count = aCount;
	return self;
}

- (void)viewDidLoad
{
	self.viewDidLoadCalled++;
	self.view.frame = [self.tabViewItem.view bounds];
	self.view.autoresizingMask = NSViewWidthSizable|NSViewHeightSizable;
	[self.tabViewItem.view addSubview:self.view];
}

- (void)viewWillAppear:(BOOL)animated
{
	self.viewWillAppearCalled++;
	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
	self.viewDidAppearCalled++;
	[super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	self.viewWillDisappearCalled++;
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	self.viewDidDisappearCalled++;
	[super viewDidDisappear:animated];
}

- (void)viewWillLayoutSubviews
{
	self.viewWillLayoutSubviewsCalled++;
	[super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews
{
	self.viewDidLayoutSubviewsCalled++;
	[super viewDidLayoutSubviews];
}

- (void)updateViewConstraints
{
	self.updateViewConstraintsCalled++;
	[super updateViewConstraints];
}

- (NSString *)description { return [NSString stringWithFormat:@"View Controller %lu", (unsigned long)self.count]; }
- (NSString *)debugDescription { return [NSString stringWithFormat:@"%@ %@", [super description], [self description]]; }

@end
