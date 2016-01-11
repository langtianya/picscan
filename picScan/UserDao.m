 //
//  UserDao.m
//  picScan
//
//  Created by ocq on 14/8/15.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "UserDao.h"
#import "UserBean.h"
#import "DB.h"


@implementation UserDao

#pragma  mark保存用户信息
+(BOOL)save:(UserBean *) userbean{
    
    [DB openDB];
    NSString *sql1 =[NSString stringWithFormat:
                     @"INSERT INTO %@ (%@, %@, %@, isLogin) VALUES ('%@', '%@', %ld,%d)",
                     TABLENAME, NAME, PASSWORD, LOGIN_REMENBER, userbean.username, userbean.password, userbean.isRememberPassword,userbean.isLogin];


//   sql1 = @"INSERT INTO tuser (name, password, remenberPassWord) VALUES ('sfasdfsd', 'zxsdfsdsd', 1)";
    
    return [DB execSql:sql1];
    
//    sqlite3_close(db);
}



#pragma  mark保存用户信息 这种方式是用预处理方式
+(BOOL)saveByPrepare:(UserBean *) userbean{
    
    [DB openDB];
     sqlite3_stmt * statement;
    
    char *sql1 ="INSERT INTO tuser (name, remenberPassWord, remenberPassWord,isLogin) VALUES (?, ?, ?,?);";
    
     if (sqlite3_prepare_v2(db, sql1, -1, &statement, nil) == SQLITE_OK) {
         sqlite3_bind_text(statement,//sqlite3_stml类型
                           1,//占位符下标
                           [userbean.username UTF8String],//赋予占位符的值，也就是要插入的值
                           -1,//传递数据的长度，-1代表自动
                           nil);//可选函数回调，一般用于语句执行完后清理内存工作
         
          sqlite3_bind_text(statement, 2, [userbean.password UTF8String], -1, nil);
          sqlite3_bind_int(statement, 3,userbean.isRememberPassword);
         sqlite3_bind_int(statement, 4,userbean.isLogin);
         
         if (sqlite3_step(statement) == SQLITE_DONE) {
             //关闭数据库
             sqlite3_close(db);
             return YES;
         }
     }
    return NO;
}


#pragma mark 获取可变数组的userbean集合
+(NSMutableArray *)getUserbeanArray{
    
    [DB openDB];
    NSString *sqlQuery =[NSString stringWithFormat:@"SELECT * FROM %@",TABLENAME];
    sqlite3_stmt * statement;
    
    //从在db数据库执行sqlQuery查询语句 把结果存在statement中
    if (sqlite3_prepare_v2(db, [sqlQuery UTF8String], -1, &statement, nil) == SQLITE_OK) {
        
        NSMutableArray *mArray=[NSMutableArray arrayWithCapacity:5];
        
        //Sqlite3_step(), 在调用sqlite3_prepare后，使用这个函数在记录集中移动
        while (sqlite3_step(statement) == SQLITE_ROW) {
            //把每一个查询到的对象添加到可变数组
            [mArray addObject:[self initBeanWithStatement:statement]];
        }
        return mArray;
    }
    sqlite3_close(db);
    return nil;
}


#pragma mark根据用户id获取单个用户信息
+(UserBean *)getUserbeanById:(NSInteger *)uid{
    
    [DB openDB];
    NSString *sqlQuery =[NSString stringWithFormat:@"SELECT * FROM %@ WHERE ID=%d",TABLENAME,uid];
    sqlite3_stmt * statement;
    
    //从在db数据库执行sqlQuery查询语句 把结果存在statement中
    if (sqlite3_prepare_v2(db, [sqlQuery UTF8String], -1, &statement, nil) == SQLITE_OK) {
        
        //Sqlite3_step(), 在调用sqlite3_prepare后，使用这个函数在记录集中移动
        while (sqlite3_step(statement) == SQLITE_ROW) {
            return [self initBeanWithStatement:statement];
        }
    }
    sqlite3_close(db);
    return nil;
}


#pragma mark 根据提供的sqlite语句获取并填充userbean信息
+(UserBean *)initBeanWithStatement:(sqlite3_stmt *) statement{
    
    //从语句statement 中利用sqlite3_column_text(), 取text类型的第一个列数据
    char *usernameChar = (char*)sqlite3_column_text(statement, 1);
    NSString *usernameStr = [[NSString alloc]initWithUTF8String:usernameChar];
    
    char *passwordChar = (char*)sqlite3_column_text(statement, 2);
    NSString *passwordStr = [[NSString alloc]initWithUTF8String:passwordChar];
    
    //sqlite3_column_int(), 取int类型的数据
    int isRememberPassword = sqlite3_column_int(statement, 3);
    
    UserBean *userbean= [UserBean alloc];
    userbean.username=usernameStr;
    userbean.password=passwordStr;
    userbean.isRememberPassword=isRememberPassword;
    userbean.isLogin=sqlite3_column_int(statement, 4);
    
    return userbean;
}

#pragma 更新用户登陆状态
+(BOOL)setUser:(NSString*)username toLoginStatus:(BOOL)status{
   
    NSString *sql1 =[NSString stringWithFormat:
                     @"ALTER  TABLE %@  SET isLogin=%d  WHERE name=%@",
                     TABLENAME, status, username];
    
    return [DB execSql:sql1];
    
}

@end
