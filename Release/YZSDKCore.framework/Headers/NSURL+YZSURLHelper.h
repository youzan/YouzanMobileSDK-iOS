//
//  NSURL+YZSURLHelper.m
//  YouzanMobileSDK
//
//  Created by Pan on 2017/9/25.
//  Copyright © 2017年 Youzan. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 提供 url query 的快捷访问
 */
@interface NSURL (YZSURLHelper)

@property (nonatomic, strong) NSDictionary *yz_querys;

- (NSString *)yz_queryValueForKey:(NSString *)key;

// 支持下标语法
- (NSString *)objectForKeyedSubscript:(NSString *)key;
@end
