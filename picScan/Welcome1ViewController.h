//
//  Welcome1ViewController.h
//  picScan
//
//  Created by ocq on 14/11/4.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Welcome1ViewController : UIViewController

@property (nonatomic, assign) NSInteger typeID;
@property (nonatomic, retain) IBOutlet UIImageView *twoView;
@property (nonatomic, retain) IBOutlet UIImageView *firstView;
@property (nonatomic, retain) IBOutlet UIView *endView;
//@property (nonatomic, assign)  BOOL *leftEnd;
//@property (nonatomic, assign)  BOOL *rightEnd;
@property (nonatomic, assign)  NSInteger viewNum;

- (IBAction)gotoMainTable:(id)sender;


@end
