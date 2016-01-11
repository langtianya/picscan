//
//  MapViewController.h
//  picScan
//
//  Created by ocq on 14/10/3.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

////用来获取手机的系统，判断系统是多少
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

@interface MapViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>

// MapView
@property (weak, nonatomic) IBOutlet MKMapView *myMapView;

//@property (nonatomic,strong) MKMapView *myMapView;// 地图控件
// LocationManager
@property (nonatomic,strong) CLLocationManager *myLocationManager;// 位置管理器
@property (nonatomic,strong) CLGeocoder *myGeoCoder ;// 地理位置和真实地址转换

- (IBAction)backTo:(id)sender;
-(void)showMapView;
@end
