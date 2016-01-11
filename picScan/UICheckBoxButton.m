//
//  CheckBox.m
//  picScan
//
//  Created by ocq on 14/8/9.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "UICheckBoxButton.h"

#define IMAGE_CHECKED @"checkin.png"

#define IMAGE_UNCHECKED @"checkout.png"

@implementation UICheckBoxButton
//geter seter方法
@synthesize label,icon,delegate;

- (id)initWithFrame:(CGRect)frame {
    if ( self = [super initWithFrame: frame])
    {
        icon =[[UIImageView alloc] initWithFrame: CGRectMake (0, 0, frame.size.height, frame.size.height)];
        [self setChecked:NO];
        [self addSubview: icon];
        label =[[UILabel alloc] initWithFrame: CGRectMake(icon.frame.size.width + 7, 0,
                                                          frame.size.width - icon.frame.size.width - 10,
                                                          frame.size.height)];
        label.backgroundColor =[UIColor clearColor];
        label.textAlignment = UITextAlignmentLeft;
        [self addSubview:label];
        [self addTarget:self action:@selector(clicked) forControlEvents: UIControlEventTouchUpInside];
    }
    return self;
}
-(BOOL)isChecked {
    
    return checked;
}

-(void)setChecked: (BOOL)flag {
    if (flag != checked)
    {
        checked = flag;
    }
    if (checked)
    {
        [icon setImage: [UIImage imageNamed:IMAGE_CHECKED]];
    }
    else
    {
        [icon setImage: [UIImage imageNamed:IMAGE_UNCHECKED]];
    }
}

-(void)clicked {
    [self setChecked: !checked];
    if (delegate != nil)
    {
        SEL sel = NSSelectorFromString (@"checkButtonClicked");
        if ([delegate respondsToSelector: sel])
        {
            [delegate performSelector: sel];
        }
    }
}

-(void)dealloc {
    
    delegate = nil;
    //    　　[label release];
    //    　　[icon release];
    //    　　[super dealloc];
}

@end