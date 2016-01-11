
//  ViewController.h
//  sqlitDemo
//
//  Created by rongfzh on 12-6-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>




@interface DB:NSObject

#pragma 数据库对象
//@property(nonatomic,assign)sqlite3 *db;

#pragma 打开数据库
+(void) openDB;
#pragma 执行给定的sql语句
+(BOOL) execSql:(NSString *)sql;
#pragma 创建数据库表
+(void) createTable;

@end
// extern int i;
sqlite3 *db;
