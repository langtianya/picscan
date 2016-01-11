//
//  MainTableViewController.h
//  picScan
//
//  Created by ocq on 14/8/28.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullRefreshTableViewController.h"
#import "STableViewController.h"

@interface MainTableViewController  : PullRefreshTableViewController <UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate>

@property (strong,nonatomic)NSArray *tableUsername;
@property (strong,nonatomic)NSArray *tableHeadIcon;
@property (strong,nonatomic)NSArray *tableUserStatus;
@property (strong,nonatomic)NSArray *tableUserCreditRank;
@property (strong,nonatomic)NSArray *tableMessageText;
@property (strong,nonatomic)NSArray *tableMessageImage1;

@property (weak, nonatomic) IBOutlet UIButton *loginOrPostButton;

//copy assign weak都不行
//copy报错：'NSInvalidArgumentException', reason: '+[NSArray ]: unrecognized selector sent to class 0x14efcb0'
//assign 会再本变量赋值的上一句无法向下执行
//weak能执行通过，但是本变量不会有值，为nil
//strong 和retain都正常
@property (strong,nonatomic)NSMutableArray *tableViewCells;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) IBOutlet UITableView *table;
@property (strong,nonatomic)NSMutableArray *searchResults;
@property (assign,nonatomic)NSInteger count;
//可变字典和可变数组，用于存储显示的数据，而不可变的字典用于存储从文件中读取的数据
-(void)resetSearch;
//重置搜索，即恢复到没有输入关键字的状态
-(void)handleSearchForTerm:(NSString *)searchTerm;
//处理搜索，即把不包含searchTerm的值从可变数组中删除

- (IBAction)goToLoginOrPost;

@end
