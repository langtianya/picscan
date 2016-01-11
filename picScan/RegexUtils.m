//
//  RegexUtils.m
//  picScan
//
//  Created by ocq on 14/8/3.
//  Copyright (c) 2014年 ocq. All rights reserved.
//
//
//#import <Foundation/Foundation.h>

#import "RegexUtils.h"
#import "StringUtils.h"
#import "NSString+Regular.h"

@implementation RegexUtils


+  (BOOL) isContiansZh:(NSString *)string {
    if ([StringUtils isEmtpy:string]) {
        return false;
    }
    if ([string isRegexMatch:@"[\u4e00-\u9fa5]"]) {
        return true;
    }
   
    return false;
    
}
+  (BOOL) isEmailTrue:(NSString *)string {
    if ([StringUtils isEmtpy:string]) {
        return false;
    }
    if ([string isRegexMatch:@"^(([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+.(\\.[a-zA-Z0-9_-]+))"]) {
        return true;
    }
   
    return false;
    
}



@end