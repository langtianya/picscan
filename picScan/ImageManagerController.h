//
//  ImageManagerController.h
//  picScan
//
//  Created by ocq on 14/9/21.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PostViewController;

@interface ImageManagerController : UIViewController<UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate>
{
    //下拉菜单
    UIActionSheet *imageActionSheet;
    //图片2进制路径
    NSString* filePath;
    UIImagePickerController *controller;
    
}
@property(strong,nonatomic)PostViewController *postViewController;


#pragma mark - 拍照按钮事件
- (void)ClickControlAction:(id)sender;
#pragma mark - 相册操作
//- (void)ClickShowPhotoAction:(id)sender;
- (UIViewController *)ClickShowPhotoAction;

#pragma 弹出列表
//-(void)openImageMenu;
-(void)openImageMenu:(PostViewController *)postViewController;
@end
