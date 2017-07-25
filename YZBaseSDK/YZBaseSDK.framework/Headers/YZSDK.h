//
//  YZSDK.h
//  YZSDK
//
//  Created by kele on 15/11/19.
//  Copyright (c) 2015年 Youzan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

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
+ (nonnull instancetype)sharedInstance;

/**
 设置UA信息

 @param userAgent UA
 */
+ (void)setUserAgent:(nonnull NSString *)userAgent;

/**
 APP用户登录成功后设置

 @param token access_token
 @param key cookie_key
 @param value cookie_value
 */
+ (void)setToken:(nonnull NSString *)token key:(nullable NSString *)key value:(nullable NSString *)value;

/**
 APP用户登出,清除token、cookie等
 */
+ (void)logout;

/**
 *  是否开启日志【必须在debug模式下才有效，release模式下无效】
 *
 *  @param open YES是开启，NO是关闭
 */
+ (void)setOpenDebugLog:(BOOL)open;

#pragma mark - WebView 相关

/**
 *  解析有赞的回调事件
 *
 *  @param url 当前传入的url参数
 */
+ (nonnull YZNotice *)noticeFromYouzanWithUrl:(nonnull NSURL *)url;

/**
 *  页面加载完成，初始化有赞交互环境
 *
 *  @param webView webview
 */
+ (void)initYouzanWithUIWebView:(nonnull UIWebView *)webView;

/**
 *  触发分享操作
 *
 *  @param webView webview
 */
+ (void)shareActionWithUIWebView:(nonnull UIWebView *)webView;


@end
