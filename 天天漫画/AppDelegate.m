//
//  AppDelegate.m
//  天天漫画
//
//  Created by qianfeng on 15-5-25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "AppDelegate.h"
#import "TTMenuViewController.h"
#import "TTHomeRecommendController.h"
#import "TTHomeClassifyController.h"
#import "TTHomeRankController.h"
#import "TTHomeUpdateController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    TTHomeRecommendController *recomendCon = [[TTHomeRecommendController alloc] init];
    TTHomeClassifyController *classify = [[TTHomeClassifyController alloc] init];
    TTHomeRankController *rank = [[TTHomeRankController alloc] init];
    TTHomeUpdateController *update = [[TTHomeUpdateController alloc] init];
    
    TTMenuViewController *menuController = [[TTMenuViewController alloc] initViewControllerWithTitleArray:@[@"推荐", @"分类", @"排行", @"追更"] vcArray:@[recomendCon,classify,rank,update]];
    
    menuController.navigationItem.title=@"漫画书城";
    
    recomendCon.menuController = menuController;
    classify.menuController = menuController;
    rank.menuController = menuController;
    update.menuController = menuController;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:menuController];
    
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"actionbar_top_background.9"] forBarMetrics:UIBarMetricsDefault];
    
    [nav.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.window.rootViewController=nav;
    
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
