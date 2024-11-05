//
//  YZSLog.h
//  YouzanGoodDemo
//
//  Created by vee on 2017/3/2.
//  Copyright © 2016年 Youzan. All rights reserved.
//

#import <Foundation/Foundation.h>

extern void YZSDKLog(NSString *format, ...);

@interface YZSLog : NSObject

+ (void)setLogEnabled:(BOOL)enable;

+ (BOOL)isEnable;

@end
