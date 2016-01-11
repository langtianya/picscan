//
//  MyAnnotation.m
//  picScan
//
//  Created by ocq on 14/10/5.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

@synthesize coordinate,title,subtitle,pinColor;

-(id) initWithCoordinate
:(CLLocationCoordinate2D) paramCoordinate title:(NSString *)paramTitle subTitle:(NSString *)paramSubTitle
{
    self = [super init];
    if(self != nil){
        coordinate = paramCoordinate;
        title = paramTitle;
        subtitle = paramSubTitle;
        pinColor = MKPinAnnotationColorGreen;
    }
    
    return self;
}

+(NSString *)reusableIdentifierForPinColor:(MKPinAnnotationColor)paramColor
{
    NSString *result = nil;
    switch (paramColor) {
        case MKPinAnnotationColorRed:
            result = REUSABLE_PIN_RED;
            break;
        case MKPinAnnotationColorGreen:
            result = REUSABLE_PIN_GREEN;
            break;
        case MKPinAnnotationColorPurple:
            result = REUSABLE_PIN_PURPLE;
    }
    return result;
}

@end