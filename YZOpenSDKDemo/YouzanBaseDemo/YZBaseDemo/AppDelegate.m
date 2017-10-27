//
//  AppDelegate.m
//  youzanIOSDemo
//
//  Copyright (c) 2012-2015 © youzan.com. All rights reserved.
//

#import "AppDelegate.h"
//#import <YZBase/YZBase.h>
#import <YZBaseSDK/YZBaseSDK.h>

static NSString *CLIENT_ID = @"demo";/**< 测试专用clientId */
static NSString *SCHEME = @"hahahehe";/**< demo 的 scheme */

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 查看 sdk 的版本
    NSLog(@"%@", [YZSDK semanticVersion]);
    
    // 关闭 sdk 的 log 输出
    [YZSDK setOpenDebugLog:YES];
    [YZSDK setUpWithClientId:CLIENT_ID];
    [YZSDK setScheme:SCHEME];
    return YES;
}

@end

