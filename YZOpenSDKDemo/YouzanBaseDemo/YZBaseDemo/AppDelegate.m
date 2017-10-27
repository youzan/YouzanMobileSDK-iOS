//
//  AppDelegate.m
//  youzanIOSDemo
//
//  Copyright (c) 2012-2015 © youzan.com. All rights reserved.
//

#import "AppDelegate.h"
#import <Unsuggest/UnsuggestMethod.h>
#import <YZBaseSDK/YZBaseSDK.h>

static NSString *const SCHEME = @"yzbasedemo";/**< demo 的 scheme */

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 查看 sdk 的版本
    NSLog(@"%@", [YZSDK semanticVersion]);
    
    // 关闭 sdk 的 log 输出
    [YZSDK setOpenDebugLog:NO];
    [YZSDK setUpWithClientId:CLIENT_ID];
    [YZSDK setScheme:SCHEME];
    return YES;
}

@end

