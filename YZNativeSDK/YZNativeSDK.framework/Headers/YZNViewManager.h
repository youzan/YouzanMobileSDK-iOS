//
//  YZNViewManager.h
//  YZNativeSDK
//
//  Created by vee on 2017/7/26.
//  Copyright © 2017年 Youzan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^YZShareCallBackBlock)(NSString *title, NSURL *shareURL, NSURL *_Nullable imageURL);

/*!
 @header
 管理 AppSDK 原生视图，并在适当的时候向代理发送登录请求
 */
@class YZNViewManager;

@protocol YZNLoginDelegate <NSObject>

@required

/*!
 登录请求

 @param manager 请求登录的manager
 */
- (void)receiveLoginRequestFrom:(YZNViewManager *)manager;

@optional

/*!
 页面跳转，如果此方法没有实现，默认会在当前 viewcontroller 的 navigationViewController 栈中 push 目标 viewcontroller

 @param toViewController 目标viewcontroller
 @param fromViewController 当前viewcontroller
 */
- (void)willShowViewController:(UIViewController *)toViewController from:(UIViewController *)fromViewController;

/*!
 是否加载指定的网页地址，如果不实现此方法，默认使用sdk的默认逻辑去判断

 @param url 将要加载的url
 @return YES 由SKDK继续加载，NO 交由客户端处理
 */
- (BOOL)shouldLoadWebURL:(NSURL *)url;

@end


@interface YZNViewManager : NSObject

+ (instancetype)defaultManager;

/*!
 购物车默认显示的版权文字，为空时不显示
 */
@property (nonatomic, copy) NSString *cartCopyRightString;

/*!
 登录的委托
 */
@property (nonatomic, weak) id<YZNLoginDelegate> delegate;

/*!
 用户登录后调用
 
 @param success 是否成功
 */
- (void)userDidLogin:(BOOL)success;

/*!
 想访问的链接地址
 
 @return 合适的UIViewController 对象
 */
- (UIViewController *)viewControllerForUrl:(NSURL *)url;

/*!
 分享页面，当shareblock为nil时，调用系统的分享页面

 @param viewController 需要分享的视图
 @param shareBlock 对需要分享的视图的标题与链接处理的block
 */
- (void)shareViewController:(UIViewController *)viewController
             withShareBlock:(_Nullable YZShareCallBackBlock)shareBlock;

/*!
 刷新目标 viewcontroller

 @param viewController 需要刷新的viewcontroller
 */
- (void)refreshViewController:(UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
