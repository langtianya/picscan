//
//  PSCJsonUtils.m
//  picScan
//
//  Created by ocq on 14/11/22.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "PSCJsonUtils.h"
#import "CJSONDeserializer.h"
#import "SBJson.h"
#import "JSONKit/JSONKit.h"

#define tianqiUrl @"http://www.weather.com.cn/data/cityinfo/101010100.html"

@interface PSCJsonUtils ()
@end
//
//1：iOS5应该选择系统的API进行
//
//2：不能使用系统API的应该选择JSONKit
@implementation PSCJsonUtils


//（1）使用TouchJSon解析方法：（需导入包：#import "TouchJson/JSON/CJSONDeserializer.h"）
//使用TouchJson来解析北京的天气
- (IBAction)btnPressTouchJson:(id)sender {
    //获取API接口
    NSURL *url = [NSURL URLWithString:tianqiUrl];
    //定义一个NSError对象，用于捕获错误信息
    NSError *error;
    NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    NSLog(@"jsonString--->%@",jsonString);
    //将解析得到的内容存放字典中，编码格式为UTF8，防止取值的时候发生乱码
    NSDictionary *rootDic = [[CJSONDeserializer deserializer] deserialize:[jsonString dataUsingEncoding:NSUTF8StringEncoding] error:&error];
    
    //因为返回的Json文件有两层，去第二层内容放到字典中去
    NSDictionary *weatherInfo = [rootDic objectForKey:@"weatherinfo"];
    
    NSLog(@"weatherInfo--->%@",weatherInfo);
    //取值打印
    _txtView.text = [NSString stringWithFormat:@"今天是 %@  %@  %@  的天气状况是：%@  %@ ",[weatherInfo objectForKey:@"ptime"],[weatherInfo objectForKey:@"ptime"],[weatherInfo objectForKey:@"city"], [weatherInfo objectForKey:@"weather"], [weatherInfo objectForKey:@"temp1"]];
    
}

//（2）使用SBJson解析方法：（需导入包：#import "SBJson/SBJson.h"）
//使用SBJson解析南阳的天气
- (IBAction)btnPressSBJson:(id)sender {

    NSURL *url = [NSURL URLWithString:tianqiUrl];
    NSError *error = nil;
    NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    
    NSDictionary *rootDic = [parser objectWithString:jsonString error:&error];
    NSDictionary *weatherInfo = [rootDic objectForKey:@"weatherinfo"];
    _txtView.text = [NSString stringWithFormat:@"今天是 %@  %@  %@  的天气状况是：%@  %@ ",[weatherInfo objectForKey:@"ptime"],[weatherInfo objectForKey:@"ptime"],[weatherInfo objectForKey:@"city"], [weatherInfo objectForKey:@"weather"], [weatherInfo objectForKey:@"temp1"]];
}

//3、使用IOS5自带解析类NSJSONSerialization方法解析：（无需导入包，IOS5支持，低版本IOS不支持）
- (IBAction)btnPressIOS5Json:(id)sender {
    
    NSError *error;
    //加载一个NSURL对象
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:tianqiUrl]];
    //将请求的url数据放到NSData对象中
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSLog([[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding]);
    
    //IOS5自带解析类NSJSONSerialization从response中解析出数据放到字典中
    NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
    NSDictionary *weatherInfo = [weatherDic objectForKey:@"weatherinfo"];
    
    _txtView.text = [NSString stringWithFormat:@"今天是 %@  %@  %@  的天气状况是：%@  %@ ",[weatherInfo objectForKey:@"ptime"],[weatherInfo objectForKey:@"temp2"],[weatherInfo objectForKey:@"city"], [weatherInfo objectForKey:@"weather"], [weatherInfo objectForKey:@"temp1"]];
    NSLog(@"weatherInfo字典里面的内容为--》%@", weatherDic );
}



//4）使用JSONKit的解析方法：（需导入包：#import "JSONKit/JSONKit.h"）
- (IBAction)btnPressJsonKit:(id)sender {
    
    //如果json是“单层”的，即value都是字符串、数字，可以使用objectFromJSONString
    NSString *json1 = @"{\"a\":123, \"b\":\"abc\"}";
    NSLog(@"json1:%@",json1);
    
    NSDictionary *data1 = [json1 objectFromJSONString];
    
    NSLog(@"json1.a:%@",[data1 objectForKey:@"a"]);
    NSLog(@"json1.b:%@",[data1 objectForKey:@"b"]);
//    [json1 release];
    
    //如果json有嵌套，即value里有array、object，如果再使用objectFromJSONString，程序可能会报错（测试结果表明：使用由网络或得到的php/json_encode生成的json时会报错，但使用NSString定义的json字符串时，解析成功），最好使用objectFromJSONStringWithParseOptions：
    NSString *json2 = @"{\"a\":123, \"b\":\"abc\", \"c\":[456, \"hello\"], \"d\":{\"name\":\"张三\", \"age\":\"32\"}}";
    NSLog(@"json2:%@", json2);
    NSDictionary *data2 = [json2 objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];
    NSLog(@"json2.c:%@", [data2 objectForKey:@"c"]);
    NSLog(@"json2.d:%@", [data2 objectForKey:@"d"]);
    _txtView.text =[NSString stringWithFormat:@"%@\n%@",[data2 objectForKey:@"c"],[data2 objectForKey:@"d"]];
//    [json2 release];
}
@end
