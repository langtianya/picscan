//
//  DialogUtils.h
//  picScan
//
//  Created by ocq on 14/8/5.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DialogUtils:NSObject<UIAlertViewDelegate>

#pragma 提示用户输入的错误 +号的是静态方法 而-号的是实例方法
+(void) showErrorMessage:(NSString *)message;

#pragma 提示成功操作
+(void) showSuccessMessage:(NSString *)message;

#pragma 自定义窗口
+(void) showMessageTitle:(NSString *)title message:(NSString *)message;


@end