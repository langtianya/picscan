//
//  RegexUtils.h
//  picScan
//
//  Created by ocq on 14/8/3.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegexUtils:NSObject

#pragma 判断字符串是否包含中文
+(BOOL) isContiansZh:(NSString *)string;

#pragma 检查邮箱是否合法
+  (BOOL) isEmailTrue:(NSString *)string;

@end