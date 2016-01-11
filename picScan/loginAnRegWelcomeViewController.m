//
//  loginAnRegWelcomeViewController.m
//  picScan
//
//  Created by ocq on 14/9/21.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "loginAnRegWelcomeViewController.h"
#import "RegViewController.h"
#import "LoginViewController.h"
#import "ViewControllerManager.h"
#import "MyNBTabController.h"

@interface loginAnRegWelcomeViewController ()

@end

@implementation loginAnRegWelcomeViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//-(void)viewDidAppear:(BOOL)animated{
//    _IntroductionText.text=@"www";
//}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title=_data[0];
    _imageView.image=[UIImage imageNamed:_data[1]];

    _IntroductionText.text=_data[2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)goToLogin:(id)sender {
    
    UIViewController *loginVC=[LoginViewController getLoginViewController:self.navigationController];
    //    [[self navigationController] set];
    //拿到当前的导航控制器
//    [[self navigationController]pushViewController:loginVC animated:YES];
}

- (IBAction)goToReg:(id)sender {
    [self.navigationController pushViewController:[RegViewController getRegViewController] animated:YES];
}


#pragma mark 跳转到登陆页面
+(BOOL)toLoginWelcomeInterface:(UINavigationController*) navigationController withTitle:(NSString*)title andImage:(NSString*)imageName
{
    [navigationController.tabBarController.selectedViewController.navigationController popToRootViewControllerAnimated:NO];
    navigationController.navigationBar.backItem.hidesBackButton=YES;
    
    //    navigationController.navigationBarHidden=YES;
    //    navigationController.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:nil style:nil target:nil action:nil];
    //    navigationController.navigationItem.backBarButtonItem.title=@"";
    
    
    //如果没有登录，那么跳转到登录页面 暂时这么做
    
    //        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard"  bundle:nil];
    //        UIViewController *loginWellcom=[storyboard instantiateViewControllerWithIdentifier:@"6"];
    
    loginAnRegWelcomeViewController *loginWellcom=[ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"6"];
    
    loginWellcom.navigationItem.title=title;
    loginWellcom.imageView.image=[UIImage imageNamed:imageName];
    loginWellcom.IntroductionText=[[UITextView alloc] init];
    loginWellcom.IntroductionText=@"xxx";
    
    //    loginWellcom.imageView.image=[UIImage imageNamed:imageName];
    //loginWellcom.navigationItem.backBarButtonItem.title=@"";
    
    
    [navigationController initWithRootViewController: loginWellcom];
    //    [navigationController initWithRootViewController:loginWellcom];
    //    navigationController.navigationItem.backBarButtonItem.title=@"";
    return YES;
    
    //    return NO;
}
#pragma mark 跳转到登陆页面
+(MyNBTabController *)toLoginWelcomeViewWithData:(NSArray *)data
{
   
    
    MyNBTabController *loginWellcom=[ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"6"];
    

    loginAnRegWelcomeViewController *loginView=loginWellcom.topViewController;
    loginView.data=data;
    
//    loginView.title=title;
//    loginView.imageView.image=[UIImage imageNamed:imageName];
//    loginView.IntroductionText.text=@"www";

    return loginWellcom;
}
@end
