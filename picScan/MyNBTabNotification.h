//
//  MyNBTabNotification.h
//  NB2
//
//  Created by kohn on 13-11-16.
//  Copyright (c) 2013年 Kohn. All rights reserved.
//

#import <UIKit/UIKit.h>

//代表一个通知 红色颜色背景+数字显示
@interface MyNBTabNotification : UIView{
    UIImageView *imageView;//背景
    UILabel *countLabel;//显示数字载体
    NSInteger notificationCount; //通知数量
}

-(NSInteger)notificationCount;
-(void)addNotifications:(NSInteger)n;
-(void)removeNotifications:(NSInteger)n;

-(void)setAllFrames:(CGRect)frame;
-(void)updateImageView;
@end
