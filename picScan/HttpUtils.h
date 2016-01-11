//
//  httpUtils.h
//  picScan
//
//  Created by ocq on 14/8/3.
//  Copyright (c) 2014年 ocq. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface HttpUtils:NSObject

#pragma  http post请求
+(NSString *) doPost:(NSString *)actionUrl form:(NSDictionary *)form;
#pragma  上传文件到服务器
+(NSString *) upLoadFile:(NSString *)actionUrl form:(NSDictionary *)form data:(NSData *)data;

#pragma  http get请求
+(NSString *)doGet:(NSString *)requestUrl;
+(NSString *)doGetUrl:(NSString *)requestUrl withProxy:(id)proxy;

@end
