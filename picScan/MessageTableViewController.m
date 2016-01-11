//
//  MessageViewController.m
//  picScan
//
//  Created by ocq on 14/9/13.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "MessageTableViewController.h"
#import "RegViewController.h"
#import "LoginViewController.h"
#import "ViewControllerManager.h"
#import "loginAnRegWelcomeViewController.h"

@interface MessageTableViewController ()

@end

@implementation MessageTableViewController


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
//    [super viewDidLoad];
//    if (![LoginViewController isLogin]) {
////        self.navigationController.navigationBar.backItem.title=@"aaa";
////        self.parentViewController.navigationController.navigationBar.backItem.title=@"aaa";
//        self.parentViewController.navigationController.navigationBar.backItem.hidesBackButton=YES;
//        
//        [loginAnRegWelcomeViewController toLoginWelcomeInterface:self.navigationController withTitle:@"消息" andImage:@"messageWelcome.jpg"];
//        return;
//        //
//        //               [self.navigationController pushViewController:[ViewControllerManager getViewControllerFromStoryboard:@"UserStoryboard" withIdentifier:@"1"] animated:YES];
//        //        //
//        ////               [self.navigationController pushViewController:[ViewControllerManager getViewControllerFromStoryboard:@"MyInfo" withIdentifier:@"1"] animated:YES];
//        
//    }
    
    UITableView *tbView=(UITableView *)self.view;
    
    
    //如果未登录，就跳转到登录页面
//    if(![LoginViewController toLoginInterface:self.navigationController]){
//        return;
//    }
    if (![LoginViewController isLogin]) {
//        [LoginViewController toLoginInterface:self.navigationController withTitle:@"消息" andImage:@"messageWelcome.jpg"];

         return;
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
         //        self.navigationController.navigationBar.backItem.title=@"aaa";
         //        self.parentViewController.navigationController.navigationBar.backItem.title=@"aaa";
         self.parentViewController.navigationController.navigationBar.backItem.hidesBackButton=YES;
//         self.navigationItem.backBarButtonItem.title=@"";
         
         [loginAnRegWelcomeViewController toLoginWelcomeInterface:self.navigationController withTitle:@"消息" andImage:@"messageWelcome.jpg"];
         return;
         //
         //               [self.navigationController pushViewController:[ViewControllerManager getViewControllerFromStoryboard:@"UserStoryboard" withIdentifier:@"1"] animated:YES];
         //        //
         ////               [self.navigationController pushViewController:[ViewControllerManager getViewControllerFromStoryboard:@"MyInfo" withIdentifier:@"1"] animated:YES];
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
    return [_tableHeadIcon count];
    
}

#pragma mark 定义单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Return the number of rows in the section.
    return 60;
}

#pragma mark逐个对单元进行初始化 初始化每一行要显示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //table cell重用 一般用类名做为标识
    static NSString *identifier=@"MessageTableViewController";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell==nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
//        UITableViewCellStyleDefault,
//        UITableViewCellStyleValue1,
////        UITableViewCellStyleValue2,
//        UITableViewCellStyleSubtitle
    }
    
    
      cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;//辅助组件 在cell最右边 类似尖括号
    //    cell.accessoryType=UITableViewCellAccessoryDetailButton;//圆按钮中有一个类似尖括号
    //    cell.accessoryType=UITableViewCellAccessoryCheckmark;//钩钩
    
    //cell的子视图contentView的3个子视图
    cell.imageView.image=[UIImage imageNamed:[_tableHeadIcon objectAtIndex:indexPath.row]];
    cell.textLabel.text=[_tableUsername objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[_tableUserStatus objectAtIndex:indexPath.row];
    
    //    //被选中时的颜色
        cell.selectionStyle=UITableViewCellSelectionStyleBlue;
    return cell;
}



#pragma mark 取消选择行之后调用,跳转到其他视图
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    //取消选中某行
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

//#pragma mark 选择行之后调用
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"执行了选择");
//    
//    UIStoryboard *sss = [UIStoryboard storyboardWithName:@"RegStoryboard"  bundle:nil];
//    RegViewController *registVC=[sss instantiateViewControllerWithIdentifier:@"222"];
//    registVC.username.text=[_tableUsername objectAtIndex:indexPath.row];
//    NSLog(@"选择了%@",registVC.username.text);
//    NSLog(@"选择了%d",indexPath.row);
//    
//    NSLog([_tableUsername objectAtIndex:indexPath.row]);
//    
//    registVC.title=@"注册";
//    self.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
//    
//    [[self navigationController]pushViewController:registVC animated:YES];
//    
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(segue.identifier);
}

// 当提交了一些编辑指令，如果实现了该方法，滑动cell的时候，右边会出现红色删除按钮
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //删除
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //删除真实数据
//        [_tableViewCells removeObjectAtIndex:indexPath.row];
        // 用户头像
        [self.tableHeadIcon removeObjectAtIndex:indexPath.row];
        //用户名
        [self.tableUsername removeObjectAtIndex:indexPath.row];
        //用户状态
        [self.tableUserStatus removeObjectAtIndex:indexPath.row];
        //用户等级
        [self.tableUserCreditRank removeObjectAtIndex:indexPath.row];
        //正文文本
        [self.tableMessageText removeObjectAtIndex:indexPath.row];
        //正文图片
        
        [self.tableMessageImage1 removeObjectAtIndex:indexPath.row];
        //刷新界面
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationTop];
        //重新向数据源请求数据，重新渲染所有的cell
//        [tableView reloadData];
        //插入
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    if (sourceIndexPath.row==destinationIndexPath.row) {
        return;
        
    }
    // 用户头像
    [self.tableHeadIcon exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
    //用户名
    [self.tableUsername exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
    //用户状态
    [self.tableUserStatus exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
    //用户等级
    [self.tableUserCreditRank exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
    //正文文本
    [self.tableMessageText exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
    //正文图片
 
    [self.tableMessageImage1 exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];

}

@end
