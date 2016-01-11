//
//  loginAnRegWelcomeViewController.h
//  picScan
//
//  Created by ocq on 14/9/21.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyNBTabController;

@interface loginAnRegWelcomeViewController : UIViewController

- (IBAction)goToLogin:(id)sender;

- (IBAction)goToReg:(id)sender;

@property (nonatomic,weak) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UITextView *IntroductionText;

+(BOOL)toLoginWelcomeInterface:(UINavigationController*) navigationController withTitle:(NSString*)title andImage:(NSString*)imageName;

+(MyNBTabController *)toLoginWelcomeViewWithData:(NSArray *)data;
@property (weak,nonatomic)NSArray *data;
@end
