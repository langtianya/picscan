//
//  FileUtils.h
//  picScan
//
//  Created by ocq on 14/8/20.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileUtils : NSObject
#pragma 获取指定文件的字典数据
+(NSDictionary *)getFileDictionaryDataByFileName:(NSString *)filename;

#pragma 获取指定文件的数组数据
+(NSArray *)getFileArrayDataByFileName:(NSString *)filename;

#pragma 获取文件在沙盒中的路径
+(NSString *)getFilePathByFileName:(NSString *)filename;

#pragma 保持信息到文件
+(BOOL)saveDictionary:(NSDictionary *)dic ToFile:(NSString *)filename;

#pragma 如果filename文件不存在就创建，存在就复用
+(void)createFile:(NSString *)filename;
+(void)createFile:(NSString *)filename  data:(NSData *)data;


#pragma  mark 保存字符串到指定的文件，如果文件不存在自动创建
+(void)saveString:(NSString *)string toPath:(NSString *)path;

#pragma 从给定的文件路径或者文件内容，可以是网络文件
+(NSString *)readFileContentWithPath:(NSString *)path;

@end
