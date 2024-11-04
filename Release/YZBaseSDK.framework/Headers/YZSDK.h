//
//  YZSDK.h
//  YZBaseSDK
//
//  Created by Pan on 2017/10/26.
//  Copyright © 2017年 Youzan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YZConfig, YZSDK;

NS_ASSUME_NONNULL_BEGIN

@protocol YZSDKDelegate <NSObject>

@optional
/// SDK安全校验成功或失败通知
- (void)yzsdkSecurityCheckSucceed:(YZSDK *)sdk;
- (void)yzsdkSecurityCheckFaild:(YZSDK *)sdk;

@end

typedef void(^YZSDKLoginCompletionHandler)(BOOL isSuccess, NSString * _Nullable yzOpenId);
typedef void(^YZSDKLogoutCompletionHandler)(void);

/*!
 有赞云 AppSDK 通用信息管理。以及 cookie 和 token 的设置。
 */
@interface YZSDK : NSObject

@property (class, readonly, strong) YZSDK *shared;/**< 使用单例访问接口*/
@property (nonatomic, weak) id<YZSDKDelegate> delegate;

@property (nonatomic, readonly, nullable) NSString *accessToken; /**< 正在使用的 access_token */
@property (nonatomic, readonly) YZConfig *config; /**< SDK 的配置*/
@property (nonatomic, readonly) NSString *version;/**< SDK 版本号*/

@property (nonatomic, readonly, assign) NSInteger connectState; /** -1为未连接，0为连接中，1为已连接 **/

/**
 初始化 SDK.
 使用 SDK 前必须先初始化 SDK.
 
 @param config 初始化配置。
 @see YZSDKConfig
 */
- (void)initializeSDKWithConfig:(YZConfig *)config;

/// 用户登录
/// @param openUserId 必传，开发者自身系统的用户ID，是三方App账号在有赞的唯一标识符，如更换将导致原用户数据丢失
/// @param avatar 非必传，用户头像，建议传https的url
/// @param extra 非必传，用户的额外信息
/// @param nickName 非必传，用户昵称
/// @param gender 非必传，性别 0(保密)、1(男)、2(女)
/// @param completion 登录完成回调，isSuccess 登录是否成功，yzOpenId 成功后返回的有赞openId
- (void)loginWithOpenUserId:(NSString *)openUserId
                     avatar:(NSString * _Nullable)avatar
                      extra:(NSString * _Nullable)extra
                   nickName:(NSString * _Nullable)nickName
                     gender:(NSInteger)gender
              andCompletion:(YZSDKLoginCompletionHandler)completion;

/**
 App用户登出,清除token、cookie等
 */
- (void)logout;

/**
 App用户登出，清除token及cookie等
 @param completion 清除token的成功回调，一般推荐在completion里执行webview的刷新操作
 */
- (void)logoutWithCompletion:(YZSDKLogoutCompletionHandler)completion;

/*!
 预加载 html、 资源文件等，优化首屏打开时间。需要在初始化 SDK 后调用。
 此功能已废弃
 
 @param urls 希望预加载的页面
 */
- (void)preloadURLs:(NSArray<NSURL *> *)urls __attribute__((deprecated));

/**
 清除 YZWebView 中自定义域名的相关cookie
 此方法只适用于定制域名客户，需在用户登出时调用

 @param domain 自定义域名，例如 www.youzan.com 只需要输入 youzan 即可
 */
- (void)clearCookiesOfDomain:(NSString *)domain;

/// 重试安全校验
- (void)securityCheck;

@end

NS_ASSUME_NONNULL_END
