//
//  ViewController.m
//  sqlitDemo
//
//  Created by rongfzh on 12-6-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DB.h"
#import "FileUtils.h"

#define DBNAME @"user.sqlite"


@interface DB ()

@end

@implementation DB

//
+(void)openDB
{
    if (!db) {
        
        NSString *database_path = [FileUtils getFilePathByFileName:DBNAME];
        
        //如果存在数据库直接获取，不存在就创建数据库
        if (sqlite3_open([database_path UTF8String], &db) != SQLITE_OK) {
            sqlite3_close(db);
            NSLog(@"数据库打开失败");
        }else {
            NSLog(@"打开数据库成功");
        }
    }else {
        NSLog(@"打开数据库成功");
    }
}


#pragma 执行除了查询意外的sql语句
+(BOOL)execSql:(NSString *)sql
{
    [self openDB];
    //错误信息指针变量，用于获取执行sql语句发生的错误
    char *err;
    //执行sql语句
    if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        //关闭数据库
        sqlite3_close(db);
        NSLog([NSString stringWithFormat:@"执行sql语句失败!"]);
        return NO;
    }
     sqlite3_close(db);
    return YES;
}

#pragma 创建数据库表
+(void)createTable{
    
//    [self openDB];
//    NSString *sqlCreateTable = @"CREATE TABLE IF NOT EXISTS t_user (ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,password TEXT, remenberPassWord INTEGER)";
    
    NSArray *tableSql= [[NSArray alloc]initWithObjects:
                        @"CREATE TABLE IF NOT EXISTS tuser(ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,password TEXT,remenberPassWord INTEGER,isLogin INTEGER)"
                        ,nil];
    
    //遍历数组（最快的方式） -sql数组，还有几种其中for(int i=0;i<tableSql.count;i++){ [tableSql objectAtIndex:i];。。
    for(id obj in tableSql)
    {
        NSLog(@"%@",obj);
        [self execSql:obj];
    }//循环的第一次，obj是结点0的地址，第二次是结点1的地址。
    
    // 建完表一定要至空数据库，否则插入会报错，相反也是一样，以后有不明的执行sql语句错误的就考虑db=nil；一下
    db=nil;
    
}


@end
