//
//  WebViewController.h
//  YouzaniOSDemo
//
//  Created by 可乐 on 16/10/13.
//  Copyright © 2016年 Youzan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, loginTime) {
    kLoginTimeNever = 0,     //演示不登录
    kLoginTimePrior = 1,     //演示先登录
    kLoginTimeWhenNeed = 2,  //演示后登录
};

@interface WebViewController : UIViewController
/**
 登录时机
 */
@property (assign, nonatomic) loginTime loginTime;
/**
 首次加载链接
 */
@property (copy, nonatomic) NSString *loadUrl;
@end

