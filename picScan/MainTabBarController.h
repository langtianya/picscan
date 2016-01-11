//
//  MessageNavigationController.h
//  picScan
//
//  Created by ocq on 14/9/13.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTabBarController : UITabBarController<UITabBarDelegate>//<UITabBarControllerDelegate>
{

//在这里的都是私有的
}
//在这里的方法都是共有的-代表动态+代表静态
@property (weak, nonatomic) IBOutlet UITabBar *myTabBar;
@end
