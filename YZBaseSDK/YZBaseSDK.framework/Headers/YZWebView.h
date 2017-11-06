//
//  YZWebView.h
//  YZBaseSDK
//
//  Created by Pan on 2017/10/26.
//  Copyright © 2017年 Youzan. All rights reserved.
//

#import <WebKit/WebKit.h>
#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@class YZNotice;

NS_ASSUME_NONNULL_BEGIN

@protocol YZWebViewDelegate;

@interface YZWebView : UIView

@property (nonatomic, weak, nullable) id<YZWebViewDelegate> delegate;

@property (nonatomic, readonly) UIScrollView *scrollView;
@property (nonatomic, strong, nullable) NSURLRequest *originRequest;    //webview页面初始请求
@property (nonatomic, strong, nullable) NSURLRequest *currentRequest;   //每次拦截到资源请求
@property (nonatomic, nullable) NSURL *URL;
@property (nonatomic, nullable) JSContext *jsContext;

@property (nonatomic, assign) BOOL scalesPageToFit;
@property (nonatomic, assign, getter=isLoading) BOOL loading;
@property (nonatomic, assign) BOOL canGoBack;
@property (nonatomic, assign) BOOL canGoForward;

- (void)loadRequest:(NSURLRequest *)request;
- (void)loadHTMLString:(NSString *)string baseURL:(nullable NSURL *)baseURL;
- (void)reload;
- (void)reloadFromOrigin;
- (void)stopLoading;

- (void)goBack;
- (void)goForward;
- (void)gobackWithStep:(NSInteger)step;

- (void)closeProgress;
- (void)resetProgress;

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

@protocol YZWebViewDelegate <NSObject>

@required
- (void)webView:(YZWebView *)webView didReceiveNotice:(YZNotice *)notice;

@optional
- (BOOL)webView:(YZWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
- (void)webViewDidStartLoad:(YZWebView *)webView;
- (void)webViewDidFinishLoad:(YZWebView *)webView;
- (void)webView:(YZWebView *)webView didFailLoadWithError:(NSError *)error;

@end
NS_ASSUME_NONNULL_END
