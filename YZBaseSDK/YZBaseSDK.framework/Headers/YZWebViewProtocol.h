//
//  YZWebViewProtocol.h
//  YZBaseSDK
//
//  Created by Pan on 2017/11/14.
//  Copyright © 2017年 Youzan. All rights reserved.
//

#ifndef YZWebViewProtocol_h
#define YZWebViewProtocol_h

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import "YZNotice.h"
NS_ASSUME_NONNULL_BEGIN

@protocol YZWebView;

@protocol YZWebViewDelegate <NSObject>

@required
- (void)webView:(id<YZWebView>)webView didReceiveNotice:(YZNotice *)notice;

@optional
- (BOOL)webView:(id<YZWebView>)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
- (void)webViewDidStartLoad:(id<YZWebView>)webView;
- (void)webViewDidFinishLoad:(id<YZWebView>)webView;
- (void)webView:(id<YZWebView>)webView didFailLoadWithError:(NSError *)error;

@end


@protocol YZWebView <NSObject>

/**
 代理对象，实现它来监听 YZNotice, 在得到对应通知的时候，做对应的操作。
 */
@property (nonatomic, weak, nullable) id<YZWebViewDelegate> delegate;

@property (nonatomic, strong, readonly) UIScrollView *scrollView;
@property (nonatomic, strong, readonly, nullable) NSURLRequest *originRequest;    //webview页面初始请求
@property (nonatomic, strong, readonly, nullable) NSURLRequest *currentRequest;
@property (nonatomic, strong, readonly, nullable) NSURL *URL;
@property (nonatomic, strong, readonly, nullable) JSContext *jsContext;
@property (nonatomic, assign, readonly,getter=isLoading) BOOL loading;
@property (nonatomic, assign, readonly) BOOL canGoBack;
@property (nonatomic, assign, readonly) BOOL canGoForward;

@property (nonatomic, assign) BOOL scalesPageToFit;

- (void)loadRequest:(NSURLRequest *)request;
- (void)loadHTMLString:(NSString *)string baseURL:(nullable NSURL *)baseURL;
- (void)reload;
- (void)reloadFromOrigin;
- (void)stopLoading;

- (void)goBack;
- (void)goForward;
- (void)gobackWithStep:(NSInteger)step;

- (NSInteger)countOfHistory;

- (void)evaluateJavaScript:(NSString *)javaScriptString
         completionHandler:(void (^ _Nullable)(id _Nullable response, NSError *_Nullable error))completionHandler;

/**
 分享当前页。分享相关的数据会在 webView:didReceiveNotice: 中返回。
 返回的数据结构：
 @{
 @"title": @"", // 标题
 @"link": @"", // 链接
 @"img_url": @"", // 图片的 url (可选，有些页面该字段为空）
 }
 */
- (void)share;

@end

NS_ASSUME_NONNULL_END

#endif /* YZWebViewProtocol_h */
