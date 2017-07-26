//
//  LoginViewController.m
//  YouzaniOSDemo
//
//  Created by 可乐 on 16/10/13.
//  Copyright © 2016年 张伟. All rights reserved.
//

#import "LoginViewController.h"
#import <YZBaseSDK/YZBaseSDK.h>
#import <Unsuggest/UnsuggestMethod.h>

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
    [UnsuggestMethod loginWithOpenUid:[UserModel sharedManage].userId completionBlock:^(NSDictionary *resultInfo) {
        if (resultInfo) {
            [YZSDK setToken:resultInfo[@"data"][@"access_token"] key:resultInfo[@"data"][@"cookie_key"] value:resultInfo[@"data"][@"cookie_value"]];
            [self dismissViewControllerAnimated:YES completion:^{
                [self callBlockWithResult:YES];
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
