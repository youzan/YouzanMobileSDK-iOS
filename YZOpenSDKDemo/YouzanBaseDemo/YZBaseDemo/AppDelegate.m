//
//  AppDelegate.m
//  youzanIOSDemo
//
//  Copyright (c) 2012-2015 © youzan.com. All rights reserved.
//

#import "AppDelegate.h"
#import <YZBaseSDK/YZBaseSDK.h>
#import "UserModel.h"
#import "YZDUICService.h"

static NSString *const SCHEME = @"yzbasedemo";/**< demo 的 scheme */

@interface AppDelegate () <YZSDKDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 初始化sdk
    YZSDK.shared.delegate = self; // 必须设置代理方法，保证 SDK 在需要 token 的时候可以正常运行
    YZConfig *config = [[YZConfig alloc] initWithClientId:CLIENT_ID andAppKey:APPKEY];
    config.enableLog = NO; // 关闭 sdk 的 log 输出
    config.scheme = SCHEME; // 配置 scheme 以便微信支付完成后跳转
    [YZSDK.shared initializeSDKWithConfig:config];
    
    // 查看 sdk 的版本
    NSLog(@"%@", YZSDK.shared.version);

    return YES;
}

@end

