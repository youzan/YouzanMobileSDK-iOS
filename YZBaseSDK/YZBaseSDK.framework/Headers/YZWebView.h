//
//  YZWebView.h
//  YZBaseSDK
//
//  Created by Pan on 2017/10/26.
//  Copyright © 2017年 Youzan. All rights reserved.
//


#import "YZWebViewProtocol.h"

@class YZNotice, YZWebView;

NS_ASSUME_NONNULL_BEGIN
/**
 提供了 WebView 的所有能力，对有赞商城体系的页面做了优化，接口类似 UIWebView。
 */
@interface YZWebView : UIView <YZWebView>

@end

NS_ASSUME_NONNULL_END
