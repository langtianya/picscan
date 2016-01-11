//
//  ImageManagerController.m
//  picScan
//
//  Created by ocq on 14/9/21.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "ImageManagerController.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import <AssetsLibrary/ALAssetsLibrary.h>
#import "PostViewController.h"

//@interface ImageManagerController ()
//
//@end

@implementation ImageManagerController

#pragma mark - 摄像头和相册相关的公共类

// 判断设备是否有摄像头
- (BOOL) isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

// 前面的摄像头是否可用
- (BOOL) isFrontCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

// 后面的摄像头是否可用
- (BOOL) isRearCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}


// 判断是否支持某种多媒体类型：拍照，视频
- (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    
    __block BOOL result = NO;
    
    if ([paramMediaType length] == 0){
        NSLog(@"Media type is empty.");
        return NO;
    }
    NSArray *availableMediaTypes =[UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL*stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop= YES;
        }
        
    }];
    return result;
}

// 检查摄像头是否支持录像
- (BOOL) doesCameraSupportShootingVideos{
    
       return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypeCamera];
}

// 检查摄像头是否支持拍照
- (BOOL) doesCameraSupportTakingPhotos{
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
}

#pragma mark - 相册文件选取相关
// 相册是否可用
- (BOOL) isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary];
}

// 是否可以在相册中选择视频
- (BOOL) canUserPickVideosFromPhotoLibrary{
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

// 是否可以在相册中选择视频
- (BOOL) canUserPickPhotosFromPhotoLibrary{
    return [self cameraSupportsMedia:( NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}



#pragma mark - 拍照按钮事件
- (void)ClickControlAction:(id)sender{
    // 判断有摄像头，并且支持拍照功能
    if ([self isCameraAvailable] && [self doesCameraSupportTakingPhotos]){
        // 初始化图片选择控制器
        UIImagePickerController *ipController = [[UIImagePickerController alloc] init];
        
//        NSLog(@"ImageManagerController引用计数器为：%zi",ipController.retainCount);
        [ipController setSourceType:UIImagePickerControllerSourceTypeCamera];// 设置类型
        
        
        // 设置所支持的类型，设置只能拍照，或则只能录像，或者两者都可以
        NSString *requiredMediaType = (__bridge NSString *)kUTTypeImage;
        NSString *requiredMediaType1 = (__bridge NSString *)kUTTypeMovie;
        NSArray *arrMediaTypes=[NSArray arrayWithObjects:requiredMediaType, requiredMediaType1,nil];
        [ipController setMediaTypes:arrMediaTypes];
        
        // 设置录制视频的质量
        [ipController setVideoQuality:UIImagePickerControllerQualityTypeHigh];
        //设置最长摄像时间
        [ipController setVideoMaximumDuration:10.f];
        
        
        [ipController setAllowsEditing:YES];// 设置是否可以管理已经存在的图片或者视频
        [ipController setDelegate:self];// 设置代理
//        [self.navigationController presentModalViewController:controller animated:YES];
        self.view.window.rootViewController=ipController;
//        [controller release];
    } else {
        NSLog(@"Camera is not available.");
    }
}

#pragma mark - 相册操作
//- (void)ClickShowPhotoAction:(id)sender{

-(UIViewController *)ClickShowPhotoAction{

    if ([self isPhotoLibraryAvailable]){
        
         controller = [[UIImagePickerController alloc] init];
        
        //UIImagePickerControllerSourceTypePhotoLibrary
        [controller setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];// 设置类型
        
        NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
        if ([self canUserPickPhotosFromPhotoLibrary]){
            [mediaTypes addObject:( NSString *)kUTTypeImage];
        }
//        if ([self canUserPickVideosFromPhotoLibrary]){
//            [mediaTypes addObject:(__bridge NSString *)kUTTypeMovie];
//        }
        [controller setMediaTypes:mediaTypes];
        
        //设置选择后的图片可被编辑
        controller.allowsEditing = YES;
        [controller setDelegate:self];// 设置代理
//        
//        [self presentModalViewController:controller animated:YES];
         _postViewController.view.window.rootViewController=controller;
        
//       [self.navigationController presentModalViewController:controller animated:YES];
        //        [controller release];
        //        [mediaTypes release];
        return controller;
    }
    return nil;
}

#pragma mark - 列表事件
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    
    //呼出的菜单按钮点击后的响应
    if (buttonIndex == imageActionSheet.cancelButtonIndex)
    {
        NSLog(@"取消");
    }
    
    switch (buttonIndex)
    {
        case 0:  //打开照相机拍照
            [self ClickControlAction:self];
            break;
            
        case 1:  //打开本地相册
            [self ClickShowPhotoAction];
            break;
    }
}

#pragma 弹出列表
-(void)openImageMenu:(PostViewController *)postViewController
{
    _postViewController=postViewController;
    
    //在这里呼出下方菜单按钮项
    imageActionSheet = [[UIActionSheet alloc]
                     initWithTitle:nil
                     delegate:self
                     cancelButtonTitle:@"取消"
                     destructiveButtonTitle:nil
                     otherButtonTitles: @"进入拍照", @"进入相册",nil];
    
    [imageActionSheet showInView:self.view];
//    [imageActionSheet release];
    
}

#pragma mark - UIImagePickerControllerDelegate 代理方法，已过时注释了
// 保存图片后到相册后，调用的相关方法，查看是否保存成功
- (void) imageWasSavedSuccessfully:(UIImage *)paramImage didFinishSavingWithError:(NSError *)paramError contextInfo:(void *)paramContextInfo{
    if (paramError == nil){
        NSLog(@"Image was saved successfully.");
    } else {
        NSLog(@"An error happened while saving the image.");
        NSLog(@"Error = %@", paramError);
    }
}


//代理UIImagePickerControllerDelegate的方法
// 当得到照片或者视频后，调用该方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
  
    NSLog(@"Picker returned successfully.");
    NSLog(@"%@", info);
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    // 判断获取类型：图片
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]){
        UIImage *theImage = nil;
        // 判断，图片是否允许修改
        if ([picker allowsEditing]){
            //获取用户编辑之后的图像
            theImage = [info objectForKey:UIImagePickerControllerEditedImage];
        } else {
            // 照片的元数据参数
            theImage = [info objectForKey:UIImagePickerControllerOriginalImage];
            
        }
        
//        // 保存图片到相册中
//        SEL selectorToCall = @selector(imageWasSavedSuccessfully:didFinishSavingWithError:contextInfo:);
//        UIImageWriteToSavedPhotosAlbum(theImage, self,selectorToCall, NULL);

        //转为二进制数据
            NSData *data;
            if (UIImagePNGRepresentation(theImage) == nil)//jpeg
            {
                data = UIImageJPEGRepresentation(theImage, 1.0);
            }
            else
            {
                data = UIImagePNGRepresentation(theImage);//png
            }
            
            
            //图片保存的路径
            //这里将图片放在沙盒的documents文件夹中
            NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
            
            
            //文件管理器
            NSFileManager *fileManager = [NSFileManager defaultManager];
            
            //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
            [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
        
            [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.png"] contents:data attributes:nil];
            
            //得到选择后沙盒中图片的完整路径
            filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,  @"/image.png"];
            
            //关闭相册界面
            [picker dismissModalViewControllerAnimated:YES];
        
          controller.view.window.rootViewController=_postViewController;

            //创建一个选择后图片的小图标放在下方
            //类似微薄选择图后的效果
            UIImageView *smallimage = [[UIImageView alloc] initWithFrame:
                                        CGRectMake(4, _postViewController.postArea.frame.size.height-45, 40, 40)] ;
        
            
            smallimage.image = theImage;
        [_postViewController.postArea addSubview:smallimage];
        _postViewController.smallimage=smallimage;
        _postViewController.filePath=filePath;
        _postViewController.data=data;
            //加在视图中
//          [_postViewController.view addSubview:smallimage];
        

        
    }else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie]){
        // 判断获取类型：视频
        //获取视频文件的url
        NSURL* mediaURL = [info objectForKey:UIImagePickerControllerMediaURL];
        //创建ALAssetsLibrary对象并将视频保存到媒体库
        // Assets Library 框架包是提供了在应用程序中操作图片和视频的相关功能。相当于一个桥梁，链接了应用程序和多媒体文件。
        ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
        // 将视频保存到相册中
        [assetsLibrary writeVideoAtPathToSavedPhotosAlbum:mediaURL
                                          completionBlock:^(NSURL *assetURL, NSError *error) {
                                              if (!error) {
                                                  NSLog(@"captured video saved with no error.");
                                              }else{
                                                  NSLog(@"error occured while saving the video:%@", error);
                                              }
                                          }];
//        [assetsLibrary release];
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}


//代理UIImagePickerControllerDelegate的方法
// 当用户取消时，调用该方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [picker dismissModalViewControllerAnimated:YES];
     controller.view.window.rootViewController=_postViewController;
}






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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
