//
//  AppDelegate.m
//  3D
//
//  Created by 薛坤龙 on 15/10/30.
//  Copyright © 2015年 薛坤龙. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "OneViewController.h"

#import "SareViewController.h"
#import "LookViewController.h"
#import "CompossViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    ViewController *viewController = [[ViewController alloc] init];
    UINavigationController *NavigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    NavigationController.navigationBar.barStyle = UIBarStyleBlack;
    NavigationController.tabBarItem.title = @"列表";

    OneViewController *oneViewController = [[OneViewController alloc] init];
    UINavigationController *oneNavigationController
    = [[UINavigationController alloc] initWithRootViewController:oneViewController];
    oneNavigationController.navigationBar.barStyle = UIBarStyleBlack;
    oneNavigationController.tabBarItem.title = @"设置";
    
    self.mainTabBarController = [[UITabBarController alloc] init] ;
    self.mainTabBarController.tabBar.tintColor = [UIColor colorWithRed:76.0/255.0 green:61.0/255.0 blue:142.0/255.0 alpha:1.0];
    self.mainTabBarController.viewControllers = [NSArray arrayWithObjects:
                                                 NavigationController,
                                                 oneNavigationController,
                                                 nil];
    [self.mainTabBarController setSelectedIndex:0];
    self.window.rootViewController = self.mainTabBarController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    if([shortcutItem.type isEqualToString:@"UITouchText.share"])
    {
         //获取shortcutItem 的userInfo的字典
         NSLog(@"%@",shortcutItem.userInfo);
         [self.mainTabBarController setSelectedIndex:0];
         //selectedViewController 本身就是导航视图  push的时候不用加navigationController
          SareViewController *sareViewController = [[SareViewController alloc] init];
         [self.mainTabBarController.selectedViewController pushViewController:sareViewController animated:YES];
        
    }else if ([shortcutItem.type isEqualToString:@"UITouchText.look"])
    {
        NSLog(@"%@",shortcutItem.userInfo);
       [self.mainTabBarController setSelectedIndex:0];
       LookViewController *sareViewController = [[LookViewController alloc] init];
       [self.mainTabBarController.selectedViewController pushViewController:sareViewController animated:YES];
    
    }else if ([shortcutItem.type isEqualToString:@"UITouchText.compose"])
    {
        NSLog(@"%@",shortcutItem.userInfo);
       [self.mainTabBarController setSelectedIndex:1];
       CompossViewController *sareViewController = [[CompossViewController alloc] init];
       [self.mainTabBarController.selectedViewController pushViewController:sareViewController animated:YES];

    }
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
