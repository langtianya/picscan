//
//  StringUtils.h
//  picScan
//
//  Created by ocq on 14/8/3.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma 此类可以淘汰了，用分类代替
@interface StringUtils:NSObject


#pragma 给定字符串必须小于给定长度时返回true
 +(BOOL)string:(NSString *) string shortThen: (int)len;

#pragma 字符串为nil并且没有值
+(BOOL)isEmtpy:(NSString *) string;

#pragma 字符串有值
+(BOOL)notEmtpy:(NSString *) string;



@end