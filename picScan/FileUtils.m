//
//  FileUtils.m
//  picScan
//
//  Created by ocq on 14/8/20.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "FileUtils.h"

@implementation FileUtils

+(NSDictionary *)getFileDictionaryDataByFileName:(NSString *)filename{
    
    NSDictionary *tempDir=[NSDictionary dictionaryWithContentsOfFile: [FileUtils getFilePathByFileName:filename]];
    if(tempDir == nil)
    {
        [FileUtils createFile:filename];
//        tempDir=[NSDictionary dictionaryWithContentsOfFile: [FileUtils getFilePathByFileName:filename]];
    }
    
    return  tempDir;  //读取数据
}

+(NSArray *)getFileArrayDataByFileName:(NSString *)filename{
    
    return  [NSArray arrayWithContentsOfFile: [FileUtils getFilePathByFileName:filename]];  //读取数据
}

+(NSString *)getFilePathByFileName:(NSString *)filename{
    //打开沙盒目录
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //获取该目录下的第一个文件目录
    NSString *documents = [paths objectAtIndex:0];
    //获取数据库路径
//    NSString *database_path = [documents stringByAppendingPathComponent:filename];
    return [documents stringByAppendingPathComponent:filename];
}


#pragma 保持信息到文件
+(BOOL)saveDictionary:(NSDictionary *)dic ToFile:(NSString *)filename{
    //如果不存在就创建
    [FileUtils createFile:filename];
    return [dic  writeToFile:[FileUtils getFilePathByFileName:filename] atomically:YES];
}


+(void)createFile:(NSString *)filename{
    //1. 创建一个plist文件
    NSFileManager* fm = [NSFileManager defaultManager];
    [fm createFileAtPath:filename contents:nil attributes:nil];
}

+(void)createFile:(NSString *)filename  data:(NSData *)data{
    //1. 创建一个plist文件
    NSFileManager* fm = [NSFileManager defaultManager];
    [fm createFileAtPath:filename contents:data attributes:nil];
}



#pragma  mark 保存字符串到指定的文件，如果文件不存在自动创建
+(void)saveString:(NSString *)string toPath:(NSString *)path{
    if (string==nil||path==nil) {
        return;
    }
    NSError *error;
    
//    [string writeToFile:path atomically:YES];
    [string writeToFile:path atomically:YES encoding:(NSUTF8StringEncoding) error:&error];
    if (error) {
        NSLog(@"saveString写入失败");
    }else{
          NSLog(@"saveString写入成功");
    }
}

#pragma 从给定的文件路径或者文件内容，可以是网络文件
+(NSString *)readFileContentWithPath:(NSString *)path{
   return  [FileUtils readFileContentWithPath:path andEncoding:NSUTF8StringEncoding];
}
+(NSString *)readFileContentWithPath:(NSString *)path andEncoding:(NSStringEncoding*) encode{
   
    return [NSString stringWithContentsOfURL:[NSURL URLWithString:path] encoding:encode error:nil];
}


@end
