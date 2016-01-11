//
//  ViewController.h
//  NB2
//
//  Created by kohn on 13-11-16.
//  Copyright (c) 2013年 Kohn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyNBTabBar.h"

@class MyNBTabController;

#pragma 该类是 tabbar的代理类
@interface ViewController : UIViewController<MyNBTabBarDelegate>{
    
    //把tabbar作为该view的子视图
    MyNBTabBar *tabBar;
    //代表当前选中tab的对应视图
    MyNBTabController * currentVC;
}
//@property(nonatomic,assign)ViewController *instance;

#pragma 实现代理的，切换视图，原理:把之前的清除换上给定参数的视图
-(void)switchViewController:(MyNBTabController *)viewController;

+(ViewController *)getInstance;
@end
