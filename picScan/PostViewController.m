//
//  PostViewController.m
//  picScan
//
//  Created by ocq on 14/9/21.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "PostViewController.h"
#import "ViewControllerManager.h"
#import "ImageManagerController.h"
#import "HttpUtils.h"
#import "Constant.h"
#import "ViewController.h"

@interface PostViewController ()

@end

@implementation PostViewController

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
    [super viewDidLoad];
    //设置边框大小
    _postArea.layer.borderColor = UIColor.grayColor.CGColor;
    _postArea.layer.borderWidth = 0.5;
    
    //设置圆角
//    _postArea.layer.cornerRadius = 6;
//    _postArea.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)textViewDidBeginEditing:(UITextView *)textView

{
    
//    [self animateTextField: _postArea up: YES];
     [self animateTextField: _operateBar up: YES];
    
}

- (void)textViewDidEndEditing:(UITextView *)textView

{
    
//    [self animateTextField: _postArea up: NO];
    [self animateTextField: _operateBar up: NO];
   
}

//- (void) animateTextField: (UITextView*) textView up: (BOOL) up
- (void) animateTextField: (UINavigationBar*) textView up: (BOOL) up
{
    //计算移动长度
    const int movementDistance = 255; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    int movement = (up ? -movementDistance : movementDistance);
  
    
    
   //滑动的动画效果
    [UIView beginAnimations: @"anim" context: nil];
   [UIView setAnimationBeginsFromCurrentState: YES];
   [UIView setAnimationDuration: movementDuration];
    
    //重设frame
////    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
//    CGRect viewframe=self.view.frame;
//    viewframe.size.height=viewframe.size.height-movement;
//    self.view.frame = viewframe;

    
    //设置_operateBar的frame
    _operateBar.frame=CGRectOffset(_operateBar.frame, 0, movement);
//   CGRect frame=_operateBar.frame;
//    frame.size.height=frame.size.height+movement;
//    _operateBar.frame = frame;
    
    //设置_postArea的frame
      CGRect frame=_postArea.frame;
    frame.size.height=frame.size.height+movement;
    _postArea.frame = frame;
    
    if (_smallimage) {
       _smallimage.frame=CGRectOffset(_smallimage.frame, 0, movement);

    }
    
    //提交动画效果
    [UIView commitAnimations];

}

- (IBAction)clickBackgroud{
    //第一种
    //[_password resignFirstResponder];
    //[_username resignFirstResponder];
    //第二种
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

-(IBAction)textViewDoneEditing:(id)sender{
    [self resignFirstResponder];

}

- (IBAction)keyboardDowm:(id)sender {
    [_postArea resignFirstResponder];
}

- (IBAction)backTo:(id)sender {
//    self.view.window.rootViewController=[ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"1"];
    self.view.window.rootViewController=[ViewController getInstance];
    // 移除栈定的视图
    
//   [self.navigationController popViewControllerAnimated:YES];
// [self.navigationController removeFromParentViewController];
//   [self.view removeFromSuperview];
//   [self removeFromParentViewController];
    
//    UIBarbuttonItem *backButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:nil  action:nil];
//    
//    navigation.navigationItem.backButton = backButton;
   
}

- (IBAction)addPic:(id)sender {
//    [[ImageManagerController alloc] ClickControlAction:sender];
//   self.view.window.rootViewController=[[ImageManagerController alloc] ClickShowPhotoAction];
     _imageManagerController=[ImageManagerController alloc];
    [_imageManagerController openImageMenu:self];

    
}

- (IBAction)sendInfoToServer:(id)sender {
    NSLog(@"用户输入的文本为：%@",_postArea.text);
     NSLog(@"用户选择的图片路径为：%@",_filePath);
    
    
    NSDictionary *form = [NSDictionary dictionaryWithObjectsAndKeys:
                          _postArea.text,@"text",
                          _filePath,@"path",
                          _filePath,@"image",
                          
                          nil];
    
    
       NSString* responseContent=[HttpUtils upLoadFile:[NSString stringWithFormat:@"%@post",serverRootUrl] form:form data:_data];
    
    NSLog(responseContent);
    
}



@end
