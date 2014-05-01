/*
	NDViewController.m

	Created by Nathan Day on 25/04/14￼ under a MIT-style license.
	Copyright (c) 2008-￼2014 Nathan Day

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.
 */

#import "NDViewController.h"

@interface NDViewController ()
{
	BOOL					_isViewLoaded;
	id						__weak _parentController;
	NSMutableArray			* __strong _childViewControllers;
}

@property(nonatomic,weak,readwrite) id				parentController;

- (void)removeChildViewController:(NDViewController *)childController;

@end

@interface NDWindowController ()
{
	NSMutableArray			* __strong _childViewControllers;
}

- (void)removeChildViewController:(NDViewController *)childController;

@end

@implementation NDViewController

@synthesize			parentController = _parentController;

- (void)dealloc
{
	if(self.view.nextResponder == self )
		self.view.nextResponder = nil;
#if !__has_feature(objc_arc)
	[_childViewControllers release];
	[super dealloc];
#endif
}

- (void)setView:(NSView *)aView
{
	if( aView.nextResponder != self )
		aView.nextResponder = self;
	[super setView:aView];
	_isViewLoaded = YES;
	[self viewDidLoad];
}

- (BOOL)isViewLoaded { return _isViewLoaded; }

- (BOOL)isMovingToParentViewController { return NO; }
- (BOOL)isMovingFromParentViewController { return NO; }

- (NSArray *)childViewControllers { return [_childViewControllers copy]; }

- (void)addChildViewController:(NDViewController *)aChildController
{
	if( aChildController.parentController != self )
	{
		if( _childViewControllers == nil )
			_childViewControllers = [[NSMutableArray alloc] init];
		[aChildController willMoveToParentViewController:self];
		[_childViewControllers addObject:aChildController];
		aChildController.parentController = self;
		[aChildController didMoveToParentViewController:self];
	}
}

- (void)removeChildViewController:(NDViewController *)aChildController
{
	if( aChildController.parentController == self )
	{
		[aChildController willMoveToParentViewController:nil];
		[_childViewControllers removeObject:aChildController];
		aChildController.parentController = nil;
		[aChildController didMoveToParentViewController:nil];
	}
}

- (void)removeFromParentController
{
	if( [self.parentController respondsToSelector:@selector(removeChildViewController:)] )
		[self.parentController removeChildViewController:self];
}

- (void)willMoveToParentViewController:(id)aParent {}
- (void)didMoveToParentViewController:(id)aParent {}

- (void)viewDidLoad {}
- (void)viewWillAppear:(BOOL)animated {}
- (void)viewDidAppear:(BOOL)animated {}
- (void)viewWillDisappear:(BOOL)animated {}
- (void)viewDidDisappear:(BOOL)animated {}
- (void)viewWillLayoutSubviews {}
- (void)viewDidLayoutSubviews {}

- (void)updateViewConstraints {}

@end

@implementation NDWindowController

- (NSArray *)childViewControllers { return [_childViewControllers copy]; }

- (void)addChildViewController:(NDViewController *)aChildController
{
	if( aChildController.parentController != self )
	{
		if( _childViewControllers == nil )
			_childViewControllers = [[NSMutableArray alloc] init];
		[aChildController willMoveToParentViewController:self];
		[_childViewControllers addObject:aChildController];
		aChildController.parentController = self;
		[aChildController didMoveToParentViewController:self];
	}
}

- (void)removeChildViewController:(NDViewController *)aChildController
{
	if( aChildController.parentController == self )
	{
		[aChildController willMoveToParentViewController:nil];
		[_childViewControllers removeObject:aChildController];
		aChildController.parentController = nil;
		[aChildController didMoveToParentViewController:nil];
	}
}

@end