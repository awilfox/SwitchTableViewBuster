//
//  STVBTableViewController.m
//  SwitchTableViewBuster
//
//  Created by Andrew Wilcox on 29/05/2012.
//  Copyright (c) 2012 Wilcox Technologies. All rights reserved.
//

#import "STVBTableViewController.h"


@implementation STVBTableViewController

#pragma mark - Memory management
-(void)releaseObjects
{
	[buster release];
	buster = nil;
}


-(void)dealloc
{
	[self releaseObjects];
	[super dealloc];
}



#pragma mark - Actions
-(void)busterChangedValue:(id)sender
{
	NSAssert(sender == buster, @"Somebody called busterChangedValue directly");
	
	if([buster isOn])
	{
		[[self tableView] beginUpdates];
		[[self tableView] insertSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
		[[self tableView] endUpdates];
	} else {
		[[self tableView] beginUpdates];
		[[self tableView] deleteSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
		[[self tableView] endUpdates];
	}
}



#pragma mark - View lifecycle
-(void)viewDidLoad
{
	[super viewDidLoad];
	
	buster = [[UISwitch alloc] initWithFrame:CGRectZero];
	[buster addTarget:self action:@selector(busterChangedValue:) forControlEvents:UIControlEventValueChanged];
}


-(void)viewDidUnload
{
	[super viewDidUnload];
	[self releaseObjects];
}



#pragma mark - Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	if([buster isOn]) return 2;
	else return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil)
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
	
	
	if([indexPath section] == 0)
	{
		[cell setAccessoryView:buster];
		[[cell textLabel] setText:@"Double-Tap -->"];
	}
	else
	{
		[[cell textLabel] setText:@"Hello"];
	}
	
	return cell;
}



#pragma mark - Table view delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
