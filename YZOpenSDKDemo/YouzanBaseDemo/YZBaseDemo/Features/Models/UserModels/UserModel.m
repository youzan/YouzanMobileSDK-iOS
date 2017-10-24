//
//  UserModel.m
//  YouzaniOSDemo
//
//  Created by 可乐 on 16/10/13.
//  Copyright © 2016年 Youzan. All rights reserved.
//

#import "UserModel.h"

static NSString *userA = @"123456";
static NSString *userB = @"1234567";

@implementation UserModel

+ (instancetype)sharedManage {
    static UserModel *shareManage = nil;
    static dispatch_once_t once;
    dispatch_once(&once,^{
        shareManage = [[self alloc] init];
        [shareManage resetUserValue];
    });
    return shareManage;
}

- (void)resetUserValue {
    self.userId = userA;
}

+ (void)changeUserId {
    UserModel *model = [UserModel sharedManage];
    if ([model.userId isEqualToString:userA]) {
        model.userId = userB;
    } else {
        model.userId = userA;
    }
}


@end

