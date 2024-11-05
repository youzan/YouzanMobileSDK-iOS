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
    YZNoticeTypeAddToCart, // 添加购物车
    YZNoticeTypeBuyNow,    // 立即购买
    YZNoticeTypeAfterCreateOrder, // 订单创建回调
    YZNoticeTypeAddUp,     // 点击结算时回调
    YZNoticeTypePaymentFinished, // 付款完成时，回调
    YZNoticeTypeAuthorizationSucceed, // 授权成功
    YZNoticeTypeAuthorizationFailed, // 授权失败，response 中获取 code 及 message
    YZNoticeTypeInvokeDisagreeProtocol, // 不同意协议并退出
    YZNoticeTypeAccountCancellationSucceed, // 账号注销成功
    YZNoticeTypeAccountCancellationFailed, // 账号注销失败
    YZGoCashier,  //拉起三方收银台
    YZGoToWechatMiniProgram, // 拉起微信小程序
    YZNoticeCustomAction,   // 自定义事件
};

@interface YZNotice : NSObject

// nil 说明该 url 并不是有赞的 notice
- (nullable instancetype)initWithURL:(NSURL *)url NS_DESIGNATED_INITIALIZER;

@property (assign, nonatomic) YZNoticeType type; /**< notice 类型*/
@property (nullable, strong, nonatomic) id response; /**< 附带的数据*/

@end

NS_ASSUME_NONNULL_END
