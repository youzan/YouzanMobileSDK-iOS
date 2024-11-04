//
//  YZSHUD.h
//  YZNativeSDK
//
//  Created by Pan on 2017/9/11.
//  Copyright © 2017年 Youzan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZSHUD : NSObject

// auto hiding methods
+ (void)showMessage:(NSString *)message;

// mamually hiding methods
+ (void)showProgress;
+ (void)showProgressWithMessage:(NSString *)message;

+ (void)hide;


#pragma mark - Core Method

+ (void)showMessage:(NSString *)message
             toView:(UIView *)view;

+ (void)showProgressWithMessage:(NSString *)message
                         toView:(UIView *)view;

+ (void)hideFromView:(UIView *)view;


@end
