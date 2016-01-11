//
//  StringUtils.m
//  picScan
//
//  Created by ocq on 14/8/3.
//  Copyright (c) 2014年 ocq. All rights reserved.
//
#import "StringUtils.h"


@implementation StringUtils


#pragma 给定字符串必须小于给定长度时返回true
 +(BOOL)string:(NSString *) string shortThen: (int)len{
    return  string==nil||string.length<len;
    
}
#pragma 字符串为nil并且没有值
+(BOOL)isEmtpy:(NSString *) string{
    return  string==nil||string.length==0;
}
#pragma 字符串有值
+(BOOL)notEmtpy:(NSString *) string{
    return  ![self isEmtpy:string];
}



@end