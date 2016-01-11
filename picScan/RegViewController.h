//
//  ViewController.h
//  picScan
//
//  Created by ocq on 14/8/2.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface RegViewController : UIViewController

@property(nonatomic,assign) IBOutlet UITextField *username;
@property(nonatomic,assign) IBOutlet UITextField *password;
@property(nonatomic,assign) IBOutlet UITextField *rePassword;
@property(nonatomic,assign) IBOutlet UITextField *email;

-(instancetype)init;

-(IBAction)regist;

#pragma 点击背景退出键盘
- (IBAction)clickBackgroud;


-(IBAction)textFiledDoneEditing:(id)sender;

+ (RegViewController *)getRegViewController;

@end

