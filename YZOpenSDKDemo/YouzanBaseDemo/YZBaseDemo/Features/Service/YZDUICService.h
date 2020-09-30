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
 获取登录态 token
 你应该在服务端处理登录信息的获取操作, 免得暴露隐私数据
 
 @param completionBlock 回调
 */
+ (void)loginWithCompletionBlock:(void(^)(NSDictionary *info))completionBlock;


/**
 登出
 
 @param openUserID userID
 */
+ (void)logoutWithOpenUserID:(NSString *)openUserID;

@end
