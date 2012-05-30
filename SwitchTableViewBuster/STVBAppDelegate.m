//
//  STVBAppDelegate.m
//  SwitchTableViewBuster
//
//  Created by Andrew Wilcox on 29/05/2012.
//  Copyright (c) 2012 Wilcox Technologies. All rights reserved.
//

#import "STVBAppDelegate.h"

@implementation STVBAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

-(void)dealloc
{
	[_viewController release];
	[_window release];
	[super dealloc];
}


-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[self setWindow:[[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease]];
	[self setViewController:[[[STVBTableViewController alloc] initWithStyle:UITableViewStyleGrouped] autorelease]];
	[[self window] setBackgroundColor:[UIColor whiteColor]];
	[[self window] addSubview:[[self viewController] view]];
	[[self window] makeKeyAndVisible];
	return YES;
}

@end
