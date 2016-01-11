//
//  MainScrollView.m
//  picScan
//
//  Created by ocq on 14/8/10.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "MainScrollView.h"
#import "PSCollectionView.h"



@implementation MainScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.collectionView = [[PSCollectionView alloc] initWithFrame:CGRectZero];
        self.collectionView.delegate = self; // This is for UIScrollViewDelegate
        self.collectionView.collectionViewDelegate = self;
        self.collectionView.collectionViewDataSource = self;
        self.collectionView.backgroundColor = [UIColor clearColor];
        self.collectionView.autoresizingMask = ~UIViewAutoresizingNone;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
