//
//  YZDUICService.h
//  YZBaseDemo
//
//  Created by Pan on 2018/3/2.
//  Copyright © 2018年 Youzan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YZDemoConfig.h"

@interface YZDUICService : NSObject

/**
 获取 init Token。
 你应该在服务端处理登录信息的获取操作, 免得暴露隐私数据
 
 @param completionBlock 回调
 */
+ (void)fetchInitTokenWithCompletionBlock:(void(^)(NSDictionary *info))completionBlock;


/**
 获取登录态 token
 你应该在服务端处理登录信息的获取操作, 免得暴露隐私数据
 
 @param openUID 用户open id
 @param completionBlock 回调
 */
+ (void)loginWithOpenUid:(NSString *)openUID completionBlock:(void(^)(NSDictionary *info))completionBlock;

@end
