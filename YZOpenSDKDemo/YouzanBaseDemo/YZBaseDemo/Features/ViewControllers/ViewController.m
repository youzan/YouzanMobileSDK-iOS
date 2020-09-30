//
//  ViewController.m
//  YouzaniOSDemo
//
//  Created by 可乐 on 16/10/13.
//  Copyright © 2016年 Youzan. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"
#import "UserModel.h"
#import "YZBaseDemo-Swift.h"
#import "YZDemoConfig.h"

@interface ViewController ()
@property (strong, nonatomic) UIBarButtonItem *userIdBarButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"APP开店演示Demo";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"切换账户" style:UIBarButtonItemStyleDone target:self action:@selector(changeUser)];
    self.userIdBarButton = [[UIBarButtonItem alloc] initWithTitle:[self currentID] style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.leftBarButtonItem = self.userIdBarButton;
}

#pragma mark - Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        WebViewController *viewController = [[WebViewController alloc] init];
        viewController.loginTime = indexPath.row;
        //目前支持有赞的店铺主页链接、商品详情链接、商品列表链接、订单列表、会员中心等
        viewController.loadUrl = TEST_SHOP_URL;
        [self.navigationController pushViewController:viewController animated:YES];
    } else {
        SwiftWebViewController *vc = [[SwiftWebViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - Action

- (void)changeUser {
    [UserModel changeUserId];
    
    //update UI
    self.userIdBarButton.title = [self currentID];
}

#pragma mark - Private

- (NSString *)currentID {
    UserModel *model = [UserModel sharedManage];
    return [NSString stringWithFormat:@"ID:%@",model.userId];
}

@end

