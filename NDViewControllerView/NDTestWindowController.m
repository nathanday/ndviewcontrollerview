//
//  NDTestWindowController.m
//  NDViewControllerView
//
//  Created by Nathan Day on 28/04/14.
//  Copyright (c) 2014 Nathan Day. All rights reserved.
//

#import "NDTestWindowController.h"
#import "NDTestViewController.h"

@interface NDTestWindowController ()
{
	NSUInteger			_selectedTabIndex;
	NSUInteger			_tabCreationCount;
	NSMutableArray		* _deletedTabViewControllers;
}

@property (weak) IBOutlet NSTabView			* tabView;
@property (weak) IBOutlet NSPopUpButton		* popUpButton;

@end

@implementation NDTestWindowController

- (instancetype)init { return [super initWithWindowNibName:@"NDTestWindowController" owner:self]; }

- (NSMutableArray *)deletedTabViewControllers
{
	if( _deletedTabViewControllers == nil )
		_deletedTabViewControllers = [[NSMutableArray alloc] init];
	return _deletedTabViewControllers;
}


- (void)windowDidLoad
{
    [super windowDidLoad];
	[self createTabAtIndex:0 display:YES];
}

- (NSArray *)everyTabTitle { return [self.childViewControllers valueForKey:@"name"]; }
- (NSUInteger)maximumTabNumber { return self.childViewControllers.count-1; }


- (IBAction)addTabAction:(id)sender
{
	[self createTabAtIndex:self.selectedTabIndex+1 display:YES];
}

- (IBAction)removeTabAction:(id)sender
{
	[self removeTabAtIndex:self.selectedTabIndex];
}

- (void)createTabAtIndex:(NSUInteger)anIndex display:(BOOL)aDisplay
{
	NDTestViewController		* theViewController = nil;
	if( self.deletedTabViewControllers.count > 0 )
	{
		theViewController = [self.deletedTabViewControllers firstObject];
		[self.deletedTabViewControllers removeObject:theViewController];
	}
	else
		theViewController = [[NDTestViewController alloc] initWithCount:++_tabCreationCount];
	[self willChangeValueForKey:@"everyTabTitle"];
	[self willChangeValueForKey:@"maximumTabNumber"];
	[self addChildViewController:theViewController];
	if( anIndex > self.tabView.numberOfTabViewItems )
		anIndex--;
	[theViewController view];
	[self.tabView insertTabViewItem:theViewController.tabViewItem atIndex:anIndex];
	[self didChangeValueForKey:@"everyTabTitle"];
	[self didChangeValueForKey:@"maximumTabNumber"];
	if( aDisplay )
		self.selectedTabIndex = anIndex;
}

- (void)removeTabAtIndex:(NSUInteger)anIndex
{
	NDTestViewController		* theVieControler = [self.childViewControllers objectAtIndex:anIndex];
	[self.deletedTabViewControllers addObject:theVieControler];
	[self willChangeValueForKey:@"everyTabTitle"];
	[self willChangeValueForKey:@"maximumTabNumber"];
	[theVieControler removeFromParentController];
	[self.tabView removeTabViewItem:theVieControler.tabViewItem];
	[self didChangeValueForKey:@"everyTabTitle"];
	[self didChangeValueForKey:@"maximumTabNumber"];
}

@end
