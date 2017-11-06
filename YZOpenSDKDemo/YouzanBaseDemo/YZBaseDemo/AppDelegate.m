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
    
    // 初始化sdk
    YZConfig *conf = [[YZConfig alloc] initWithClientId:CLIENT_ID];
    conf.enableLog = NO; // 关闭 sdk 的 log 输出
    conf.scheme = SCHEME; // 配置 scheme 以便微信支付完成后跳转
    [YZSDK.shared initializeSDKWithConfig:conf];
    
    // 查看 sdk 的版本
    NSLog(@"%@", YZSDK.shared.version);

    return YES;
}

@end

