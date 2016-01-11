//
//  UserPlist.h
//  picScan
//
//  Created by ocq on 14/8/20.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserBean;

@interface UserPlistDao : NSObject


+(void)saveUserInfo:(UserBean *)user;

+(NSArray *)getUsers;

+(UserBean *)getLastUserbean;

#pragma 未实现
+(UserBean *)getUserbeanById:(NSInteger *)uid;

#pragma 根据用户名获取用户bean
+(UserBean *)getUserbeanByName:(NSString *)username;


#pragma 更新用户登陆状态
+(BOOL)setUser:(NSString*)username toLoginStatus:(BOOL)status;

@end
