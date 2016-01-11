//
//  ViewController.m
//  picScan
//
//  Created by ocq on 14/8/2.
//  Copyright (c) 2014年 ocq. All rights reserved.
//
//  [StringUtils.showErrorMessage:@"用户名必须大于3个字符"];//错误
// StringUtils.showErrorMessage:@"用户名必须大于3个字符";//错误

#import "RegViewController.h"
#import "StringUtils.h"
#import "RegexUtils.h"
#import "HttpUtils.h"
#import "DialogUtils.h"
#import "UICheckBoxButton.h"
#import "ViewControllerManager.h"
#import "Constant.h"
#import "NSString+Regular.h"


//@interface ViewController ()
//            
//
//@end

@implementation RegViewController



-(instancetype)init{
    self=[super init];
    
    //根据大小和位置初始化
    UICheckBoxButton *checkBoxButton = [[ UICheckBoxButton alloc] initWithFrame: CGRectMake(30, 375, 200, 15)];
    
    checkBoxButton.delegate = self;
    //设置文字
    checkBoxButton.label.text = @"已阅读并同意以上协议";

    //字体颜色
    UIColor *testColor1= [UIColor colorWithRed:0.133 green:0.514 blue:0.999 alpha:1];
    checkBoxButton.label.textColor =testColor1;
    //设置字体大小
    checkBoxButton.label.font=[UIFont boldSystemFontOfSize:11];
    //把组件添加到父类
    [self.view addSubview:checkBoxButton];
    //    　　[checkBoxButton release];
    
    
    return  self;
}

- (IBAction)clickBackgroud{
    //第一种叫出键盘几种方法
    //[_password resignFirstResponder];
    //[_username resignFirstResponder];
    //第二种
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

-(IBAction)textFiledDoneEditing:(id)sender{
    [sender resignFirstResponder];
}
    
#pragma 注册，注意register不能作为方法名，否则出错
-(void)regist{
    
     NSString * usernameText=_username.text;
     NSString * passwordText=_password.text;
     NSString * rePasswordText=_rePassword.text;
     NSString * emailText=_email.text;
    
    
    if([StringUtils string:usernameText shortThen:4]){
        
    [DialogUtils showErrorMessage:@"用户名必须大于3个字符"];

   return;
        }
//    if([RegexUtils isContiansZh:usernameText]){
//        [DialogUtils showErrorMessage:@"用户名不能包含中文"];
//        return;
//    }
   
    
    if([StringUtils string:passwordText shortThen:4]){
        
        [DialogUtils showErrorMessage:@"密码必须大于3个字符"];
        return;
    }
    if([RegexUtils isContiansZh:passwordText]){
        [DialogUtils showErrorMessage:@"密码不能包含中文"];
        return;
    }
    
    if([StringUtils string:rePasswordText shortThen:1]||![passwordText isEqualToString:rePasswordText]){
        
        [DialogUtils showErrorMessage:@"两次密码不匹配"];
        return;
    }
    if([StringUtils string:emailText shortThen:4]){
        
        [DialogUtils showErrorMessage:@"邮箱必须大于3个字符"];
        return;
    }
    if(![RegexUtils isEmailTrue:emailText]){
        
        [DialogUtils showErrorMessage:@"邮箱不合法"];
        return;
    }
     NSDictionary *form = [NSDictionary dictionaryWithObjectsAndKeys:
                           usernameText,@"username",
                           passwordText,@"password",
                           emailText,@"email",
                           
                           nil];
                          
    
   NSString* responseContent=[HttpUtils doPost:[NSString stringWithFormat:@"%@reg",serverRootUrl] form:form];
//   NSString* responseContent=@"success";
    if(responseContent){
         NSLog(responseContent);
        if([responseContent contains:@"success"]){
            
//            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"RegStoryboard"  bundle:nil];
//            
//            [[self navigationController]pushViewController:[storyboard instantiateViewControllerWithIdentifier:@"444"] animated:YES];
             [DialogUtils showSuccessMessage:@"注册成功"]; 
            
            self.view.window.rootViewController=[ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"1"];
           
            return;
        }
        
    }
   
     NSLog(@"%@",usernameText);
     NSLog(@"%@",passwordText);
     NSLog(@"%@",rePasswordText);
     NSLog(@"%@",emailText);
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景图片为控制器背景
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"login_backgroup.jpeg"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (RegViewController *)getRegViewController{
    //    RegViewController *registVC=[[RegViewController alloc] init];
    //    registVC.title=@"注册账号";
    //    [[self navigationController]pushViewController:registVC animated:YES];
    //点击登陆按钮后切换到storyboard界面
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"RegStoryboard"  bundle:nil];
    
    //      self.view.window.rootViewController = [storyboard instantiateInitialViewController];
    //    [self presentModalViewController:[storyboard instantiateInitialViewController] animated:YES];
    
    RegViewController *registVC=[storyboard instantiateViewControllerWithIdentifier:@"222"];
    
    registVC.title=@"注册账号";
    //根据大小和位置初始化
    UICheckBoxButton *checkBoxButton = [[ UICheckBoxButton alloc] initWithFrame: CGRectMake(30, 400, 200, 15)];
    
    checkBoxButton.delegate = self;
    //设置文字
    checkBoxButton.label.text = @"同意以上协议";
    [checkBoxButton setChecked:YES];
    //字体颜色
    UIColor *testColor1= [UIColor colorWithRed:0.133 green:0.514 blue:0.999 alpha:1];
    checkBoxButton.label.textColor =testColor1;
    //设置字体大小
    checkBoxButton.label.font=[UIFont boldSystemFontOfSize:11];
    //把组件添加到父类
    [registVC.view addSubview:checkBoxButton];
    return registVC;
}
@end
