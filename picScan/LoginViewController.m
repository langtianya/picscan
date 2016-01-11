//
//  LoginViewController.m
//  picScan
//
//  Created by ocq on 14/8/8.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "LoginViewController.h"
#import "RegViewController.h"

#import "StringUtils.h"
#import "RegexUtils.h"
#import "HttpUtils.h"
#import "DialogUtils.h"

#import "UserDao.h"
#import "UserBean.h"
#import "DB.h"
#import "UserPlistDao.h"
#import "Constant.h"
#import "ViewControllerManager.h"
#import "loginAnRegWelcomeViewController.h"
#import "MainTableViewController.h"
#import "ViewController.h"
#import "NSString+Regular.h"

@interface LoginViewController ()

@end

//静态变量
static BOOL isLogin=NO;
static UserBean *onlineUser;

@implementation LoginViewController

+(BOOL)isLogin{
    return isLogin;
}


+(UserBean*)getOnlineUser{
    return onlineUser;
}


-(instancetype)init{
    self=[super init];
    
    //根据大小和位置初始化
    _checkBoxButton = [[ UICheckBoxButton alloc] initWithFrame: CGRectMake(30, 375, 100, 15)];
    
    _checkBoxButton.delegate = self;
    //设置文字
    _checkBoxButton.label.text = @"记住密码";
    //字体颜色
    UIColor *testColor1= [UIColor colorWithRed:0.133 green:0.514 blue:0.999 alpha:1];
    _checkBoxButton.label.textColor =testColor1;
    //设置字体大小
    _checkBoxButton.label.font=[UIFont boldSystemFontOfSize:11];
    //把组件添加到父类
    [self.view addSubview:_checkBoxButton];
    //    　　[_checkBoxButton release];
    
    //    [DB openDB];
//    UserBean * user=[UserBean alloc];
//    user.username=@"uujhdfd";
//    user.password=@"jhdfd";
//   user.isRememberPassword=1;
//    //持久化用户数据
//    [UserDao save:user];
    [DB createTable];
    
    
    
    NSNumber *one=[NSNumber numberWithInteger:1];
    
    //一定要用类名调用
    UserBean *user2=[LoginViewController getLastLoginUserFromDb];
    if(user2){
        _username.text=user2.username;
        //如果记住了密码
        if(user2.isRememberPassword==1){
            _password.text=user2.password;
            [_checkBoxButton setChecked:YES];
//            isLogin=user2.isLogin;
            
        }
        
    }

//    UserBean *user2=[UserDao getUserbeanById:[one integerValue]];
    
    //    NSLog(@"从数据库获取到用户名 %@",[user2 username]);
    
    
    return  self;
    
}

#pragma 本方法是先尝试从sqlit3中获取数据，获取不到就去plist文件获取，日后选择任意一种方式既可以
//获取得到最后登录的用户之后会保存最后这个用户的登录状态，也是在本方法设置
+(UserBean*)getLastLoginUserFromDb{
    //如果已经获取过就不再获取了
    if (onlineUser) {
        return onlineUser;
    }
    
    NSArray * users=[UserDao getUserbeanArray];
    UserBean *user2=nil;
    if(users&&users.count >0){
        user2=users.lastObject;
    }
    
    if(!user2){
        user2=[UserPlistDao getLastUserbean];
    }
    
    
    if(user2&&user2.isLogin){
        
        isLogin=user2.isLogin;
        onlineUser=user2;
        
    }
    //    UserBean *user2=[UserDao getUserbeanById:[one integerValue]];
    
    //    NSLog(@"从数据库获取到用户名 %@",[user2 username]);
    return user2;
}



#pragma 登陆
- (IBAction)login {
    
    NSString * usernameText=_username.text;
    NSString * passwordText=_password.text;
   
    
    //    NSLog(usernameText);
    //    NSLog(passwordText);
    
    if([StringUtils string:usernameText shortThen:1]){
        NSLog(@"执行到用户名");
        [DialogUtils showErrorMessage:@"请输入用户名"];
        return;
    }
    
    if([StringUtils string:passwordText shortThen:1]){
        NSLog(@"执行到密码");
        [DialogUtils showErrorMessage:@"请输入密码"];
        return;
    }
    
    NSDictionary *form = [NSDictionary dictionaryWithObjectsAndKeys:
                          usernameText,@"username",
                          passwordText,@"password",
                          
                          nil];
     
    
//    if (true) {
//       NSString * response= [HttpUtils doGetUrl:@"http://www.youtube.com/" withProxy:nil];
//        NSLog(@"返回内容是：%@",response);
//    }
//    NSString* responseContent=[HttpUtils doPost:[NSString stringWithFormat:@"%@login",serverRootUrl]form:form];
    
   NSString* responseContent=@"success";
    if(responseContent){
        if([responseContent contains:@"success"]){
             NSLog(responseContent);
            
            UserBean * user=[UserBean alloc];
            user.username=usernameText;
            user.password=passwordText;
            if([_checkBoxButton isChecked]){
                user.isRememberPassword=1;
            }
             user.isLogin=YES;
            isLogin=YES;
            
            //持久化用户数据
            if (![UserDao save:user]) {
                [UserPlistDao saveUserInfo:user];
            }
            
                       [DialogUtils showSuccessMessage:@"登陆成功"];
                          MainTableViewController *mainTable=[[MainTableViewController alloc] init];
            
            //故事版形式
//            self.view.window.rootViewController=[ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"1"] ;
            
            self.view.window.rootViewController=[[ViewController alloc]init];

//                       [[self navigationController]pushViewController:mainTable animated:YES];
            return;
        }else
            if([responseContent contains:@"usernameNotExist"]){
                
                [DialogUtils showSuccessMessage:@"用户不存在"];
                return;
            }else
                if([responseContent contains:@"passwordWrong"]){
                    
                    [DialogUtils showSuccessMessage:@"密码错误"];
                    return;
                }
        
    }
    
}

#pragma 退出登陆
+(BOOL)logout{
    //持久化用户数据
    if ([UserDao setUser:onlineUser.username toLoginStatus:NO]) {
        [LoginViewController setLoginStatus:NO];
        return YES;
    }
    if ([UserPlistDao setUser:onlineUser.username toLoginStatus:NO]) {
        [LoginViewController setLoginStatus:NO];
        return YES;
    }
    return NO;
}


- (IBAction)goToRegist {
    //    MainTableViewController *registVC=[[MainTableViewController alloc] init];
    //    registVC.title=@"注册账号";
    [[self navigationController]pushViewController:[RegViewController getRegViewController] animated:YES];
    
}


- (IBAction)clickBackgroud{
    //第一种
    //[_password resignFirstResponder];
    //[_username resignFirstResponder];
    //第二种
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}
-(IBAction)textFiledDoneEditing:(id)sender{
    [sender resignFirstResponder];
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"initWithNibName");
    }
    
    return self;
}

#pragma mark 跳转到登陆页面
+(BOOL)toLoginInterface:(UINavigationController*) navigationController
{
    //如果没有登录，那么跳转到登录页面 暂时这么做
    if (![LoginViewController isLogin]) {
        //        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard"  bundle:nil];
        //        UIViewController *loginWellcom=[storyboard instantiateViewControllerWithIdentifier:@"6"];
        loginAnRegWelcomeViewController *loginWellcom=[ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"6"];
        
        [navigationController pushViewController: loginWellcom animated:YES];
        return YES;
    }
    return NO;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //设置背景图片为控制器背景
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"login_backgroup2.jpg"]];
    
    //设置登陆按钮的状态
   [_loginButton setBackgroundImage:[[UIImage imageNamed:@"cyuan.png"] stretchableImageWithLeftCapWidth:0 topCapHeight:0] forState:UIControlStateNormal];
    
    [_loginButton setTitle:@"登录中.." forState:UIControlStateHighlighted];
      [_loginButton setBackgroundImage:[[UIImage imageNamed:@"blue.png"] stretchableImageWithLeftCapWidth:0 topCapHeight:0]forState:UIControlStateHighlighted];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 把登陆界面压入传进来的导航控制器，获取到本类的一个实例
+ (UIViewController *)getLoginViewController:(UINavigationController *) navigationController{
    
LoginViewController *loginVC=[[LoginViewController alloc] init];
//    UIButton
//    Addsuccessdel
    loginVC.title=@"登陆";
    
    //改变返回按键的文字
    // 设置返回按钮为箭头图片
//    self.navigationItem.backBarButtonItem = [UIBarButtonItem barButtonItemWithBackIcon];
    
    navigationController.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];

    [navigationController pushViewController:loginVC animated:YES];
    return loginVC;
}

#pragma mark 获取到本类的一个实例
+ (UIViewController *)getLoginViewController{
    
    LoginViewController *loginVC=[[LoginViewController alloc] init];
    
    loginVC.title=@"登陆";
    //改变返回按键的文字
    return loginVC;
}
#pragma ios6后不推荐使用
//- (void)viewDidUnLoad
//{
//   _username=nil;
//    [super viewDidUnload];
//    
//    }

+(void)setLoginStatus:(BOOL)status{
    isLogin=status;
}


@end
