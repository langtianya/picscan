//
//  httpUtils.m
//  picScan
//
//  Created by ocq on 14/8/3.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "HttpUtils.h"
#import "ASIFormDataRequest.h"
#import "ASINetworkQueue.h"

@implementation HttpUtils

#pragma  http post请求
+(NSString *) doPost:(NSString *)actionUrl form:(NSDictionary *)form{
    
    //addRequestHeader: 添加头
    //setPostValue: 添加body
   
    //创建post请求对象
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:actionUrl]];
    //方法2
//    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:[NSURL URLWithString:actionUrl]];
    
    //遍历字典
    [form enumerateKeysAndObjectsWithOptions:NSEnumerationReverse usingBlock:^(id key, id obj, BOOL *stop) {
        //构造请求表单数据
        [request setPostValue:obj forKey:key];
    }];

    
//    NSArray *cacheHeaders = [NSArray arrayWithObjects:@"cache-control/no-cache",@"cache-control/no-store",@"pragma/no-cache",nil];
    
    [request setDelegate:self];//配置代理为本类
    [request setTimeOutSeconds:30]; //设置超时
//    [request setDidFailSelector:@selector(urlRequestFailed:)];//设置错误处理方法
//    [request setDidFinishSelector:@selector(urlRequestSucceeded:)];//设置成功处理方法
    
    [request startSynchronous];//同步传输 这里使用同步传输，程序会一直等待请求完成
    //[request startAsynchronous];//异步传输
    //获取返回数据
    NSData* data = [request responseData];
    
    if (data) {
        //编码从 GBK 转到 UTF-8
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        //根据字节数据和编码创建字符串
        NSString *retStr = [[NSString alloc] initWithData:data encoding:enc];
        return retStr;
    }
    
    return nil;
}

#pragma  上传文件到服务器
+(NSString *) upLoadFile:(NSString *)actionUrl form:(NSDictionary *)form data:(NSData *)ImageData{

    //创建post请求对象
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:[actionUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];

    [request setStringEncoding:NSUTF8StringEncoding];
    [request setRequestMethod:@"POST"];
    
    //遍历字典
    [form enumerateKeysAndObjectsWithOptions:NSEnumerationReverse usingBlock:^(id key, id obj, BOOL *stop) {
        //构造请求表单数据
        if([key hasPrefix:@"image"]||[key hasPrefix:@"file"]){
             [request setFile:obj forKey:key];
        }
        [request setPostValue:obj forKey:key];
    }];
//    [request setPostFormat:ASIMultipartFormDataPostFormat];
    
    /////////设置图片数据

    
    int i=0;
    NSArray *imagesArray=[NSArray arrayWithObjects:[[UIImage alloc] initWithData:ImageData], nil];
    for (UIImage *eImage in imagesArray)
    {
        i++;
//        NSData *imageData=UIImageJPEGRepresentation(eImage,100);
        NSString *photoName=[NSString stringWithFormat:@"%@.jpg",@"图片1"];

        //照片content
        [request addData:ImageData withFileName:photoName andContentType:@"image/jpeg" forKey:[NSString stringWithFormat:@"photoContent%d",i]];
    }
    
    
//   ASINetworkQueue *fileQueue = [[ASINetworkQueue alloc] init];
    
//   [ASIHTTPRequest setShouldUpdateNetworkActivityIndicator: NO];
    
    [request setDelegate:self];//配置代理为本类
    [request setTimeOutSeconds:130]; //设置超时
    //    [request setDidFailSelector:@selector(urlRequestFailed:)];//设置错误处理方法
    //    [request setDidFinishSelector:@selector(urlRequestSucceeded:)];//设置成功处理方法
    
    //添加到任务队列中执行
//    [fileQueue addOperation:request];
//    [fileQueue go];
//    
    [request startSynchronous];//同步传输 这里使用同步传输，程序会一直等待请求完成
    //[request startAsynchronous];//异步传输
    //获取返回数据
    NSData* data = [request responseData];
    
    if (data) {
        //编码从 GBK 转到 UTF-8
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        //根据字节数据和编码创建字符串
        NSString *retStr = [[NSString alloc] initWithData:data encoding:enc];
        return retStr;
    }
    
    return nil;
}



#pragma  http get请求
+(NSString *)doGet:(NSString *)requestUrl{
        //创建URL对象
        NSURL *url = [NSURL URLWithString:requestUrl];
       //链接url并返回请求数据
        NSData *data = [NSData dataWithContentsOfURL:url];
        //编码从 GBK 转到 UTF-8
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        //根据字节数据和编码创建字符串
        NSString *retStr = [[NSString alloc] initWithData:data encoding:enc];
        
        //NSLog(@" html = %@",retStr);
        
       return retStr;
}

#pragma  http get请求
+(NSString *)doGetUrl:(NSString *)requestUrl withProxy:(id)proxy{
    //创建URL对象
    NSURL *url = [NSURL URLWithString:requestUrl];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setProxyHost:@"199.200.120.140" ];
    [request setProxyPort:7808];
    
    [request startSynchronous];//简单的测试，这里使用同步传输，程序会一直等待请求完成
    NSError *error = [request error];
    if (!error)
    {
        NSString *response = [request responseString];//如果请求成功，则返回的数据会存储在response指向的内存中
        return response;
    }
    return nil;
}


//连接失败
-(void)urlRequestFailed:(ASIHTTPRequest *)request
{
    //获取错误数据
    NSError *error =[request error];
    //获取头文件
//    NSDictionary *headers = [request responseHeaders];
    NSLog(@"%@",error);
    NSLog(@"连接失败！");
    UIAlertView * alt=[[UIAlertView alloc] initWithTitle:@"提示" message:@"连接失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alt show];
    //    [alt release];
}

//请求成功
-(void)urlRequestSucceeded:(ASIHTTPRequest *)request
{
    NSData *data=[request responseData];
    NSXMLParser *parser=[[NSXMLParser alloc] initWithData:data];
    NSLog(@"data length = %d",[data length]);
    //获取http协议执行代码
    NSLog(@"Code:%d",[request responseStatusCode]);
    NSLog(@"xml data = %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    //    [parser setDelegate:self];
    [parser parse];//进入解析
}

@end