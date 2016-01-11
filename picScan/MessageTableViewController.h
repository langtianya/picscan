//
//  MessageViewController.h
//  picScan
//
//  Created by ocq on 14/9/13.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <UIKit/UIKit.h>

//等同于框架的UITableViewController

@interface MessageTableViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (retain,nonatomic)NSMutableArray *tableUsername;
@property (strong,nonatomic)NSMutableArray *tableHeadIcon;
@property (strong,nonatomic)NSMutableArray *tableUserStatus;
@property (strong,nonatomic)NSMutableArray *tableUserCreditRank;
@property (strong,nonatomic)NSMutableArray *tableMessageText;
@property (strong,nonatomic)NSMutableArray *tableMessageImage1;
@end
