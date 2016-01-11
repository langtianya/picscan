//
//  MKMapView.h
//  picScan
//
//  Created by ocq on 14/10/5.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKMapView (ZoomLevel)

- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate
                  zoomLevel:(NSUInteger)zoomLevel
                   animated:(BOOL)animated;
@end