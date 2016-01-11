//
//  MyNBTabButton.h
//  NB2
//
//  Created by kohn on 13-11-16.
//  Copyright (c) 2013年 Kohn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyNBTabController.h"
#import "MyNBTabNotification.h"

#pragma tab的按钮
@interface MyNBTabButton : NSObject {
    
    UIImage *icon;//默认图片
    UIImage *highlightedIcon;//选中的时候高亮图片
    NSMutableArray *_notifications;// 代表通知集合，往里面添加即代表通知数量+1
    MyNBTabNotification *_notification;//泡泡数字
    
}

@property (nonatomic,strong) UIImage *icon;
@property (nonatomic,strong) UIImage *highlightedIcon;
@property (nonatomic,strong) MyNBTabController *viewController;
@property (nonatomic,strong) MyNBTabNotification *light;//高亮的通知
- (id)initWithIcon:(UIImage *)icon;
- (void)addNotification:(NSDictionary *)notification;
- (void)removeNotification:(NSUInteger)index;
- (void)clearNotifications;

- (NSInteger)notificationCount;

- (MyNBTabNotification *)notificationView;
@end
