//
//  YZSQuickDealManager.h
//  YouzanGoodDemo
//
//  Created by vee on 2017/3/30.
//  Copyright © 2016年 Youzan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*!
 @header
 快速操作原生视图，用来解析商品信息展示购物窗并在适当的时候向代理发送登录请求
 */

@class YZSQuickDealManager;



/*!
 @protocol 快速操作视图协议
 */
@protocol YZSQuickDealManagerDelegate <NSObject>

/**
 登录请求

 @param manager 发送登录请求的快速操作视图
 @param completionBlock 登录后的回调，result表示是否登录成功
 */
- (void)receiveLoginRequestFromQuickManager:(YZSQuickDealManager *)manager completionBlock:(void(^)(BOOL result))completionBlock;

@end



/**
 @class 快速操作视图类
 */
@interface YZSQuickDealManager : NSObject

/*!
 登录的委托
 */
@property (nonatomic, weak) id<YZSQuickDealManagerDelegate> delegate;

/*!
 显示对应商品的快速操作页面

 @param viewController 显示操作页面所在的 viewcontroller
 @param alias 商品的alias
 */
- (void)showInViewController:(UIViewController *)viewController withGoodsAlias:(NSString *)alias;

@end
