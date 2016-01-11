//
//  AppDelegate.m
//  picScan
//
//  Created by ocq on 14/8/2.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "PSCAppDelegate.h"
#import "RegLoginNavigatonController.h"
#import "LoginViewController.h"
#import "UICheckBoxButton.h"
#import "ViewControllerManager.h"
#import "ViewController.h"

@implementation PSCAppDelegate


#pragma 当应用程序加载完毕后调用
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //休眠1秒
//    [NSThread sleepForTimeInterval:1];
    

    //早期版本上面还要对window的创建
    //把window绑定到主屏幕
//    self.window=[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

 
    //设置登陆页面为程序加载的第一个界面
//   LoginViewController *loginView=[[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
//    loginView.title=@"登 陆";
//   [[loginView view] addSubview:cellButton];
    //把根控制器指定为导航控制器
//    self.window.rootViewController=[[RegLoginNavigatonController alloc] initWithRootViewController:loginView];
//    [self.window makeKeyAndVisible];
    
    self.window.backgroundColor=[UIColor whiteColor];
    
    //持久化数据有5种方式：
//  1、MXL属性列表归档(plist文件)
//   2、 NSKeyedArchiver归档
//   3、 Preference 偏好设置归档
//   4、 SQLite3存储
//   5、 Core data归档
//    
    UIViewController *welcome1=nil;
    //用户偏好设置
    //如果不是第一次登陆就不显示欢迎引导界面
    if([[NSUserDefaults standardUserDefaults]integerForKey:@"launchTime"]){
        //每次启动登陆次数加1
        NSInteger launchTime=[[NSUserDefaults standardUserDefaults]integerForKey:@"launchTime"];
        [[NSUserDefaults standardUserDefaults] setInteger:++launchTime forKey:@"launchTime"];
        
//        welcome1= [ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"1"];//如果用故事版，那么启用
//        welcome1= [ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"35"];
        
        //下面是自定义tabbar版本，上面是故事版的tabbar版本
        
        self.window.backgroundColor = [UIColor whiteColor];//设置背景颜色
        
        welcome1 = [[ViewController alloc]init];

      
    }else {//第一次登陆显示欢迎引导界面

        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"launchTime"];
        welcome1= [ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"32"];
    }
    
    
//    self.window.rootViewController=[[RegLoginNavigatonController alloc] initWithRootViewController:welcome1];
    
     self.window.rootViewController=welcome1;
       [self.window makeKeyAndVisible];

    NSLog(@"程序加载完毕");
    return YES;
}
#pragma 失去焦点的时候
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    NSLog(@"失去焦点 ");
}
#pragma  当程序进入后台运行的时候
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"程序进入后台运行");
}

#pragma  当应用程序将进入前台时调用
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"当应用程序将进入前台");
}
#pragma 当应用程序获取焦点之后 获取了才可以跟用户交互
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"应用程序获取焦点");
}
#pragma 应用程被终结的时候调用，并不是任何时候都调用
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
 NSLog(@"程序被关闭");
}

@end
