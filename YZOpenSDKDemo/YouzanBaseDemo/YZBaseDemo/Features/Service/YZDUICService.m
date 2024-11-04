//
//  YZDUICService.m
//  YZBaseDemo
//
//  Created by Pan on 2018/3/2.
//  Copyright © 2018年 Youzan. All rights reserved.
//

#import "YZDUICService.h"
#import <YZBaseSDK/YZBaseSDK.h>
#import "YZDemoConfig.h"

@implementation YZDUICService
+ (void)ssoLoginWithCompletionBlock:(void (^)(BOOL success))completionBlock {
    [YZSDK.shared loginWithOpenUserId:@"18888888888" avatar:nil extra:@"test" nickName:@"test" gender:1 andCompletion:^(BOOL isSuccess, NSString * _Nullable yzOpenId) {
        if (completionBlock) {
            completionBlock(isSuccess);
        }
    }];
}

+ (void)ssoLogout {
    [YZSDK.shared logout];
}
@end
