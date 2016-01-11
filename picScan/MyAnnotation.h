//
//  MyAnnotation.h
//  picScan
//
//  Created by ocq on 14/10/5.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

#define REUSABLE_PIN_RED @"Red"
#define REUSABLE_PIN_GREEN @"Green"
#define REUSABLE_PIN_PURPLE @"Purple"

@interface MyAnnotation : NSObject <MKAnnotation>

@property (nonatomic,readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;

@property (nonatomic,unsafe_unretained) MKPinAnnotationColor pinColor;

-(id) initWithCoordinate:(CLLocationCoordinate2D) coordinate
                   title:(NSString*) paramTitle
                subTitle:(NSString*) paramSubTitle;
// 得到颜色
+(NSString *) reusableIdentifierForPinColor:(MKPinAnnotationColor) paramColor;

@end