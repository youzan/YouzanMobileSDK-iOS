//
//  DemoTableViewController.m
//  YZNativeDemo
//
//  Created by vee on 2017/3/1.
//  Copyright © 2017年 kele. All rights reserved.
//

#import "DemoTableViewController.h"
#import <Unsuggest/UnsuggestMethod.h>
#import <YZNativeSDK/YZNativeSDK.h>
#import <YZBaseSDK/YZBaseSDk.h>

@interface DemoTableViewController ()<YZNativeLoginDelegate>

@property (nonatomic, copy) NSString *rootURLPath;

@end

@implementation DemoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [YZSDK logout];
    [YZSDK setUserAgent:YourUserAgent];
    _rootURLPath = @"https://h5.koudaitong.com/v2/showcase/homepage?alias=juhos0";
    [UnsuggestMethod loginWithOutUserStateCompletionBlock:^(NSDictionary *resultInfo) {
        if (resultInfo) {
            [YZSDK setToken:resultInfo[@"data"][@"access_token"] key:nil value:nil];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)receiveLoginRequestFromYZNativeViewController:(YZNativeViewController *)native
{
    [UnsuggestMethod loginWithOpenUid:@"123456" completionBlock:^(NSDictionary *resultInfo) {
        if (resultInfo) {
            [YZSDK setToken:resultInfo[@"data"][@"access_token"] key:resultInfo[@"data"][@"cookie_key"] value:resultInfo[@"data"][@"cookie_value"]];
            dispatch_async(dispatch_get_main_queue(), ^{
                [native userDidLogin:YES];
            });
        }
    }];
}

#pragma mark - 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        YZNativeViewController *vc = [[YZNativeViewController alloc] initWithOriginURL:[NSURL URLWithString:_rootURLPath]];
        vc.delegate = self;
        [self.navigationController pushViewController:vc animated:YES];
    }
}




@end
