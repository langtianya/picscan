//
//  MyInfoTableViewControler.h
//  picScan
//
//  Created by ocq on 14/9/13.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyInfoTableViewControler : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong,nonatomic)NSArray *tableUsername;
@property (strong,nonatomic)NSArray *tableHeadIcon;
@property (strong,nonatomic)NSArray *tableUserStatus;
@property (strong,nonatomic)NSArray *tableUserCreditRank;
@property (strong,nonatomic)NSArray *tableMessageText;
@property (strong,nonatomic)NSArray *tableMessageImage1;

- (IBAction)gotoSetting:(id)sender;
@end
