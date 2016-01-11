//
//  MyNBTabController.h
//  NB2
//
//  Created by kohn on 13-11-16.
//  Copyright (c) 2013年 Kohn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyNBTabButton;

#pragma tabbar的tab对应的视图
@interface MyNBTabController : UINavigationController
//拥有按钮属性
@property (nonatomic,strong) MyNBTabButton *tabBarButton;

@property (nonatomic,assign) NSInteger tabIndex;
@end
