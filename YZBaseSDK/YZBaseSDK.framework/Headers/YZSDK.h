//
//  YZSDK.h
//  YZSDK
//
//  Created by kele on 15/11/19.
//  Copyright (c) 2015年 Youzan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/*!
 @header
 有赞云 AppSDK 通用信息管理。处理 webview 交互以及 cookie 和 token 的设置。
 */


// webview 中可能收到的通知类型
typedef NS_OPTIONS(NSUInteger, YouzanNotice) {
    NotYouzanNotice      = (1 << 0), //非有赞的
    IsYouzanNotice       = (1 << 1), //
    YouzanNoticeLogin    = (1 << 2), //登录通知
    YouzanNoticeShare    = (1 << 3), //分享数据的通知
    YouzanNoticeReady    = (1 << 4), //交互环境初始化成功的通知
    YouzanNoticeWXWapPay = (1 << 5), //已废弃
    YouzanNoticeOther    = (1 << 6), //无效通知
};

@interface YZNotice : NSObject
@property (assign, nonatomic) YouzanNotice notice;
@property (nullable, strong, nonatomic) id response;
@end


@interface YZSDK : NSObject

@property (nullable, nonatomic, copy, readonly) NSString *accessToken;

+ (instancetype)sharedInstance;
+ (NSString *)semanticVersion;

/**
 设置 client id

 @param clientId 从有赞云平台申请到的 client_id
 */
+ (void)setUpWithClientId:(NSString *)clientId;

/**
 设置你 App 的 Scheme, 设置后调用 h5 微信支付才能跳转回您的 App.
 
 @param scheme App 的 Scheme, 例如: wechat
 */
+ (void)setScheme:(NSString *)scheme;

/*!
 APP用户登录成功后设置。
 
 在推荐的认证模型中，您向您的 App 服务器发起登陆请求，您的 App 服务器向有赞服务器发起 sso 登陆请求.
 有赞服务器处理后，将相关信息返回到您的 App 服务器，您的 App 服务器再将相关信息返回给您的 App.
 当 App 拿到这些信息后，需要调用此接口，将授权信息同步给 SDK.
 
 @see https://www.youzanyun.com/docs/guide/appsdk/683

 @param token access_token
 @param key cookie_key
 @param value cookie_value
 */
+ (void)setToken:(NSString *)token key:(nullable NSString *)key value:(nullable NSString *)value;

/*!
 APP用户登出,清除token、cookie等
 */
+ (void)logout;

/*!
 *  是否开启日志【必须在debug模式下才有效，release模式下无效】
 *
 *  @param open YES是开启，NO是关闭
 */
+ (void)setOpenDebugLog:(BOOL)open;

#pragma mark - WebView 相关

/*!
 *  解析有赞的回调事件
 *
 *  @param url 当前传入的url参数
 */
+ (YZNotice *)noticeFromYouzanWithUrl:(NSURL *)url;

/**
 SDK 实现的 WebView Delegate. 必须实现！
 在你的 WebView 的对应代理方法中调用此方法
 
 @param webView webView
 */
+ (void)webViewDidStartLoad:(UIWebView *)webView;

/**
 SDK 实现的 WebView Delegate. 必须实现！
 在你的 WebView 的对应代理方法中调用此方法
 
 @param webView webView
 */
+ (void)webViewDidFinishLoad:(UIWebView *)webView;

/**
 SDK 实现的 WebView Delegate. 必须实现！
 在你的 WebView 的对应代理方法中调用此方法
 
 @param webView webView
 */
+ (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;

/**
 SDK 实现的 WebView Delegate. 必须实现！
 某些请求可能不需要跳转，例如后退到发起微信支付页面，会导致循环跳转到微信的问题。
 在webview对应的代理方法中调用此方法，可以帮助你防止这些问题的发生。

 @param webView webView
 @param request request
 @param navigationType navigationType
 @return 是否应该load当前request。YES 表示 request 没问题，可以正常跳转，NO 表示不建议跳转。你可以在 webView 的对应方法中直接返回这个值。
 */
+ (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType;

/*!
 *  触发分享操作
 *
 *  @param webView webview
 */
+ (void)shareActionWithUIWebView:(UIWebView *)webView;

@end

@interface YZSDK (deprecated)
+ (void)initYouzanWithUIWebView:(UIWebView *)webView NS_DEPRECATED_IOS(2_0, 2_0, "use webViewDidFinishLoad instead");
+ (void)setUserAgent:(NSString *)userAgent NS_DEPRECATED_IOS(2_0, 2_0, "use setUpWithClientId instead");
@end

NS_ASSUME_NONNULL_END
