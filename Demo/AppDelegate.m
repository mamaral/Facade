//
//  AppDelegate.m
//  Facade
//
//  Created by Mike on 4/27/15.
//  Copyright (c) 2015 Mike Amaral. All rights reserved.
//

#import "AppDelegate.h"
#import "ProfileViewController.h"
#import "TestViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[ProfileViewController new]];
    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
