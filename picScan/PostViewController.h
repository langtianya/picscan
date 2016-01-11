//
//  PostViewController.h
//  picScan
//
//  Created by ocq on 14/9/21.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ImageManagerController;

@interface PostViewController : UIViewController<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *postArea;


//@property (weak, nonatomic) IBOutlet UINavigationBar *operateBar;
@property (weak, nonatomic) IBOutlet UIToolbar *operateBar;
@property (strong ,nonatomic)ImageManagerController *imageManagerController;
@property (strong,nonatomic) UIImageView *smallimage;
@property (strong,nonatomic) NSString* filePath;
@property (strong,nonatomic) NSData *data;

#pragma 点击背景退出键盘
- (IBAction)clickBackgroud;
-(IBAction)textViewDoneEditing:(id)sender;
- (IBAction)keyboardDowm:(id)sender;
#pragma 回到来这里的那个界面
- (IBAction)backTo:(id)sender;

- (IBAction)addPic:(id)sender;

- (IBAction)sendInfoToServer:(id)sender;

@end
