//
//  DemoQuickViewController.m
//  YZNativeDemo
//
//  Created by vee on 2017/4/11.
//  Copyright © 2017年 Youzan. All rights reserved.
//

#import "DemoQuickViewController.h"
#import <YZBaseSDK/YZBaseSDK.h>
#import <YZNativeSDK/YZNativeSDK.h>
#import <Unsuggest/UnsuggestMethod.h>

@interface DemoQuickViewController ()<YZSQuickDealManagerDelegate>

@property (nonatomic, strong) YZSQuickDealManager *manager;

@end

@implementation DemoQuickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (YZSQuickDealManager *)manager
{
    if (!_manager) {
        _manager = [[YZSQuickDealManager alloc] init];
        _manager.delegate = self;
    }
    return _manager;
}

- (void)receiveLoginRequestFromQuickManager:(YZSQuickDealManager *)manager completionBlock:(void (^)(BOOL))completionBlock
{
    /**
     登录方法(在你使用时，应该换成自己服务器给的接口来获取access_token，cookie)
     */
    [UnsuggestMethod loginWithOpenUid:@"111009" completionBlock:^(NSDictionary *resultInfo) {
        if (resultInfo) {
            [YZSDK setToken:resultInfo[@"data"][@"access_token"] key:resultInfo[@"data"][@"cookie_key"] value:resultInfo[@"data"][@"cookie_value"]];
        }
        if (completionBlock) {
            completionBlock(resultInfo ? YES : NO);
        }
    }];
}

- (IBAction)quickAction:(UIButton *)sender
{
    NSString *alias = @"";
    if (sender.tag == 1) {
        alias = @"1ybbfacqki04a";
    } else {
        alias = @"36bg7nvxzkhru";
    }
    [self.manager showInViewController:self withGoodsAlias:alias];
}

@end

