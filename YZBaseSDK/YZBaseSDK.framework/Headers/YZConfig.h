//
//  YZSDKConfig.h
//  YZBaseSDK
//
//  Created by Pan on 2017/11/2.
//  Copyright © 2017年 Youzan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 SDK 配置类，包含对 SDK 的所有配置。
 */
@interface YZConfig : NSObject

@property (nonatomic, readonly) NSString *clientId;/**< 从有赞云申请的 ClientId.*/
@property (nonatomic, copy, nullable) NSString *scheme;/**< App 的 Scheme, 设置后调用 h5 微信支付才能跳转回您的 App. 例如: wechat */
@property (nonatomic, assign) BOOL enableLog; /**< 是否开启控制台日志输出，默认为NO。仅在 DEBUG 模式下有效*/

/**
 初始化并返回一个配置。

 @param clientId 从有赞云申请的client_id。
 @return 一个配置。
 */
- (instancetype)initWithClientId:(NSString *)clientId NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
