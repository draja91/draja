//
//  AppDelegate.m
//  RecipeApp1
//
//  Created by Dharini on 05/12/16.
//  Copyright © 2016 Dharini. All rights reserved.
//

#import "AppDelegate.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    [Parse initializeWithConfiguration:[ParseClientConfiguration configurationWithBlock:^(id<ParseMutableClientConfiguration> configuration) {
        configuration.applicationId = @"afIyyesyvqkG9vOsRGSwgRsgAby6GYzxonTH4ieB";
        configuration.clientKey = @"GxeWw35hGQhEMKRWGWG40SbwfGyDBcc2fBFiYUaa";
        configuration.server = @"https://parseapi.back4app.com";
        configuration.localDatastoreEnabled = YES; // If you need to enable local data store
    }]];
    
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        
    }else {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
        UIViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"LoginScreen"];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:vc];
        [self.window setRootViewController:navController];
    }
    
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    [FBSDKAppEvents activateApp];
   }


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            sourceApplication:(nullable NSString *)sourceApplication annotation:(nonnull id)annotation {
    
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                                  openURL:url
                                                        sourceApplication:sourceApplication
                                                               annotation:annotation];
    
}

@end
