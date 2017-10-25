//
//  WebViewController.m
//  YouzaniOSDemo
//
//  Created by 可乐 on 16/10/13.
//  Copyright © 2016年 Youzan. All rights reserved.
//

#import "WebViewController.h"
#import "LoginViewController.h"
#import <YZBaseSDK/YZBaseSDK.h>
#import <Unsuggest/UnsuggestMethod.h>


@interface WebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) UIBarButtonItem *closeBarButtonItem; /**< 关闭按钮 */
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.title = @"UIWebView";
    [self initBarButtonItem];
    self.navigationItem.rightBarButtonItem.enabled = NO;//默认分享按钮不可用
    
    // 加载链接
    [self loginAndloadUrl:self.loadUrl];
}

- (BOOL)navigationShouldPopOnBackButton {
    if ([self.webView canGoBack]) {
        [self.webView goBack];
        self.navigationItem.leftItemsSupplementBackButton = YES;
        self.navigationItem.leftBarButtonItem = self.closeBarButtonItem;
        return NO;
    } else {
        return YES;
    }
}

- (void)dealloc {
    //Demo中 退出当前controller就清除用户登录信息
    [YZSDK logout];
    _webView.delegate = nil;
    _webView = nil;
}

#pragma mark - UIWebView Delegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [YZSDK webViewDidStartLoad:webView];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [YZSDK webViewDidFinishLoad:webView];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [YZSDK webView:webView didFailLoadWithError:error];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    BOOL should = [YZSDK webView:webView shouldStartLoadWithRequest:request navigationType:navigationType];
    if (!should) {
        return NO;
    }
    
    
    NSURL *url = [request URL];
    
    YZNotice *noticeFromYZ = [YZSDK noticeFromYouzanWithUrl:url];
    if(noticeFromYZ.notice & YouzanNoticeLogin) {//登录
        if (self.loginTime == kLoginTimeNever) {
            return NO;
        }
        [self presentNativeLoginViewWithBlock:^(BOOL success){
            if (success) {
                [webView reload];
            } else {
                if ([webView canGoBack]) {
                    [webView goBack];
                }
            };
        }];
        return NO;
    } else if(noticeFromYZ.notice & YouzanNoticeShare) {//分享
        [self alertShareData:noticeFromYZ.response];
        return NO;
    } else if(noticeFromYZ.notice & YouzanNoticeReady) {//有赞环境初始化成功，分享按钮可用
        self.navigationItem.rightBarButtonItem.enabled = YES;
        return NO;
    } else if (noticeFromYZ.notice & IsYouzanNotice) {
        return NO;
    }
    
    //加载新链接时，分享按钮先置为不可用，直到有赞环境初始化成功方可使用
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    return YES;
}

#pragma mark - Action

- (void)shareButtonAction {
    [YZSDK shareActionWithUIWebView:self.webView];
}
- (void)reloadButtonAction {
    [self.webView reload];
}
- (void)closeItemBarButtonAction {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Private

- (void)initBarButtonItem {
    //初始化关闭按钮
    self.closeBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(closeItemBarButtonAction)];
    UIBarButtonItem *reloadBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(reloadButtonAction)];
    //初始化分享按钮
    UIBarButtonItem *shareButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"分享" style:UIBarButtonItemStylePlain target:self action:@selector(shareButtonAction)];
    self.navigationItem.rightBarButtonItems = @[shareButtonItem,reloadBarButtonItem];
}

/**
 *  加载链接。
 *
 *  @remark 这里强制先登录再加载链接，你的工程里由你控制。
 *  @param urlString 链接
 */
- (void)loginAndloadUrl:(NSString*)urlString {
    if (self.loginTime != kLoginTimePrior) {
        [self loadWithString:urlString];
        return;
    }
    
    /**
     登录方法(在你使用时，应该换成自己服务器给的接口来获取access_token，cookie)
     */
    [UnsuggestMethod loginWithOpenUid:[UserModel sharedManage].userId completionBlock:^(NSDictionary *resultInfo) {
        if (resultInfo) {
            //用户登录成功
            [YZSDK setToken:resultInfo[@"data"][@"access_token"] key:resultInfo[@"data"][@"cookie_key"] value:resultInfo[@"data"][@"cookie_value"]];
            [self loadWithString:urlString];
        }
    }];
}

- (void)loadWithString:(NSString *)urlStr {
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.webView loadRequest:urlRequest];
    });
}

/**
 唤起原生登录界面
 
 @param block 登录事件回调
 */
- (void)presentNativeLoginViewWithBlock:(LoginResultBlock)block {
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *navigation = [board instantiateViewControllerWithIdentifier:@"login"];
    LoginViewController *loginVC = [navigation.viewControllers objectAtIndex:0];
    loginVC.loginBlock = block; //买家登录结果
    [self presentViewController:navigation animated:YES completion:nil];
}

/**
 *  显示分享数据
 *
 *  @param data
 */
- (void)alertShareData:(id)data {
    NSDictionary *shareDic = (NSDictionary *)data;
    NSString *message = [NSString stringWithFormat:@"%@\r%@" , shareDic[@"title"],shareDic[@"link"]];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"数据已经复制到黏贴版" message:message delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil];
    [alertView show];
    //复制到粘贴板
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = message;
}

@end

