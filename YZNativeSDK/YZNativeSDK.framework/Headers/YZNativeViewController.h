//
//  YZNativeViewController.h
//  YouzanGoodsDemo
//
//  Created by 可乐 on 16/11/15.
//  Copyright © 2016年 kele. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YZNativeViewController;

@protocol YZNativeLoginDelegate <NSObject>

- (void)receiveLoginRequestFromYZNativeViewController:(YZNativeViewController*)native;

@end

typedef void(^YZShareBlock)(NSString *title,NSString *shareUrl);

typedef void(^YZWillLoadPageBlock)(YZNativeViewController *nativeViewController);
typedef void(^YZDidLoadPageBlock)(YZNativeViewController *nativeViewController);

@interface YZNativeViewController : UIViewController


/**
 购物车默认显示的版权文字，为空时不显示
 */
@property (nonatomic, copy) NSString *cartCopyRightString;

/**
 分享调用的block，参数为 标题和分享链接。如果为空，则调用默认的分享界面。
 */
@property (nonatomic, copy) YZShareBlock shareBlock;


/**
 将要跳转新的页面通知block，参数为当前的 Native View Controller
 */
@property (nonatomic, copy) YZWillLoadPageBlock willLoadPageBlock;


/**
 新的页面加载完成通知block，参数为当前的 Native View Controller
 */
@property (nonatomic, copy) YZDidLoadPageBlock didLoadPageBlock;


/**
 登录的委托
 */
@property (nonatomic, weak) id<YZNativeLoginDelegate> delegate;

/**
 初始访问url

 @param originURL 最开始的url，可以是各种微页面的地址
 @return UIViewController 对象
 */
- (instancetype)initWithOriginURL:(NSURL*)originURL;

/**
 用户登录后调用

 @param success 是否成功
 */
- (void)userDidLogin:(BOOL)success;

/**
 刷新界面
 */
- (void)refreshView;

/**
 是否可以回退

 @return YES：可以，NO：不可以
 */
- (BOOL)canGoBack;

/**
 回退界面
 */
- (void)goBack;

/**
 分享当前页面
 */
- (void)sharePage;

/**
 当前页面的标题

 @return 对应的标题
 */
- (NSString *)currentTitle;

@end
