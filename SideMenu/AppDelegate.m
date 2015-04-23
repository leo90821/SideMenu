//
//  AppDelegate.m
//  SideMenu
//
//  Created by NiYao on 15/4/20.
//  Copyright (c) 2015年 NiYao. All rights reserved.
//

#import "AppDelegate.h"
#import "LeftMenuViewController.h"
#import "RightMenuViewController.h"
#import "MiddleViewController.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //create three views controller
    LeftMenuViewController *leftMenu = [[LeftMenuViewController alloc] init];
    RightMenuViewController *rightMenu = [[RightMenuViewController alloc] init];
    MiddleViewController *midView = [[MiddleViewController alloc] init];
    
    
    //create the controller of three view controller
    ViewController *viewsController = [[ViewController alloc] init];
    viewsController.leftMenu = leftMenu;
    viewsController.rightMenu = rightMenu;
    viewsController.midView = midView;
    //push middle the middle view controller(first view) to navigation stack bottom
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewsController];
    [navController.navigationController pushViewController:viewsController animated:YES];
    NSLog(@"app:%@", [navController viewControllers]);//print controllers in stack
    NSLog(@"app:%@", navController.navigationController);
    //RootCotroller
    self.window.rootViewController = viewsController;
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
