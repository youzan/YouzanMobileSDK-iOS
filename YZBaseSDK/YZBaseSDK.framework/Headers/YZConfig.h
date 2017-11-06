//
//  YZSDKConfig.h
//  YZBaseSDK
//
//  Created by Pan on 2017/11/2.
//  Copyright © 2017年 Youzan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZConfig : NSObject

@property (nonatomic, readonly) NSString *clientId;/**< 从有赞云申请的 ClientId.*/
/** 设置你 App 的 Scheme, 设置后调用 h5 微信支付才能跳转回您的 App. 例如: wechat */
@property (nonatomic, copy, nullable) NSString *scheme; /**< App 的 Scheme */
@property (nonatomic, assign) BOOL enableLog; /**< 是否开启控制台日志输出，默认为NO。仅在 DEBUG 模式下有效*/

- (instancetype)initWithClientId:(NSString *)clientId NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
