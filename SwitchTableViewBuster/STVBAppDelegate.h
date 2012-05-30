//
//  STVBAppDelegate.h
//  SwitchTableViewBuster
//
//  Created by Andrew Wilcox on 29/05/2012.
//  Copyright (c) 2012 Wilcox Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STVBTableViewController.h"

@interface STVBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) STVBTableViewController *viewController;

@end
