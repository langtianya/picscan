//
//  UIImage+Resize.m
//  picScan
//
//  Created by ocq on 14/11/13.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "UIImage+Resize.h"

@interface UIImage(Resize)

@end

//这个分类暂时没用上
@implementation UIImage(Resize)

- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)newsize{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(newsize);
    // 绘制改变大小的图片
    [[UIImage alloc] drawInRect:CGRectMake(0, 0, newsize.width, newsize.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

@end
