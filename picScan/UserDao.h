//
//  UserDao.h
//  picScan
//
//  Created by ocq on 14/8/15.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserBean.h"

#define TABLENAME @"tuser"
#define NAME      @"name"
#define PASSWORD     @"password"
#define LOGIN_REMENBER  @"remenberPassWord"

@class UserBean;


@interface UserDao : NSObject

+(BOOL)save:(UserBean *) userbean;
+(BOOL)saveByPrepare:(UserBean *) userbean;

+(NSMutableArray *)getUserbeanArray;

#pragma 未实现
+(UserBean *)getUserbeanById:(NSInteger *)uid;
#pragma 未实现
+(UserBean *)getUserbeanByName:(NSString *)username;

+(BOOL)setUser:(NSString*)username toLoginStatus:(BOOL)status;


@end
