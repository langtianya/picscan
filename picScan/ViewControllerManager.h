//
//  ViewControllerManager.h
//  picScan
//
//  Created by ocq on 14/9/21.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewControllerManager : UIViewController

+(UIViewController *)getViewControllerFromStoryboard:(NSString *)storyboard withIdentifier:(NSString *)identifier;

+(UIViewController *)getMainStoryboardViewControllerWithIdentifier:(NSString *)myIdentifier;
@end
