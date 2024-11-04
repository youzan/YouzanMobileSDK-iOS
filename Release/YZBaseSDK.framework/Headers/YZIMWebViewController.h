//
//  YZIMWebViewController.h
//  YZBaseSDK
//
//  Created by 宫城 on 2018/6/28.
//  Copyright © 2018 Youzan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZIMWebViewController : UIViewController

/**
 使用 H5 IM 之前，务必先登录
 */
@property (nonatomic, copy) void(^loginHanlder)(void);

/**
 取消登录或者登录失败回调
 */
@property (nonatomic, copy) void(^loginFailedHanlder)(void);

/**
 初始化聊天 H5 页面

 @param shopID 店铺 ID
 */
- (instancetype)initWithShopID:(NSUInteger)shopID;

@end

NS_ASSUME_NONNULL_END
