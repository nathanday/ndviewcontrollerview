/*
	NDViewControllerView.m

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

#import "NDViewControllerView.h"

@interface NDViewControllerView ()
{
}

@end

@implementation NDViewControllerView

- (void)viewWillMoveToWindow:(NSWindow *)aNewWindow
{
	NSViewController		* theViewController = (NSViewController*)self.nextResponder;
	if( ![theViewController isKindOfClass:[NSViewController class]] || theViewController.view != self )
		theViewController = nil;
	if( aNewWindow != nil )
	{
		if( [theViewController respondsToSelector:@selector(viewWillAppear:)] )
			[theViewController viewWillAppear:NO];
	}
	else
	{
		if( [theViewController respondsToSelector:@selector(viewWillDisappear:)] )
			[theViewController viewWillDisappear:NO];
	}
}

- (void)viewDidMoveToWindow
{
	NSViewController		* theViewController = (NSViewController*)self.nextResponder;
	if( ![theViewController isKindOfClass:[NSViewController class]] || theViewController.view != self )
		theViewController = nil;
	if( self.window != nil )
	{
		if( [theViewController respondsToSelector:@selector(viewDidAppear:)] )
			[theViewController viewDidAppear:NO];
	}
	else
	{
		if( [theViewController respondsToSelector:@selector(viewDidDisappear:)] )
			[theViewController viewDidDisappear:NO];
	}
}

- (void)layout
{
	NSViewController		* theViewController = (NSViewController*)self.nextResponder;
	if( ![theViewController isKindOfClass:[NSViewController class]] || theViewController.view != self )
		theViewController = nil;
	if( [theViewController respondsToSelector:@selector(viewWillLayoutSubviews)] )
		[theViewController viewWillLayoutSubviews];
	[super layout];
	if( [theViewController respondsToSelector:@selector(viewDidLayoutSubviews)] )
		[theViewController viewDidLayoutSubviews];
}

- (void)updateConstraints
{
	NSViewController		* theViewController = (NSViewController*)self.nextResponder;
	if( ![theViewController isKindOfClass:[NSViewController class]] || theViewController.view != self )
		theViewController = nil;
	[super updateConstraints];
	if( [theViewController respondsToSelector:@selector(updateViewConstraints)] )
		[theViewController updateViewConstraints];
}

- (void)setNextResponder:(NSResponder *)aResponder
{
	if( [aResponder isKindOfClass:[NSViewController class]] )
	{
		if( ![self.nextResponder isKindOfClass:[NSViewController class]] )
			[aResponder setNextResponder:self.nextResponder];
		[super setNextResponder:aResponder];
	}
	else if( self.nextResponder == nil )
	{
		[super setNextResponder:aResponder];
	}
	else
	{
		[self.nextResponder setNextResponder:aResponder];
	}
}


@end
