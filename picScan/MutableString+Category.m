//
//  NSMutableString(MyCategory).m
//  picScan
//
//  Created by ocq on 14/10/13.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "MutableString+Category.h"

@implementation NSMutableString(MyCategory)

#pragma 替换string为desString
-(void)replace:(NSString *) string with:(NSString *)desString{
    NSRange range=[self rangeOfString:string];
    [self replaceCharactersInRange:range withString:desString];
}

#pragma 从字符串删除string
-(void)deleteString:(NSString *) string{
    NSRange range=[self rangeOfString:string];
    [self deleteCharactersInRange:range];
}
@end
