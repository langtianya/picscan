//
//  main.m
//  picScan
//
//  Created by ocq on 14/8/2.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSCAppDelegate.h"

//定义别名
typedef int Integer;
typedef unsigned int UInteger;
typedef float Float;


//检测某类是否实现了某方法

int main(int argc, char * argv[]) {
    
//    @try{
    
    @autoreleasepool {
        
//        %@ Object
//        %d, %i signed int
//        %u unsigned int
//        %f float/double
//        %x, %X hexadecimal int
//        %o octal int
//        %zu size_t
//        %p pointer
//        %e float/double (in scientific notation)
//        %g float/double (as %f or %e, depending on value)
//        %s C string (bytes)
//        %S C string (unichar)
//        %.*s Pascal string (requires two arguments, pass pstr[0] as the first, pstr+1 as the second)
//        %c character
//        %C unichar
//        
//        %lld long long
//        %llu unsigned long long
//        %Lf long double
        
//        Integer int1=-1;
//        UInteger uint=-1;
//        Float fload1=-1.0f;//如果要f就必须带小时点否则报错
//        double double1=-1.0;
//        //不能放汉字，只能放一个字符长度
////        signed char取值范围是 -128 到 127
////        unsigned char 取值范围是 0 到 255
//        char char1=43;//'a';
//        unsigned char uchar=-18;
//        
//        NSLog(@"\n自定义别名：%d %d %.1f,%.1f",int1,uint,fload1);
//        printf("自定义别名：%i %u %.2f,%.3f\n",int1,uint,fload1);
//        
//        printf("%s %c ,%C \n","字符串",char1,uchar);
//        
//        char a="我们的爱";
//        char *a1="我们的爱";
//        
//        //不能用%s和%C输出char（可能编译器不同而不同）
//         printf("%s  %c  %c\n","字符测试：",a,a1);
//        
//         struct myPoint{
//             Float x;
//             Float y;
//        
//         };
//        typedef struct deMyPoint{
//            Float x;
//            Float y;
//            
//        } PPoint;
//        
////        myPoint mp={10,10};
//        
//          PPoint p1={10,10};
//        typedef PPoint pp;
//        
//        pp *p2=&p1;
//        PPoint *p3=&p1;//PPoint p3=&p1;会报错
//        
//        NSLog(@"1x=%f,y=%f\n",p2->x,p3->y);
//        
//        pp p22={20,20};
//     
//        
//       p2=&p22;//*p2=&p22;会报错
//        *p3=p22;
//        
//        NSLog(@"2x=%f,y=%f\n",p2->x,p3->y);
//        
//        p2=&p22;//，p2=p22;会报错
//         *p3=p22;
//        NSLog(@"3x=%f,y=%f\n",p2->x,p3->y);
//        
//        
//        //NSArray和NSMutableArray学习
////        //利用block进行排序
////        NSArray *arr=[NSMutableArray arrayWithObjects:@"", nil];
////        [arr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
////            if(obj1.xx1 campare obj2.xx1==NSOrderedSame){
////                return [obj1.xx2 campare obj2.xx2 ];
////            }
////        }];
//        
//        //NSDictionary学习
////        NSDictionary
//        
//        //NSNumber学习
////        NSNumber
////       CGPoint point={1,1};
////        [NSNull null];
////        NSDate
////        NSLocale
////        NSObject
////        UIWindow
////        NSBundle
//        NSLog(@"%.2f",UIWindowLevelAlert);
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([PSCAppDelegate class]));
    }
//    } @catch (NSException *exception) {
//    NSLog(@"发生异常 %@: ", exception);
//   }
    
    
   
}
