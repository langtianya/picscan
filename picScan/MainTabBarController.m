//
//  MessageNavigationController.m
//  picScan
//
//  Created by ocq on 14/9/13.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "MainTabBarController.h"
#import "LoginViewController.h"
#import "RegViewController.h"
//#import "MyInfoTableViewControler.h"
#import "ViewControllerManager.h"
#import "UserBean.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    //为了实现监听用户选择哪个tab
   [_myTabBar setDelegate:self];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [_myTabBar setDelegate:self];
    
    UserBean* user=[LoginViewController getLastLoginUserFromDb];
    if (user) {
        [LoginViewController setOnlineUserName:user.username];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
     NSLog(@"aaa");
}

#pragma 监听到用户选择了哪个tabbar选项
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item;{
    
//    switch(item.tag) {
//        case 1:
//            if (![LoginViewController isLogin]) {
//                
//                NSLog(@"选择了1");
//            }
//            break;
//        case 2:
//            
//             break;
//        case 3:
//            
//            break;
//        case 4:
//            
//            break;
    
    
    if(item.tag==1){
        
        if (![LoginViewController isLogin]) {
            
            NSLog(@"选择了1");
        }
        
//        else{
//            
//        }
        
    }else if(item.tag==2){
        
//        if (![LoginViewController isLogin]) {
//            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard"  bundle:nil];
//            
//            //      self.view.window.rootViewController = [storyboard instantiateInitialViewController];
//            //    [self presentModalViewController:[storyboard instantiateInitialViewController] animated:YES];
//            
//            RegViewController *registVC=[storyboard instantiateViewControllerWithIdentifier:@"2"];
//              RegViewController *registVC2=[storyboard instantiateViewControllerWithIdentifier:@"6"];
//            
//            self.view.window.rootViewController = registVC2;
//            [[registVC navigationController] pushViewController:registVC2 animated:YES];
////            tabBar.window.rootViewController=[RegViewController getRegViewController];
////            [self addChildViewController:[RegViewController getRegViewController]];
////            [self performSegueWithIdentifier:@"1" sender:self];
////            [[self navigationController] pushViewController:[RegViewController getRegViewController] animated:YES];
//            return;
//            
//        }
        
        
//        if (![LoginViewController isLogin]) {
//            [LoginViewController toLoginInterface:self.navigationController withTitle:@"消息" andImage:@"messageWelcome.jpg"];
//            return;
//        }

//      self.selectedViewController= [LoginViewController getLoginViewController];
//        self.selectedIndex=item.tag;
//      self.viewControllers =[NSArray arrayWithObjects:self.viewControllers [0],self.viewControllers [0],self.viewControllers [0],self.viewControllers [0], nil];
//        [LoginViewController getLoginViewController];
          NSLog(@"选择了2");
    }
    else if(item.tag==3){
          NSLog(@"选择了3");
//
//       [self.navigationController pushViewController:[ViewControllerManager getViewControllerFromStoryboard:@"UserStoryboard" withIdentifier:@"1"] animated:YES];
//        
//       [self.navigationController pushViewController:[ViewControllerManager getViewControllerFromStoryboard:@"MyInfo" withIdentifier:@"1"] animated:YES];
//      UIViewController *view1=  [ViewControllerManager getViewControllerFromStoryboard:@"MyInfo" withIdentifier:@"1"];
//        view1.tabBarItem=item;
//        self.view=view1;
   
//        
    }
    else if(item.tag==4){
          NSLog(@"选择了4");
    }
}



@end
