//
//  YZWebViewBase.h
//  YZWebViewFramework
//
//  Created by Pan on 2018/1/9.
//  Copyright © 2017年 Youzan. All rights reserved.
//

#import "YZWebViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

/**
 YZWebView 支持的类型
 */
typedef NS_ENUM(NSUInteger, YZWebViewType) {
    YZWebViewTypeWKWebView
};

/**
 提供了 WebView 的所有能力，对有赞体系的页面做了优化。
 */
@interface YZWebViewBase : UIView <YZWebView, YZWebViewDelegate>

/**
 初始化并返回一个 YZWebView.
 
 @param type YZWebView 所使用的 WebView 类型，只支持 WKWebView 内核。
 @return 一个 YZWebView 的实例。
 */
- (instancetype)initWithWebViewType:(YZWebViewType)type;

@end

NS_ASSUME_NONNULL_END
