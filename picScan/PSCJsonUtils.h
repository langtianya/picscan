//
//  PSCJsonUtils.h
//  picScan
//
//  Created by ocq on 14/11/22.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PSCJsonUtils : UIViewController
@property (retain, nonatomic) IBOutlet UITextView *txtView;

- (IBAction)btnPressTouchJson:(id)sender;
- (IBAction)btnPressSBJson:(id)sender;
- (IBAction)btnPressIOS5Json:(id)sender;
- (IBAction)btnPressJsonKit:(id)sender;
@end
