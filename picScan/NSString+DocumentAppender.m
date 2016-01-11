//
//  NSString+DocumentAppender.m
//  picScan
//
//  Created by ocq on 14/11/1.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "NSString+DocumentAppender.h"

@implementation NSString(DocumentAppender)

-(NSString *)documentsAppend{
 
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:self];

}

@end
