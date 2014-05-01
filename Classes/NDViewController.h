/*
	NDViewController.h

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

#import <Cocoa/Cocoa.h>

@interface NDViewController : NSViewController

- (BOOL)isViewLoaded;

@property(nonatomic,weak,readonly) id		parentController;

- (BOOL)isMovingToParentViewController;
- (BOOL)isMovingFromParentViewController;

@property(nonatomic,readonly) NSArray		* childViewControllers;

- (void)addChildViewController:(NDViewController *)childController;
- (void)removeFromParentController;

- (void)willMoveToParentViewController:(id)parent;
- (void)didMoveToParentViewController:(id)parent;

- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)viewDidAppear:(BOOL)animated;
- (void)viewWillDisappear:(BOOL)animated;
- (void)viewDidDisappear:(BOOL)animated;
- (void)viewWillLayoutSubviews;
- (void)viewDidLayoutSubviews;

- (void)updateViewConstraints;

@end

@interface NDWindowController : NSWindowController

@property(nonatomic,readonly) NSArray		* childViewControllers;

- (void)addChildViewController:(NDViewController *)childController;

@end
