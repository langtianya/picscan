//
//  LoginViewController.h
//  picScan
//
//  Created by ocq on 14/8/8.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICheckBoxButton.h"
@class UserBean;

@interface LoginViewController : UIViewController

@property (assign, nonatomic) IBOutlet UITextField *username;

@property (assign, nonatomic) IBOutlet UITextField *password;
@property (copy, nonatomic) UICheckBoxButton *checkBoxButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
//@property(nonatomic,assign)BOOL isLogin;

#pragma 登陆
- (IBAction)login;

#pragma 退出登陆
+(BOOL)logout;

- (IBAction)goToRegist;

#pragma 点击背景退出键盘
- (IBAction)clickBackgroud;

#pragma 重写父类初始化方法，加上初始化复选框功能
-(instancetype)init;
-(IBAction)textFiledDoneEditing:(id)sender;

+(BOOL)isLogin;
+(void)setLoginStatus:(BOOL)status;
+(void)setOnlineUserName:(NSString*)userName;
+(NSString*)getOnlineUserName;


+(BOOL)toLoginInterface:(UINavigationController*) navigationController;



+(UserBean*)getLastLoginUserFromDb;

#pragma mark 获取到本类的一个实例
+ (UIViewController *)getLoginViewController:(UINavigationController *) navigationController;
#pragma mark 获取到本类的一个实例
+ (UIViewController *)getLoginViewController;
@end
