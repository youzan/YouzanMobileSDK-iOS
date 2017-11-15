//
//  YZNotice.h
//  YZBaseSDK
//
//  Created by Pan on 2017/11/1.
//  Copyright © 2017年 Youzan. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

// Notice 的类型
typedef NS_ENUM(NSUInteger, YZNoticeType) {
    YZNoticeTypeOther = 0, // 其他通知，用户无需关心
    YZNoticeTypeLogin, // 登录通知
    YZNoticeTypeShare, // 接收到分享请求的结果回调
    YZNoticeTypeReady, // Web页面已准备好，分享接口可用。
};

// !!!即将废弃，请迁移到 YZNoticeType

typedef NS_OPTIONS(NSUInteger, YouzanNotice) {
    NotYouzanNotice      = (1 << 0), //非有赞的
    IsYouzanNotice       = (1 << 1), //
    YouzanNoticeLogin    = (1 << 2), //登录通知
    YouzanNoticeShare    = (1 << 3), //分享数据的通知
    YouzanNoticeReady    = (1 << 4), //交互环境初始化成功的通知
    YouzanNoticeWXWapPay = (1 << 5), //已废弃
    YouzanNoticeOther    = (1 << 6), //无效通知
} NS_DEPRECATED_IOS(2_0, 2_0, "use YZNoticeType instead");

@interface YZNotice : NSObject

// nil 说明该 url 并不是有赞的 notice
- (nullable instancetype)initWithURL:(NSURL *)url NS_DESIGNATED_INITIALIZER;

@property (assign, nonatomic) YZNoticeType type; /**< notice 类型*/
@property (nullable, strong, nonatomic) id response; /**< 附带的数据*/

@property (assign, nonatomic) YouzanNotice notice NS_DEPRECATED_IOS(2_0, 2_0, "use type instead");
@end

NS_ASSUME_NONNULL_END
