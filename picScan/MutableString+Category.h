//
//  NSMutableString(MyCategory).h
//  picScan
//
//  Created by ocq on 14/10/13.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableString(MyCategory)

#pragma 替换string为desString
-(void)replace:(NSString *) string with:(NSString *)desString;

#pragma 从字符串删除string
-(void)deleteString:(NSString *) string;
@end
