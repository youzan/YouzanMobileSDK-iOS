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
    
    [YZSDK logout];
    // step1: 设置clientId
    [YZSDK setUpWithClientId:CLIENT_ID];
    // 设置 scheme, 微信支付后可以跳回应用
    NSString* scheme = [[[NSBundle mainBundle].infoDictionary[@"CFBundleURLTypes"] firstObject][@"CFBundleURLSchemes"] firstObject];
    [YZSDK setScheme:scheme];
    _rootURLPath = @"https://h5.koudaitong.com/v2/showcase/homepage?alias=juhos0";
    
    /**
     登录方法(在你使用时，应该换成自己服务器给的接口来获取access_token，cookie)
     */
    [UnsuggestMethod loginWithOutUserStateCompletionBlock:^(NSDictionary *resultInfo) {
        if (resultInfo) {
            [YZSDK setToken:resultInfo[@"data"][@"access_token"] key:nil value:nil];
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
            [YZSDK setToken:resultInfo[@"data"][@"access_token"] key:resultInfo[@"data"][@"cookie_key"] value:resultInfo[@"data"][@"cookie_value"]];
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
