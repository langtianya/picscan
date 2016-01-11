//
//  DialogUtils.m
//  picScan
//
//  Created by ocq on 14/8/5.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DialogUtils.h"

@implementation DialogUtils

#pragma 提示用户输入的错误
+  (void) showErrorMessage:(NSString *)message {
    
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"错误提示" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    //[alert release];//arc下不需要手动释放内存
    
}

+  (void) showSuccessMessage:(NSString *)message {
    
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"成功提示" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    //[alert release];//arc下不需要手动释放内存
    
}

+(void) showMessageTitle:(NSString *)title message:(NSString *)message{
    
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    //[alert release];//arc下不需要手动释放内存
    
}
#pragma mart 输入窗口
+  (void) showInputDialog {
    
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"请输入" message:nil delegate:self cancelButtonTitle:@"关闭" otherButtonTitles:@"添加", nil];
    alert.alertViewStyle=UIAlertViewStylePlainTextInput ;
    [alert show];
    //[alert release];//arc下不需要手动释放内存
}

#pragma mart 输入窗口
+  (void) showInputDialog:(id)delegate{
    
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"输入" message:delegate delegate:self cancelButtonTitle:@"关闭" otherButtonTitles:@"添加", nil];
    alert.alertViewStyle=UIAlertViewStylePlainTextInput ;
    [alert textFieldAtIndex:0].placeholder=@"请输入";
    [alert show];
    //[alert release];//arc下不需要手动释放内存
}


#pragma 当点击了弹出窗口的按钮的时候除非代理中的该方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {//添加
        NSString *text=[alertView textFieldAtIndex:0].text;
//        [[NSMutableArray alloc] insertObject:text atIndex:0];
//        UITableView *table=(UITableView *)self.view;
//        [table reloadData];
        
    }
    
}

@end

