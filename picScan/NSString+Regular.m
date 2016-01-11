//
//  StringRegular.m
//  picScan
//
//  Created by ocq on 14/8/3.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "NSString+Regular.h"

@implementation NSString(Regular)



#pragma  根据传入的正则表达式，返回所有匹配的数组
-(NSMutableArray *)getSuStringByRegular:(NSString *)regular{
    
    NSString * regex=regular;
        //NSRegularExpressionSearch正则表达式搜索
    //根据正则表达式去搜索符合正则的子字符串，如果搜索到就返回子字符串的范围
    NSRange range= [self rangeOfString:regex options:NSRegularExpressionSearch];
    
    NSMutableArray *arr=[NSMutableArray array];
    
    //如果有找到子字符串
    if (range.length != NSNotFound &&range.length != 0) {
        
//        int i=0;
        
        while (range.length != NSNotFound &&range.length != 0) {
            
//            NSLog(@"index = %i regIndex = %d loc = %d",(++i),range.length,range.location);
            //根据范围去截取字符串
            NSString* substr = [self substringWithRange:range];
            
//            NSLog(@"substr = %@",substr);
            //把每一个找到的子字符串加入可变数组
            [arr addObject:substr];
            //继续找下一个匹配的，这里从字符串中把本次找到的子字符串所占用的范围给去掉
            NSRange startr=NSMakeRange(range.location+range.length, [self length]-range.location-range.length);
            
            range=[self rangeOfString:regex options:NSRegularExpressionSearch range:startr];
        }
    }
    return arr;
}

#pragma  根据传入的正则表达式，匹配到的第一个元素
-(NSString *)getFistSuStringByRegular:(NSString *)regular{
    
    NSString * regex=regular;
    //NSRegularExpressionSearch正则表达式搜索
    //根据正则表达式去搜索符合正则的子字符串，如果搜索到就返回子字符串的范围
    NSRange range= [self rangeOfString:regex options:NSRegularExpressionSearch];
    
    //如果有找到子字符串
    if (range.length != NSNotFound &&range.length != 0) {
        
            //根据范围去截取字符串
            NSString* substr = [self substringWithRange:range];
            
            //   NSLog(@"substr = %@",substr);
            return substr;
    }
    return nil;
}
#pragma  给定正则，查看是否有匹配的，只要有一个匹配就返回true
-(BOOL)isRegexMatch:(NSString *)regular{
    
    NSString * regex=regular;
    //NSRegularExpressionSearch正则表达式搜索
    //根据正则表达式去搜索符合正则的子字符串，如果搜索到就返回子字符串的范围
    NSRange range= [self rangeOfString:regex options:NSRegularExpressionSearch];
    
    //如果有找到子字符串
    if (range.length != NSNotFound &&range.length != 0) {
        return true;
    }
    return false;
}



#pragma 字符串是否包含给定字符串
-(BOOL)contains:(NSString *) subString{
    return [subString rangeOfString:@"注册成功"].location>-1;
}

#pragma 给定字符串必须小于给定长度时返回true
-(BOOL)string:(NSString *) string shortThen: (int)len{
    return  string==nil||string.length<len;
    
}
#pragma 字符串为nil并且没有值
-(BOOL)isEmtpy:(NSString *) string{
    return  string==nil||string.length==0;
}
#pragma 字符串有值
-(BOOL)notEmtpy:(NSString *) string{
    return  ![self isEmtpy:string];
}

@end