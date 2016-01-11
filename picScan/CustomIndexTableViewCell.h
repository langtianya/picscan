//
//  CustomIndexTableViewCell.h
//  picScan
//
//  Created by ocq on 14/9/3.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class PSCClickImageView;//如果用这个，那么每一个使用到该CustomIndexTableViewCell类的都要#import "PSCClickImageView.h"
//否则报错，可以在这里用#import "PSCClickImageView.h"，其他用到CustomIndexTableViewCell的就不用#import "PSCClickImageView.h"
//了
#import "PSCClickImageView.h"
@class MainTableViewController;

@interface CustomIndexTableViewCell : UITableViewCell<NSMutableCopying>//<NSCopying>

@property (assign, nonatomic) IBOutlet UIImageView *headIcon;
@property (assign, nonatomic) IBOutlet UILabel *usernameLable;
@property (assign, nonatomic) IBOutlet UILabel *userStatus;
@property (assign, nonatomic) IBOutlet UIImageView *userCreditRank;
@property (assign, nonatomic) IBOutlet UITextView *messageText;
@property (assign, atomic) IBOutlet PSCClickImageView *messageImage1;
@property (assign, nonatomic) IBOutlet UIView *cellView;

#pragma 标识是那个table使用了该自定义cell
@property (assign, nonatomic) MainTableViewController *theUserTableController;

////必须是strong才能支撑copy
//@property (strong, nonatomic) IBOutlet UIImageView *headIcon;
//@property (strong, nonatomic) IBOutlet UILabel *usernameLable;
//@property (strong, nonatomic) IBOutlet UILabel *userStatus;
//@property (strong, nonatomic) IBOutlet UIImageView *userCreditRank;
//@property (strong, nonatomic) IBOutlet UITextView *messageText;
//@property (strong, atomic) IBOutlet UIImageView *messageImage1;
//@property (strong, nonatomic) IBOutlet UIView *cellView;


//如果是strong回报错，无法往下执行
//@property (weak, nonatomic) IBOutlet UIImageView *headIcon;
//@property (weak, nonatomic) IBOutlet UILabel *usernameLable;
//@property (weak, nonatomic) IBOutlet UILabel *userStatus;
//@property (weak, nonatomic) IBOutlet UIImageView *userCreditRank;
//@property (weak, nonatomic) IBOutlet UITextView *messageText;
//@property (weak, nonatomic) IBOutlet UIImageView *messageImage1;
//@property (weak, nonatomic) IBOutlet UIView *cellView;

//默认是strong
//@property (nonatomic) IBOutlet UIImageView *headIcon;
//@property (nonatomic) IBOutlet UILabel *usernameLable;
//@property (nonatomic) IBOutlet UILabel *userStatus;
//@property (nonatomic) IBOutlet UIImageView *userCreditRank;
//@property (nonatomic) IBOutlet UITextView *messageText;
//@property (nonatomic) IBOutlet UIImageView *messageImage1;
//@property (nonatomic) IBOutlet UIView *cellView;

- (IBAction)gotoThat:(id)sender;
- (IBAction)agree:(id)sender;
- (IBAction)comment:(id)sender;


@end
