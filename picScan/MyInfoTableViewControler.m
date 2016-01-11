//
//  MyInfoTableViewControler.m
//  picScan
//
//  Created by ocq on 14/9/13.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "MyInfoTableViewControler.h"
#import "RegViewController.h"
#import "LoginViewController.h"
#import "ViewControllerManager.h"
#import "DialogUtils.h"
#import "loginAnRegWelcomeViewController.h"
#import "MyNBTabBar.h"
#import "ViewController.h"


@interface MyInfoTableViewControler ()

@end

@implementation MyInfoTableViewControler

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (![LoginViewController isLogin]) {
        [loginAnRegWelcomeViewController toLoginWelcomeInterface:self.navigationController withTitle:@"我的主页" andImage:@"userHomeWelcome.jpg"];
         return;
//        
//               [self.navigationController pushViewController:[ViewControllerManager getViewControllerFromStoryboard:@"UserStoryboard" withIdentifier:@"1"] animated:YES];
//        //
////               [self.navigationController pushViewController:[ViewControllerManager getViewControllerFromStoryboard:@"MyInfo" withIdentifier:@"1"] animated:YES];
      
    }
    
   
   
     // 用户头像
     self.tableHeadIcon=[NSArray arrayWithObjects:@"wfsIcon.png",@"Default.png",@"home-icon-set.png",@"back-button-hover.png",nil];
     //用户名
     self.tableUsername=[NSArray arrayWithObjects:@"维富帅",@"喜富帅",@"权屌丝",@"xxx",nil];
     //用户状态
     self.tableUserStatus=[NSArray arrayWithObjects:@"我很有钱",@"我也很有钱",@"我是乞丐",@"xxx",nil];
     //用户等级
     self.tableUserCreditRank=[NSArray arrayWithObjects:@"5",@"4",@"3",@"2",nil];
     //正文文本
     self.tableMessageText=[NSArray arrayWithObjects:@"我真他妈的有钱，权屌丝赶紧过来，给你一万别烦我了",@"我也真他妈的有钱，权屌丝赶紧过来，给你一万别烦我了",@"谢谢两位富帅给我施舍点钱，非常感谢。另外今天捡到挺多垃圾瓶的",@"xxx",nil];
     //正文图片
     self.tableMessageImage1=[NSArray arrayWithObjects:@"login_backgroup2.jpg",@"login_backgroup2.jpg",@"laji.png",@"login_backgroup.jpeg",nil];
     
    
    
}
- (void)viewDidAppear:(BOOL)animated{
   
        if (![LoginViewController isLogin]) {
            [loginAnRegWelcomeViewController toLoginWelcomeInterface:self.navigationController withTitle:@"我的主页" andImage:@"userHomeWelcome.jpg"];
            return;

    }
    NSLog(@"");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 定义一个table中有多少个分区 数据源的方法，两个必须实现的方法之一
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

#pragma mark 定义有多少个单元格  数据源的方法，两个必须实现的方法之一
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//      return [_tableHeadIcon count];
    return 5;
    
}

#pragma mark 定义单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Return the number of rows in the section.
    switch (indexPath.row) {
        case 0:
            return  80;
        default:
            break;
    }
    return 40;
}

#pragma mark逐个对单元进行初始化 初始化每一行要显示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCellStyleDefault,	// Simple cell with text label and optional image view (behavior of UITableViewCell in iPhoneOS 2.x)
//    UITableViewCellStyleValue1,		// Left aligned label on left and right aligned label on right with blue text (Used in Settings)
//    UITableViewCellStyleValue2,		// Right aligned label on left with blue text and left aligned label on right (Used in Phone/Contacts)
//    UITableViewCellStyleSubtitle	// Left aligned label on top and left aligned label on bottom with gray text (Used in iPod).
//    
    
    //table cell重用 一般用类名做为标识
    static NSString *identifier=@"MyInfoTableViewControler";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell==nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }//UITableViewStylePlain
    
    
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;//辅助组件 在cell最右边 类似尖括号
    //    cell.accessoryType=UITableViewCellAccessoryDetailButton;//圆按钮中有一个类似尖括号
    //    cell.accessoryType=UITableViewCellAccessoryCheckmark;//钩钩
    
    switch (indexPath.row) {
        case 0:
            //cell的子视图contentView的3个子视图
           cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
            cell.imageView.image=[UIImage imageNamed:[_tableHeadIcon objectAtIndex:indexPath.row]];
            cell.textLabel.text=[_tableUsername objectAtIndex:indexPath.row];
            cell.detailTextLabel.text=@"你好xxx";
//            cell.detailTextLabel.textAlignment=NSTextAlignmentLeft;
            break;
        case 1:
            cell.imageView.image=[UIImage imageNamed:@"friends.png"];
            cell.textLabel.text=@"我的好友";
            break;
        case 2:
            cell.imageView.image=[UIImage imageNamed:@"userHomeWelcome.jpg"];
            cell.textLabel.text=@"我的需求";
            break;
        case 3:
            cell.imageView.image=[UIImage imageNamed:@"album.png"];
            cell.textLabel.text=@"我的相册";
            break;
        case 4:
//             cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:identifier];
             cell.imageView.image=[UIImage imageNamed:@"exit.png"];
              cell.textLabel.text=@"退出";
            break;
        default:
            break;
    }
    
    
    //    //被选中时的颜色
    cell.selectionStyle=UITableViewCellSelectionStyleBlue;
    return cell;

}



#pragma mark 选择了行之后调用
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"执行了选择");
    
    
}

//#pragma mark 选择行之后调用
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"执行了选择");
    switch (indexPath.row) {
        case 0:
            
            break;
        case 1:
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            if ([LoginViewController logout]) {
//                [DialogUtils showSuccessMessage:@"退出成功"];
//                [[MyNBTabBar getInstance] showDefauls];
            }
//            [self refreshControl];
            [UIApplication sharedApplication].keyWindow.rootViewController=[ViewController getInstance];//[ViewController alloc];//[MyNBTabBar getInstance];//[LoginViewController getLoginViewController];
//           [LoginViewController toLoginInterface:self.navigationController withTitle:@"" andImage:@"messageWelcome.jpg"];
            break;
        default:
            break;
    }
    
    
}

- (IBAction)gotoSetting:(id)sender {
//    self.navigationController.title=@"设置";
    [self.navigationController pushViewController:[ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"44"] animated:YES];
}
@end
