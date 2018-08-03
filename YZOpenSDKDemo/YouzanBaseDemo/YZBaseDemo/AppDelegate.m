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
    YZConfig *conf = [[YZConfig alloc] initWithClientId:CLIENT_ID];
    conf.enableLog = NO; // 关闭 sdk 的 log 输出
    conf.scheme = SCHEME; // 配置 scheme 以便微信支付完成后跳转
    [YZSDK.shared initializeSDKWithConfig:conf];
    YZSDK.shared.delegate = self; // 必须设置代理方法，保证 SDK 在需要 token 的时候可以正常运行
    
    // 调用预加载接口，可以加速首屏启动
    // 注意！！！ 请一定要把下面的链接替换为你的链接
    [YZSDK.shared preloadURLs:@[[NSURL URLWithString:@"https://h5.youzan.com/v2/goods/2ok5106sjunmd"]]];
    
    // 查看 sdk 的版本
    NSLog(@"%@", YZSDK.shared.version);

    return YES;
}

- (void)yzsdk:(YZSDK *)sdk
needInitToken:(void (^)(NSString * _Nullable))callback
{
    // 调用有赞云的 init Token 接口并返回 token. 见：https://www.youzanyun.com/docs/guide/3400/3466
    // 最好由你的服务端来调用有赞的接口，客户端通过你的服务端间接调用有赞的接口获取 initToken 以保证安全性。
    [YZDUICService fetchInitTokenWithCompletionBlock:^(NSDictionary *info) {
        callback(info[@"access_token"]);
    }];
}

@end

