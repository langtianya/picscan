//
//  UserInfoTableViewControlerTableViewController.h
//  picScan
//
//  Created by ocq on 14/11/9.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomIndexTableViewCell;
//segmented

@interface UserInfoTableViewControler : UIViewController<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIImageView *userHeaderIcon;
@property (weak, nonatomic) IBOutlet UILabel *userName;


@property (weak, nonatomic) IBOutlet UISegmentedControl *infoSwitch;
@property (weak, nonatomic) IBOutlet UITableView *myHomeTable;

@property (weak, nonatomic) IBOutlet UITableView *myNeedMessageTable;

@property (weak, nonatomic) IBOutlet UICollectionView *albumCollectionView;
@property (weak, nonatomic)  CustomIndexTableViewCell *customIndexTableViewCell;

- (IBAction)backTo:(id)sender;

@end
