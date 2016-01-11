//
//  UserBean.h
//  picScan
//
//  Created by ocq on 14/8/15.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserBean : NSObject

//这里的属性不能为assign 
@property(nonatomic,copy)  NSString *username;
@property(nonatomic,copy)NSString *password;
#pragma 0代表不记住，1代表记住密码
@property(nonatomic,assign)NSInteger isRememberPassword;
#pragma YES登录 NO 未登录
@property(nonatomic,assign)BOOL isLogin;

@end
