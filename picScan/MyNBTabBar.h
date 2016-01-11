//
//  MyNBTabBar.h
//  NB2
//
//  Created by kohn on 13-11-16.
//  Copyright (c) 2013年 Kohn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyNBTabController;

#pragma 实现该代理可以进行控制器的切换
@protocol MyNBTabBarDelegate <NSObject>

- (void)switchViewController:(MyNBTabController *)viewController;
@end


@interface MyNBTabBar : UIView

@property (nonatomic,assign)id<MyNBTabBarDelegate> delegate;


- (id)initWithItems:(NSArray *)items;

#pragma 限时默认tab
- (void)showDefauls;

#pragma mark 显示指定下标的tab
- (void)showIndex:(NSInteger)index;

#pragma mark 触摸按钮向下
- (void)touchDownForButton:(UIButton *)button;

#pragma mark 触摸按钮释放
- (void)touchUpForButton:(UIButton *)button;
+(MyNBTabBar *)getInstance;
@end
