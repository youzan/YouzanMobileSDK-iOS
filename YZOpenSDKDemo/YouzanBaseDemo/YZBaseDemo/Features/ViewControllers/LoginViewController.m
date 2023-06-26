//
//  LoginViewController.m
//  YouzaniOSDemo
//
//  Created by 可乐 on 16/10/13.
//  Copyright © 2016年 Youzan. All rights reserved.
//

#import "LoginViewController.h"
#import <YZBaseSDK/YZBaseSDK.h>
#import <YZBaseSDK/YZSDK.h>
#import "YZDUICService.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录界面";
}

#pragma mark - Private Method

- (void)callBlockWithResult:(BOOL)success {
    if (self.loginBlock) {
        self.loginBlock(success);
    }
}

#pragma mark - Action

- (IBAction)close:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"不登录不能打开商品详情" delegate:self cancelButtonTitle:@"不登录" otherButtonTitles:@"登录",nil];
    [alertView show];
}

- (IBAction)login:(id)sender {
    /**
     登录方法(在你使用时，应该换成自己服务器给的接口来获取access_token，cookie)
     */
    [YZDUICService loginWithCompletionBlock:^(NSDictionary *info) {
        if (info && [info[@"code"] intValue] == 0) {
            [[YZSDK shared] loginWithOpenUserId:@"user_id" avatar:nil extra:nil nickName:nil gender:1 andCompletion:^(BOOL isSuccess, NSString * _Nullable yzOpenId) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self dismissViewControllerAnimated:YES completion:^{
                        [self callBlockWithResult:YES];
                    }];
                });
            }];
        }
    }];
}

#pragma mark - UIAlertView Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self dismissViewControllerAnimated:YES completion:^{
        if (buttonIndex == 0) {
            [self callBlockWithResult:NO];
            return;
        }
        //
        [self login:nil];
    }];
}

@end

