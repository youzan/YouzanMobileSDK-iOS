//
//  LoginViewController.h
//  YouzaniOSDemo
//
//  Created by 可乐 on 16/10/13.
//  Copyright © 2016年 张伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

typedef void (^LoginResultBlock)(BOOL success);

@interface LoginViewController : UIViewController

@property (copy, nonatomic) LoginResultBlock loginBlock;

@end

