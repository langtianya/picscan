//
//  UserPlist.m
//  picScan
//
//  Created by ocq on 14/8/20.
//  Copyright (c) 2014年 ocq. All rights reserved.
//


#import "UserPlistDao.h"
#import "FileUtils.h"
#import "UserBean.h"

#define USER_PLIST_FILE_NAME @"userInfo"

@implementation UserPlistDao


#pragma  mark保存用户信息
+(void)saveUserInfo:(UserBean *)user
{
    //创建一个dic，写到plist文件里
    NSMutableDictionary* userPropretydic = [NSMutableDictionary dictionaryWithObjectsAndKeys:user.username,@"name",user.password,@"password", [NSNumber numberWithInteger:user.isRememberPassword],@"isRememberPassword",[NSNumber numberWithInteger:user.isLogin],@"isLogin",nil]; //写入数据
    
    //创建字典中的字典
  NSMutableDictionary* userdic = [NSMutableDictionary dictionaryWithObjectsAndKeys:userPropretydic,user.username,nil];
   

    
//    //创建字典中的字典
//    NSMutableDictionary* userdics = [NSMutableDictionary dictionaryWithObjectsAndKeys:userdic,@"userInfo",nil];
//    [FileUtils saveDictionary:userdics ToFile:USER_PLIST_FILE_NAME];
    
     NSMutableDictionary *userdics = [self getUsersDictionary] ;
    [userdics addEntriesFromDictionary:userdic];
    [FileUtils saveDictionary:userdics ToFile:USER_PLIST_FILE_NAME];
}



#pragma mark根据用户id获取单个用户信息
+ (NSMutableDictionary *)getUsersDictionary {
    //读取数据 获取第一个字典
    NSMutableDictionary* userDic = [FileUtils getFileDictionaryDataByFileName:USER_PLIST_FILE_NAME];
    
    if(!userDic){
        return nil;
    }
    
    //获取第二个字典
//    NSMutableDictionary *usersDic = [userDic objectForKey: @"userInfo"];
//    if(!userDic){
//        return nil;
//    }
    return userDic;
}


+(NSArray *)getUsers{
    
    NSMutableDictionary *usersDic = [self getUsersDictionary];
    NSMutableArray *users=[NSMutableArray alloc];
    //遍历字典
    [usersDic enumerateKeysAndObjectsWithOptions:NSEnumerationReverse usingBlock:^(id key, id obj, BOOL *stop) {
        
        NSMutableDictionary *userDic=obj;
        
        UserBean *userbean= [UserBean alloc];
        userbean.username=[userDic objectForKey:@"name"];
        userbean.password=[userDic objectForKey:@"password"];
        //NSNumber转化成integer
        userbean.isRememberPassword=[[userDic objectForKey:@"isRememberPassword"] integerValue];
        userbean.isLogin=[[userDic objectForKey:@"isLogin"] integerValue];
        
        [users addObject:userbean];
    }];
    
    return users;
}


#pragma 根据用户名获取用户bean
+(UserBean *)getUserbeanByName:(NSString *)username{
     NSMutableDictionary *usersDic = [self getUsersDictionary];
    UserBean *userbean= [UserBean alloc];
    
    //遍历字典
    [usersDic enumerateKeysAndObjectsWithOptions:NSEnumerationReverse usingBlock:^(id key, id obj, BOOL *stop) {
        
        NSMutableDictionary *userDic=obj;
        
      
        if ([username isEqualToString:[userDic objectForKey:@"name"]]) {
            
            
            userbean.username=[userDic objectForKey:@"name"];
            userbean.password=[userDic objectForKey:@"password"];
            //NSNumber转化成integer
            userbean.isRememberPassword=[[userDic objectForKey:@"isRememberPassword"] integerValue];
            userbean.isLogin=[[userDic objectForKey:@"isLogin"] integerValue];
            *stop=YES;
            
        }

    }];
    return userbean;
}

#pragma 根据用户名获取用户bean
+(UserBean *)getLastUserbean{
    NSMutableDictionary *usersDic = [self getUsersDictionary];
    UserBean *userbean= [UserBean alloc];
    
    
    //遍历字典
    [usersDic enumerateKeysAndObjectsWithOptions:NSEnumerationReverse usingBlock:^(id key, id obj, BOOL *stop) {
        
        NSMutableDictionary *userDic=obj;
        
        if ([[userDic objectForKey:@"isLogin"] integerValue]==1) {
            userbean.username=[userDic objectForKey:@"name"];
            userbean.password=[userDic objectForKey:@"password"];
            //NSNumber转化成integer
            userbean.isRememberPassword=[[userDic objectForKey:@"isRememberPassword"] integerValue];
            userbean.isLogin=[[userDic objectForKey:@"isLogin"] integerValue];
            *stop=YES;
        }
        
    }];
    return userbean;
}


+(BOOL)setUser:(NSString*)username toLoginStatus:(BOOL)status{
    UserBean *userbean= [self getUserbeanByName:username];
    userbean.isLogin=status;
    [self saveUserInfo:userbean];
    return YES;
}

@end
