//
//  CustomIndexTableViewCell.m
//  picScan
//
//  Created by ocq on 14/9/3.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "CustomIndexTableViewCell.h"
#import "RegViewController.h"
#import "MapViewController.h"
#import "ViewControllerManager.h"
#import "PSCClickImageView.h"
#import "MainTableViewController.h"
#import "UserInfoTableViewControler.h"

@implementation CustomIndexTableViewCell

-(instancetype)init{
//    self=[super init];
    NSArray *nib=[[NSBundle mainBundle] loadNibNamed:@"CustomIndexTableViewCell" owner:self options:nil];
    self=[nib objectAtIndex:0] ;
//    self=[[nib lastObject]init];//如果加了init就会无限死循环

    
    if (self) {

//        _headIcon=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 70)];
//        _usernameLable=[[UILabel alloc] initWithFrame:CGRectMake(60, 0, 200, 70)];
        
        //头像
//         _headIcon.frame=CGRectMake(0, 0, 60, 10);
        [self.contentView addSubview:_headIcon];
        UITapGestureRecognizer *headIconAction =[[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                       action:@selector(onClickHeadImage)];
        [_headIcon addGestureRecognizer:headIconAction];
        
        //用户名
//           _usernameLable.frame=CGRectMake(60, 0, 200, 70);
        [self.contentView addSubview:_usernameLable];
        UITapGestureRecognizer *usernameLableAction =[[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                            action:@selector(onClickUsernameLable)];
         [_usernameLable addGestureRecognizer:usernameLableAction];
        
        //用户状态
//        _userStatus.frame=CGRectMake(60, 0, 200, 70);
        [self.contentView addSubview:_userStatus];
        UITapGestureRecognizer *userStatusAction =[[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                            action:@selector(onClickUserStatus)];
        [_userStatus addGestureRecognizer:userStatusAction];

        //用户信用等级
//        _userCreditRank.frame=CGRectMake(60, 0, 200, 70);
        [self.contentView addSubview:_userCreditRank];
//        [self.contentView addSubview:_userCreditRank.superview];
        UITapGestureRecognizer *userCreditRankAction =[[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                            action:@selector(onClickUsserCreditRank)];
        [_userCreditRank addGestureRecognizer:userCreditRankAction];

        
        //信息文本
//        _messageText.frame=CGRectMake(60, 0, 200, 70);
        [self.contentView addSubview:_messageText];
//        [self.contentView addSubview:_messageText.superview];
        UITapGestureRecognizer *messageTextAction =[[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                            action:@selector(onClickMessageText)];
        [_messageText addGestureRecognizer:messageTextAction];

        //信息图片
//        _messageImage1.frame=CGRectMake(60, 0, 200, 70);
//        [self.contentView addSubview:_messageImage1.superview];
        [self.contentView addSubview:_messageImage1];
        UITapGestureRecognizer *messageImage1Action =[[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                            action:@selector(onClickMessageImage)];
        [_messageImage1 addGestureRecognizer:messageImage1Action];

        //单元格view
//        _cellView.frame=CGRectMake(60, 0, 200, 70);
        //self.contentView就是_cellView
//        [self.contentView addSubview:_cellView.superview];
//        UITapGestureRecognizer *cellViewLableAction =[[UITapGestureRecognizer alloc]initWithTarget:self
//                                                                                            action:@selector(onClickMessageText)];
//        [_cellView addGestureRecognizer:cellViewLableAction];
      [_cellView addGestureRecognizer:messageTextAction];
        
        
        
    }
    return self;
}


- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark 点击用户名后触发的方法
-(void)onClickUsernameLable{
    
    NSLog(@"点击了用户名%@",_usernameLable.text);
    [self backKeyboard];
}
#pragma mark 点击头像图片后触发的方法
-(void)onClickHeadImage{
    
    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard"  bundle:nil];
//     UITableViewController *vie=[storyboard instantiateViewControllerWithIdentifier:@"3"];
//      UIViewController *vie3=[ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"3"];
    
    
//    UIStoryboard *storyboard2 = [UIStoryboard storyboardWithName:@"UserStoryboard"  bundle:nil];
//    UIViewController *vie2=[storyboard2 instantiateViewControllerWithIdentifier:@"2"];
    
    //转到用户主页
    UserInfoTableViewControler *vie15=[ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"15"];
    vie15.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    vie15.customIndexTableViewCell=self;
    self.cellView.superview.window.rootViewController=vie15;
    
//   [[vie3 navigationController]pushViewController:vie2 animated:YES];
    
//   [self.cellView.superview.window.rootViewController.navigationController pushViewController:vie2 animated:YES];
    
//    [[ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"4"].navigationController pushViewController:vie2 animated:YES];
//   [[[self.superview.window.rootViewController]]:[storyboard instantiateViewControllerWithIdentifier:@"444"] animated:YES];
   
    
//    [self.superview addSubview:vie];
    
    NSLog(@"点击了头像，跳转到用户首页");
    [self backKeyboard];
}

#pragma mark 点击了用户状态后触发的方法
-(void)onClickUserStatus{
    NSLog(@"点击了用户状态");
    
    [self backKeyboard];
}
#pragma mark 点击了用户信用等级后触发的方法
-(void)onClickUsserCreditRank{
    NSLog(@"点击了用户信用等级");
    
    [self backKeyboard];
}
#pragma mark 点击了正文文本后触发的方法
-(void)onClickMessageText{
    NSLog(@"点击了正文文本");

[self backKeyboard];
}

#pragma mark 点击了正文图片后触发的方法
-(void)onClickMessageImage{
    NSLog(@"点击了正文图片");
    [self backKeyboard];
}
#pragma  mark 在cell的大小改变时调用
-(void)layoutSubviews{
    [super layoutSubviews];
}

/////////////下面是有输入口的按钮事件触发方法

//前往
- (IBAction)gotoThat:(id)sender {
    NSLog(@"前往事件地点");
//    [[MapViewController alloc] showMapView];
    
    //去到地图界面
    UIViewController *vie101=[ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"101"];
    
     self.cellView.superview.window.rootViewController=vie101;
//    [[self navigationController]pushViewController:ss animated:YES];
    
}

- (IBAction)comment:(id)sender {
    NSLog(@"评论");

}

- (IBAction)agree:(id)sender {
    NSLog(@"赞同这件事");

}

//#pragma mark 实现NSCopying方法 这里创建的对象不要求释放
//- (id)copyWithZone:(NSZone *)zone{
//    CustomIndexTableViewCell *copy=[[[super class] allocWithZone:zone] init];
//    copy.headIcon=self.headIcon;
//    copy.usernameLable=self.usernameLable;
//    copy.userStatus=self.userStatus;
//    copy.userCreditRank=self.userCreditRank;
//    copy.messageText=self.messageText;
//    copy.messageImage1=self.messageImage1;
//    return copy;
//}
#pragma mark 实现NSCopying方法 这里创建的对象不要求释放
//这两个方法确实可以实现copy，单不知道为何没有得到深复制
- (id)mutableCopyWithZone:(NSZone *)zone{
    CustomIndexTableViewCell *copy=[[[super class] allocWithZone:zone] init];
//    copy.headIcon=self.headIcon;
//    copy.usernameLable=self.usernameLable;
//    copy.userStatus=self.userStatus;
//    copy.userCreditRank=self.userCreditRank;
//    copy.messageText=self.messageText;
//    copy.messageImage1=self.messageImage1;
 
    return copy;
}
-(void)backKeyboard{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
//    UISearchBar *d=[UIApplication sharedApplication].keyWindow;
//   NSArray *a= d.subviews;
//    UIView *v=d.superview;
    _theUserTableController.searchBar.showsCancelButton=NO;
    
//    [MainTableViewController ];
}

@end
