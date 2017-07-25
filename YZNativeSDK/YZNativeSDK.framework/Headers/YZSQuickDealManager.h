//
//  YZSQuickDealManager.h
//  YouzanGoodDemo
//
//  Created by vee on 2017/3/30.
//  Copyright © 2017年 kele. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class YZSQuickDealManager;

@protocol YZSQuickDealManagerDelegate <NSObject>

- (void)receiveLoginRequestFromQuickManager:(YZSQuickDealManager *)manager completionBlock:(void(^)(BOOL result))completionBlock;

@end

@interface YZSQuickDealManager : NSObject

/**
 登录的委托
 */
@property (nonatomic, weak) id<YZSQuickDealManagerDelegate> delegate;

/**
 显示对应商品的快速操作页面

 @param viewController 显示操作页面所在的 viewcontroller
 @param alias 商品的alias
 */
- (void)showInViewController:(UIViewController *)viewController withGoodsAlias:(NSString *)alias;

@end
