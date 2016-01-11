//
//  ViewController.m
//  NB2
//
//  Created by kohn on 13-11-16.
//  Copyright (c) 2013年 Kohn. All rights reserved.
//
#define SELECTED_VIEW_CONTROLLER_TAG 98456345//代表当前被选中的视频的tab
#define NOTIFICATION_IMAGE_VIEW_TAG 98456346

#import "ViewController.h"
#import "MyNBTabController.h"
#import "MyNBTabButton.h"
#import "ViewControllerManager.h"
#import "LoginViewController.h"
#import "loginAnRegWelcomeViewController.h"
#import "UserBean.h"

@interface ViewController ()

@end

//全局的单例
static ViewController *instance;

@implementation ViewController

+(ViewController *)getInstance{
    return instance;
}

//代理类
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //
    UserBean* user=[LoginViewController getLastLoginUserFromDb];
//    if (user) {
//        [LoginViewController setOnlineUserName:user.username];
//    }
    
    //从父视图中移除tabbar
    if (tabBar) {
        [tabBar removeFromSuperview];
    }
    
   self.view.backgroundColor = [UIColor grayColor];
//    
//    MyNBTabController *vc1 = [[MyNBTabController alloc]init];
//    vc1.view.backgroundColor = [UIColor redColor];//设置颜色
//    
//    MyNBTabController *vc2 = [[MyNBTabController alloc]init];
//    vc2.view.backgroundColor = [UIColor yellowColor];
//    
//    MyNBTabController *vc3 = [[MyNBTabController alloc]init];
//    vc3.view.backgroundColor = [UIColor blueColor];
//    
//    MyNBTabController *vc4 = [[MyNBTabController alloc]init];
//    vc4.view.backgroundColor = [UIColor whiteColor];
    

    
    MyNBTabController *vc1 =[ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"3"];
    vc1.tabIndex=1;
//    
//    // Setup toolbar
//    UINavigationBar *bar = [[UINavigationBar alloc] init];
//    [bar setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
//    
//    UINavigationItem *navItem = [[UINavigationItem alloc] init];
//    bar.items = [NSArray arrayWithObject:navItem];
//    
//    [[vc1 view] addSubview:bar];
//    vc1.navigationController.navigationItem.title=@"xxx";
    
    MyNBTabController *vc2 = [ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"2"];
    vc2.tabIndex=2;
    MyNBTabController *vc3 = [ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"13"];
    vc3.tabIndex=3;
    MyNBTabController *vc4 = [ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"14"];
    vc4.tabIndex=4;
    currentVC = vc1;
    
    //把视图插入到tabbar的下面
    [self.view insertSubview:vc1.view belowSubview:tabBar];
    [self.view insertSubview:vc2.view belowSubview:tabBar];
    [self.view insertSubview:vc3.view belowSubview:tabBar];
    [self.view insertSubview:vc4.view belowSubview:tabBar];
    
    
    
    //设置tabbar的tab按钮
    MyNBTabButton *t1 = [[MyNBTabButton alloc] initWithIcon:[UIImage imageNamed:@"mentionsIcon"]];//消息按钮，第一个按钮
   
    t1.highlightedIcon = [UIImage imageNamed:@"mentionsIconHighlighted"];//选中后高亮的图片
    t1.viewController = vc1;//tabbar 对应的视图
    
    MyNBTabButton *t2 = [[MyNBTabButton alloc] initWithIcon:[UIImage imageNamed:@"timelineIcon"]];
    t2.highlightedIcon = [UIImage imageNamed:@"timelineIconHighlighted"];
    t2.viewController = vc2;
    
    MyNBTabButton *t3 = [[MyNBTabButton alloc] initWithIcon:[UIImage imageNamed:@"messagesIcon"]];
    t3.highlightedIcon = [UIImage imageNamed:@"messagesIconHighlighted"];
    t3.viewController = vc3;
    
    MyNBTabButton *t4 = [[MyNBTabButton alloc] initWithIcon:[UIImage imageNamed:@"searchIcon"]];
    t4.highlightedIcon = [UIImage imageNamed:@"searchIconHighlighted"];
    t4.viewController = vc4;

    
    NSArray *a = [NSArray arrayWithObjects:t1, t2,t3, t4, nil];
    
    tabBar = [[MyNBTabBar alloc] initWithItems:a];
    tabBar.delegate = self;
    [self.view addSubview:tabBar];
    [tabBar showIndex:0];
    
    if(instance==nil)
    instance=self;
    
}

#pragma 实现代理的，切换视图，原理:把之前的清除换上给定参数的视图
-(void)switchViewController:(MyNBTabController *)viewController {
    
    //没有登录的情况下，把视图改变为登录界面
    if (![LoginViewController isLogin]&&viewController.tabIndex!=1) {
     
        NSString *title=nil;
        NSString *imageName=nil;
         NSString *introductionText=nil;
        switch (viewController.tabIndex) {
            case 2:
                title=@"消息";
                imageName=@"messageWelcome.jpg";
                introductionText=@"这是消息喔";
                break;
            case 3:
                title=@"我的";
                imageName=@"userHomeWelcome.jpg";
                introductionText=@"这是我的地盘";
                break;
                
            default:
                title=@"更多";
                imageName=@"friends.png";
                introductionText=@"这是更多功能";
                break;
        }
//        if (viewController.tabIndex==2) {
//            
//        }else if (viewController.tabIndex==3) {
//            
//        }else if (viewController.tabIndex==4) {
//            
//        }
        
       viewController= [loginAnRegWelcomeViewController toLoginWelcomeViewWithData:[NSArray arrayWithObjects:title,imageName,introductionText, nil]];
    }else {
        
    }
    
    //获取当前的视图
    UIView *currentView = [self.view viewWithTag:SELECTED_VIEW_CONTROLLER_TAG];
    //把之前的视图从父节点移除
    [currentView removeFromSuperview];
    currentView = nil;//至空
    
    //本视图高度减去babbar的高度就是当前视图的高度
    viewController.view.frame = CGRectMake(0,0,self.view.bounds.size.width, self.view.bounds.size.height-tabBar.frame.size.height);
    viewController.view.tag = SELECTED_VIEW_CONTROLLER_TAG;
    [self.view insertSubview:viewController.view belowSubview:tabBar];
    
   
    //如果当前点击的tab还是上次点击的，那么通知数字+1
    if (currentVC == viewController) {
        [viewController.tabBarButton addNotification:[NSDictionary dictionary]];
        
        //否则清空后+1
    }else{
        
        [viewController.tabBarButton addNotification:[NSDictionary dictionary]];
        currentVC = viewController;
    }
    //点击了当前选项卡那么就清除通知，日后如果需要点击了信息再清除的话再另外做
    [currentVC.tabBarButton clearNotifications];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
