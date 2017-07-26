//
//  UnsuggestMethod.h
//  YZNativeDemo
//
//  Created by vee on 2017/3/20.
//  Copyright © 2017年 kele. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const YourUserAgent;

@interface UnsuggestMethod : NSObject

/**
 不建议使用此方法，你应该在服务端处理登录信息的获取操作
 免得暴露隐私数据
 
 @param openUID 用户open id
 @param completionBlock 回调
 */
+ (void)loginWithOpenUid:(NSString *)openUID completionBlock:(void(^)(NSDictionary *info))completionBlock;


/**
 不建议使用此方法，你应该在服务端处理登录信息的获取操作
 免得暴露隐私数据
 
 @param completionBlock 回调
 */
+ (void)loginWithOutUserStateCompletionBlock:(void(^)(NSDictionary *info))completionBlock;

@end
