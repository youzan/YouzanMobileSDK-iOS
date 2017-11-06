//
//  DemoTableViewController.m
//  YZNativeDemo
//
//  Created by vee on 2017/3/1.
//  Copyright © 2017年 Youzan. All rights reserved.
//

#import "DemoTableViewController.h"
#import <Unsuggest/UnsuggestMethod.h>
#import <YZNativeSDK/YZNativeSDK.h>
#import <YZBaseSDK/YZBaseSDk.h>

@interface DemoTableViewController ()<YZNLoginDelegate>

@property (nonatomic, copy) NSString *rootURLPath;

@end

@implementation DemoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [YZSDK.shared logout];
    // 初始化sdk
    YZConfig *conf = [[YZConfig alloc] initWithClientId:CLIENT_ID];
    conf.enableLog = NO; // 关闭 sdk 的 log 输出
    NSString* scheme = [[[NSBundle mainBundle].infoDictionary[@"CFBundleURLTypes"] firstObject][@"CFBundleURLSchemes"] firstObject];
    conf.scheme = scheme; // 配置 scheme 以便微信支付完成后跳转
    [YZSDK.shared initializeSDKWithConfig:conf];
    
    // 查看 sdk 的版本
    NSLog(@"%@", YZSDK.shared.version);
    
    _rootURLPath = @"https://h5.youzan.com/v2/goods/2xf7l0ac9y9m8";
    
    /**
     登录方法(在你使用时，应该换成自己服务器给的接口来获取access_token，cookie)
     */
    [UnsuggestMethod loginWithOutUserStateCompletionBlock:^(NSDictionary *resultInfo) {
        if (resultInfo) {
            [YZSDK.shared synchronizeAccessToken:resultInfo[@"data"][@"access_token"]
                                       cookieKey:nil
                                     cookieValue:nil];

        }
    }];
    // setp2: 设置 manager 代理
    [[YZNViewManager defaultManager] setDelegate:self];
    
}

- (void)touchShareButton:(id)sender {
    [[YZNViewManager defaultManager] shareViewController:self.navigationController.viewControllers.lastObject
                                          withShareBlock:nil];
}

// method1: 处理登录请求
- (void)receiveLoginRequestFrom:(YZNViewManager *)manager
{
    
    /**
     登录方法(在你使用时，应该换成自己服务器给的接口来获取access_token，cookie)
     */
    [UnsuggestMethod loginWithOpenUid:@"123456" completionBlock:^(NSDictionary *resultInfo) {
        if (resultInfo) {
            [YZSDK.shared synchronizeAccessToken:resultInfo[@"data"][@"access_token"]
                                       cookieKey:resultInfo[@"data"][@"cookie_key"]
                                     cookieValue:resultInfo[@"data"][@"cookie_value"]];

            dispatch_async(dispatch_get_main_queue(), ^{
                [manager userDidLogin:YES];
            });
        }
    }];
}

// method2: 处理页面跳转，不实现默认push到 fromViewController 的 UINavigationController 中
/*
 - (void)willShowViewController:(UIViewController *)toViewController from:(UIViewController *)fromViewController
 {
 
 }
 */

#pragma mark -
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        // step3: 展示入口
        UIViewController *vc = [[YZNViewManager defaultManager] viewControllerForUrl:[NSURL URLWithString:_rootURLPath]];
        vc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"分享"
                                                                                style:UIBarButtonItemStyleDone
                                                                               target:self
                                                                               action:@selector(touchShareButton:)];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
