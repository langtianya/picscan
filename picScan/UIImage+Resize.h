//
//  UIImage+Resize.h
//  picScan
//
//  Created by ocq on 14/11/13.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(Resize)
-(UIImage *)TransformtoSize:(CGSize)Newsize;
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)newsize;
@end
