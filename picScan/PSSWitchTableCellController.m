//
//  PSSWitchTableCellController.m
//  picScan
//
//  Created by ocq on 15/1/12.
//  Copyright (c) 2015年 ocq. All rights reserved.
//

#import "PSSWitchTableCellController.h"

@implementation PSSWitchTableCellController

-(instancetype)init{
 
    NSArray *nib=[[NSBundle mainBundle] loadNibNamed:@"PSSWitchTableCellView" owner:self options:nil];
    self=[nib objectAtIndex:0] ;
    
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
