
//  CheckBox.h
//  picScan
//
//  Created by ocq on 14/8/9.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICheckBoxButton : UIControl
{
    //复选框右边显示的说明文字
    UILabel *label;
    UIImageView *icon;
    BOOL checked;
    id delegate;
    }
@property (retain, nonatomic) id delegate;
@property (retain, nonatomic) UILabel *label;
@property (retain, nonatomic) UIImageView *icon;
-(BOOL)isChecked;
-(void)setChecked: (BOOL)flag;

@end