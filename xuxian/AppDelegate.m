//
//  AppDelegate.m
//  xuxian
//
//  Created by BugHunter on 15/9/22.
//  Copyright © 2015年 BugHunter. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeNavigationViewController.h"
#import "AroundNavigationViewController.h"
#import "ShoppingNavigationViewController.h"
#import "GuestNavigationViewController.h"
#import "LOLTabBarItem.h"
#import "HomeCollectionViewController.h"
#import "Constant.h"
#import "CollectionLayout.h"
#import "TestTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    UIColor *textColor = titleColor;
    [[LOLTabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:textColor,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    CollectionLayout *layout = [[CollectionLayout alloc] init];
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.itemSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.width/2+30);
    HomeCollectionViewController *hcvc = [[HomeCollectionViewController alloc] initWithCollectionViewLayout:layout];
    HomeNavigationViewController *hnvc = [[HomeNavigationViewController alloc] initWithRootViewController:hcvc];
    
    TestTableViewController *ttvc = [[TestTableViewController alloc] init];
    AroundNavigationViewController *anvc = [[AroundNavigationViewController alloc] initWithRootViewController:ttvc];
    
    ShoppingNavigationViewController *snvc = [[ShoppingNavigationViewController alloc] init];
    GuestNavigationViewController *gnvc = [[GuestNavigationViewController alloc] init];
    
    tabBarController.viewControllers= @[hnvc,anvc,snvc,gnvc];
    
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
