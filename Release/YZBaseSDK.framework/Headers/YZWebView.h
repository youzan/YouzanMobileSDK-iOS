//
//  YZWebView.h
//  YZBaseSDK
//
//  Created by Pan on 2017/10/26.
//  Copyright © 2017年 Youzan. All rights reserved.
//


#import "YZWebViewBase.h"

NS_ASSUME_NONNULL_BEGIN

@class YZNotice;

@protocol YZWebViewNoticeDelegate <NSObject>

- (void)webView:(id<YZWebView>)webView didReceiveNotice:(YZNotice *)notice;

@end

/**
 提供了 WebView 的所有能力，对有赞商城体系的页面做了优化。
 */
@interface YZWebView : YZWebViewBase <YZWebView>

@property (nonatomic, weak) id<YZWebViewNoticeDelegate> noticeDelegate;

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
