//
//  NSString+Regular.h
//  picScan
//
//  Created by ocq on 14/8/3.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(Regular)



#pragma  根据传入的正则表达式，返回所有匹配的数组
-(NSMutableArray *)getSuStringByRegular:(NSString *)regular;

#pragma  根据传入的正则表达式，匹配到的第一个元素
-(NSString *)getFistSuStringByRegular:(NSString *)regular;

#pragma  给定正则，查看是否有匹配的，只要有一个匹配就返回true
-(BOOL)isRegexMatch:(NSString *)regular;

#pragma 字符串是否包含给定字符串sdk已经有contains方法
-(BOOL)contains:(NSString *) subString;


#pragma 给定字符串必须小于给定长度时返回true
-(BOOL)string:(NSString *) string shortThen: (int)len;

#pragma 字符串为nil并且没有值
-(BOOL)isEmtpy:(NSString *) string;

#pragma 字符串有值
-(BOOL)notEmtpy:(NSString *) string;


@end
