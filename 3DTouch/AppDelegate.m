//
//  AppDelegate.m
//  3DTouch_Demo
//
//  Created by 潘学洋 on 15/12/28.
//  Copyright © 2015年 hdf. All rights reserved.
//

#import "AppDelegate.h"
#import "PXYTableViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //动态方法添加快捷菜单选项
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypePlay];
    UIMutableApplicationShortcutItem *item1 = [[UIMutableApplicationShortcutItem alloc] initWithType:@"playItem" localizedTitle:@"play" localizedSubtitle:@"打开" icon:icon1 userInfo:nil];
    
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare];
    
    UIMutableApplicationShortcutItem *item2 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"shareItem" localizedTitle:@"share" localizedSubtitle:@"分享" icon:icon2 userInfo:nil];
    
    [UIApplication sharedApplication].shortcutItems = @[item1,item2];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    PXYTableViewController *vc = [[PXYTableViewController alloc] init];
    UINavigationController *nVC = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nVC;
    [self.window makeKeyAndVisible];
    
    //程度第一次启动时可以通过以下方法获取到点击的item
    //    UIApplicationShortcutItem *item = [launchOptions valueForKey:UIApplicationLaunchOptionsShortcutItemKey];

    
    return YES;
}

//点击快捷菜单进入程序的回调函数
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
 
    if ([shortcutItem.type isEqualToString:@"playItem"]) {
        
        FirstViewController *fvc = [[FirstViewController alloc] init];
        [self.window.rootViewController showViewController:fvc sender:nil];
        
    }
    if ([shortcutItem.type isEqualToString:@"shareItem"]) {
        SecondViewController *svc = [[SecondViewController alloc] init];
        [self.window.rootViewController showViewController:svc sender:nil];
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
