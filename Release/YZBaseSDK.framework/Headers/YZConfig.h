//
//  YZSDKConfig.h
//  YZBaseSDK
//
//  Created by Pan on 2017/11/2.
//  Copyright © 2017年 Youzan. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

/**
 SDK 配置类，包含对 SDK 的所有配置。
 */
@interface YZConfig : NSObject

@property (nonatomic, readonly) NSString *clientId;/** 从有赞云申请的 clientId */
@property (nonatomic, readonly) NSString *appKey; /** 从有赞云申请的 appKey */
@property (nonatomic, copy, nullable) NSString *scheme;/**< App 的 Scheme, 设置后调用 h5 微信支付才能跳转回您的 App. 例如: wechat */
@property (nonatomic, assign) BOOL enableLog; /**< 是否开启控制台日志输出，默认为NO。仅在 DEBUG 模式下有效*/
@property (nonatomic, assign) BOOL hideTopBar; /** 是否隐藏TopBar,默认 NO**/
@property (nonatomic, assign) BOOL enableSocket; /** 是否开启应用内消息透传功能。 **/
@property (nonatomic, assign) BOOL disableDefaultLoading; /** 是否关闭默认加载动画，默认为NO */
@property (nonatomic, assign) BOOL dismissLoadingViewInDomReady;  /**前端readyState == interactive 时机隐藏loading，否则默认页面加载完成时隐藏loading */
@property (nonatomic, strong) NSArray *customerLoadingImages; /** 默认加载动画替换，传入动图所有帧图片数组，建议 100*100 */
@property (nonatomic, assign) NSTimeInterval customerLoadingImagesInteval; /** 加载动画时间间隔调整，默认0.35s每帧 */

@property (nonatomic, strong) UIView *customLoadingView; /** 自定义loading view */

@property (nonatomic, assign) BOOL useWechatSDK; /// 是否接入了微信SDK



/**
 初始化并返回一个配置。

 @param clientId 从有赞云申请的 client_id
 @param appKey 从有赞云申请的 appKey
 @return 一个配置。
 */
- (instancetype)initWithClientId:(NSString *)clientId andAppKey:(NSString *)appKey NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
