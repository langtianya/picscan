//
//  MapViewController.m
//  picScan
//
//  Created by ocq on 14/10/3.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "MapViewController.h"
#import "MyAnnotation.h"
#import "MKMapView+ZoomLevel.h"
#import "DialogUtils.h"
#import "UIImage+Resize.h"
#import "ViewControllerManager.h"
#import "ViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController



- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{

    [super viewDidLoad];
    
    //设置导航返回按钮
    [self.navigationItem.backBarButtonItem= [UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];

    // 设置根View的背景颜色
//       self.view.backgroundColor = [UIColor colorWithRed:0x33 / 255.0f green:0x66 / 255.0f blue:0x99 / 255.0f alpha:0xFF / 255.0f];
    
    
    // 初始化MapView并且设置MapView显示的边界
//      self.myMapView = [[MKMapView alloc]initWithFrame:self.view.bounds];
    //    self.myMapView = [[MKMapView alloc] init];
    
    
    //卫星地图类型
//       self.myMapView.mapType = MKMapTypeSatellite;
    //混杂类型
    //    self.myMapView.mapType = MKMapTypeHybrid;
    //标准类型(平面)
   self.myMapView.mapType = MKMapTypeStandard;
    
    
    //Flexible柔韧的宽和高
    _myMapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _myMapView.delegate = self;
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
        //当前设备的位置
    CLLocationCoordinate2D startCoor = _myMapView.userLocation.location.coordinate;
    CLLocationDegrees latitude=startCoor.latitude+0.01;
    CLLocationDegrees longitude=startCoor.longitude+0.01;
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    
    
    // ios6以下，调用google map
//    if (SYSTEM_VERSION_LESS_THAN(@"6.0")) {
//        
//        NSString *urlString = [[NSString alloc] initWithFormat:@"http://maps.google.com/maps?saddr=%f,%f&daddr=%f,%f&dirfl=d",startCoor.latitude,startCoor.longitude,endCoor.latitude,endCoor.longitude];
//        
//        //        @"http://maps.apple.com/?saddr=%f,%f&daddr=%f,%f",startCoor.latitude,startCoor.longitude,endCoor.latitude,endCoor.longitude
//        
//        urlString =  [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        NSURL *aURL = [NSURL URLWithString:urlString];
//        
//        [[UIApplication sharedApplication] openURL:aURL];
//          return;
//    }
//    else
    
//   if(startCoor.latitude==0||startCoor.longitude==0) { // 直接调用ios自己带的apple map
//        
//        NSString *toName = @"to name";
//        
//        //        NSString *urlString =nil;
//        
//        //        使用前，先判断设备上是否已安装应用
//        //        //百度
//        //        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"baidumap://map/"]]){
//        //            urlString=[NSString stringWithFormat:@"baidumap://map/direction?origin=latlng:%f,%f|name:我的位置&destination=latlng:%f,%f|name:%@&mode=transit",
//        //                                   startCoor.latitude, startCoor.longitude, endCoor.latitude, endCoor.longitude, toName];
//        //
//        //            NSDictionary *dic = @{@"name": @"百度地图",
//        //                                  @"url": urlString};
//        ////            [self.availableMaps addObject:dic];
//        //        }
//        //        //高德
//        //        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"iosamap://"]]) {
//        //             urlString = [NSString stringWithFormat:@"iosamap://navi?sourceApplication=%@&backScheme=applicationScheme&poiname=fangheng&poiid=BGVIS&lat=%f&lon=%f&dev=0&style=3",
//        //                                   @"云华时代", endCoor.latitude, endCoor.longitude];
//        //
//        //            NSDictionary *dic = @{@"name": @"高德地图",
//        //                                  @"url": urlString};
//        ////            [self.availableMaps addObject:dic];
//        //        }
//        //        //谷歌
//        //        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"comgooglemaps://"]]) {
//        //           urlString = [NSString stringWithFormat:@"comgooglemaps://?saddr=&daddr=%f,%f¢er=%f,%f&directionsmode=transit", endCoor.latitude, endCoor.longitude, startCoor.latitude, startCoor.longitude];
//        //
//        //            NSDictionary *dic = @{@"name": @"Google Maps",
//        //                                  @"url": urlString};
//        ////            [self.availableMaps addObject:dic];
//        //        }
//        //
//        //系统自带
//        //the device’s current location
////        MKMapItem *currentLocation = [MKMapItem mapItemForCurrentLocation];
////        //到达位置
////        MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:endCoor addressDictionary:nil]];
////        
////        toLocation.name = @"to name";
////        
////        [MKMapItem openMapsWithItems:@[currentLocation, toLocation]
////                       launchOptions:@{MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,MKLaunchOptionsShowsTrafficKey: [NSNumber numberWithBool:YES]}];
////       return;
//    }
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
     //设置标注属性
    MyAnnotation *annotation = [[MyAnnotation alloc]initWithCoordinate:coordinate title:@"我的位置" subTitle:@"我是维/喜富帅喔"];
    //设置标注的颜色
    annotation.pinColor = MKPinAnnotationColorPurple;
    
    //把标注添加到地图指定位置
    [_myMapView addAnnotation:annotation];
   
    //显示用户当前位置
    [_myMapView setShowsUserLocation:YES];
    
    //设置地图的中心位置为coordinate坐标，缩放度zoomLevel值越小看到范围越大
    int zoomLevel=15;
    if(startCoor.latitude==0||startCoor.longitude==0) {
        zoomLevel=5;
    }
    //设置中心位置
    [_myMapView setCenterCoordinate:coordinate zoomLevel:zoomLevel animated:YES];
    
    //在故事版已经添加了，这里就不用了
//    [self.view addSubview:_myMapView];
    
    
    if([CLLocationManager locationServicesEnabled]){
        self.myLocationManager = [[CLLocationManager alloc]init];
        self.myLocationManager.delegate = self;
        // // 提示用户是否允许当前应用使用地理位置，已过时，在Info.plist中使用NSLocationUsageDescription键值替换
        self.myLocationManager.purpose = @"是否允许使用地理位置";
        [self.myLocationManager startUpdatingLocation];
    }else{
      NSLog(@"位置服务不可用 ");
        [DialogUtils showMessageTitle:@"提示" message:@"您的位置服务当前不可用，请打开位置服务后重试"];
    }
    
    
//    CLLocation *location = [[CLLocation alloc]initWithLatitude:40.034122 longitude:116.289574];
      CLLocation *location = [[CLLocation alloc]initWithLatitude:startCoor.latitude+0.01 longitude:startCoor.longitude+0.01];
    
    self.myGeoCoder = [[CLGeocoder alloc]init];
    //获取跟地理位置有关信息
    [self.myGeoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks,NSError *error){
        if(error == nil && [placemarks count] > 0){
            CLPlacemark *pm = [placemarks objectAtIndex:0];
            NSLog(@"国家：%@" ,pm.country);
            NSLog(@"邮编：%@",pm.postalCode);
            NSLog(@"Locality:%@",pm.locality);
        }else if(error == nil && [placemarks count] == 0){
            NSLog(@"没有地址返回");
        }else if(error != nil){
            NSLog(@"出错了：%@",error);
        }
    }];
    
    
    [self.myGeoCoder geocodeAddressString:@"中国北京市海淀区花园东路10号高德大厦" completionHandler:^(NSArray *placemarks,NSError *error){
        if(nil == error && [placemarks count] > 0){
            
            NSLog(@"placemarks count:%i",[placemarks count]);
            CLPlacemark *pm = [placemarks objectAtIndex:0];
            NSLog(@"经度longitude=%f",pm.location.coordinate.longitude);
            NSLog(@"纬度latitude=%f",pm.location.coordinate.latitude);
        }else if([placemarks count] == 0 && error == nil){
            NSLog(@"找不到给定地址的经纬度");
        }else if(nil != nil){
            NSLog(@"发生了错误:%@",error);
        }
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}
/*******************************************************************************************/
/*******************************************************************************************/
/*************************** MapView的Delegate的方法，全部都是Option的 *************************/
/*******************************************************************************************/
/*******************************************************************************************/
/*******************************************************************************************/

- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated {
    NSLog(@"mapView:regionWillChangeAnimated:方法被调用");
}
// 用户的地理位置发生改变的时候调用
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    NSLog(@"mapView:regionDidChangeAnimated：方法被调用");
  
    
}
// 当地图界面将要加载的时候将会调用这个方法
- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView{
    NSLog(@"mapViewWillStartLoadingMap:方法被调用");
}
// 当地图界面加载完成的时候将要调用这个方法
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView{
    NSLog(@"mapViewDidFinishLoadingMap:方法被调用");
}
// 当地图界面加载失败的时候调用这个方法
- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error{
    NSLog(@"mapViewDidFailLoadingMap:withError:方法被调用，error is:%@" , [error description]);
}



// 添加到地图的Annotation
// mapView:viewForAnnotation: provides the view for each annotation.
// This method may be called for all or some of the added annotations.
// For MapKit provided annotations (eg. MKUserLocation) return nil to use the MapKit provided annotation view.
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKAnnotationView *view = nil;
    if([annotation isKindOfClass:[MyAnnotation class]] == NO){
        return view;
    }
    if([mapView isEqual:self.myMapView] == NO){
        return view;
    }
    
    MyAnnotation *senderAnnotation = (MyAnnotation*)annotation;
    NSString *pinReusableIdentifier = [MyAnnotation reusableIdentifierForPinColor:senderAnnotation.pinColor];
    MKPinAnnotationView *annotationView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pinReusableIdentifier];
    if(annotationView == nil){
        annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:senderAnnotation reuseIdentifier:pinReusableIdentifier];
        [annotationView setCanShowCallout:YES];
    }
    annotationView.pinColor = senderAnnotation.pinColor;
    
    
    //到沙盒中找标注的图标
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [paths objectAtIndex:0];
    
    
    NSString *cachePath = [documentPath stringByAppendingString:@"/images"];
    NSString *cacheFile = [cachePath stringByAppendingString:@"icon.image"];
    
    if([[NSFileManager defaultManager]fileExistsAtPath:cacheFile]){
        UIImage *image = [UIImage imageWithContentsOfFile:cacheFile];
        if(image != nil){
            //设置标注的图标
//            annotationView.image = image;
//         UIImage *image=  [UIImage imageNamed:@"dibiao.png"];
//            annotationView.image = image;
            NSLog(@"通过本地设置图片");
        }else{
            [self setAnnotionImageByUrl:annotationView cacheFile:cacheFile];
        }
    }else{
        [self setAnnotionImageByUrl:annotationView cacheFile:cacheFile];
    }
    view = annotationView;
    
    return view;
}

//设置标注的图片
-(void) setAnnotionImageByUrl:(MKPinAnnotationView *)annotationView cacheFile:(NSString *) cacheFile{
    
    NSLog(@"通过网络设置文件");
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSURL *url = [NSURL URLWithString:@"http://www.baidu.com/img/duanwulogo_94a0060bda0885d1c2320ca0d7d7c342.gif"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        if(data != nil){
            
            [data writeToFile:cacheFile atomically:YES];
            UIImage *image = [UIImage imageWithData:data];
            dispatch_queue_t mainQueue = dispatch_get_main_queue();
            dispatch_async(mainQueue, ^{
                if(image != nil){
                    annotationView.image = image;
                }
            });
        }
    });
    
}

/**
 
 // mapView:didAddAnnotationViews: is called after the annotation views have been added and positioned in the map.
 // The delegate can implement this method to animate the adding of the annotations views.
 // Use the current positions of the annotation views as the destinations of the animation.
 - (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views;
 
 // mapView:annotationView:calloutAccessoryControlTapped: is called when the user taps on left & right callout accessory UIControls.
 - (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control;
 
 - (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view NS_AVAILABLE(NA, 4_0);
 - (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view NS_AVAILABLE(NA, 4_0);
 
 - (void)mapViewWillStartLocatingUser:(MKMapView *)mapView NS_AVAILABLE(NA, 4_0);
 - (void)mapViewDidStopLocatingUser:(MKMapView *)mapView NS_AVAILABLE(NA, 4_0);

 - (void)mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error NS_AVAILABLE(NA, 4_0);
 
 - (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState
 fromOldState:(MKAnnotationViewDragState)oldState NS_AVAILABLE(NA, 4_0);
 
 - (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay NS_AVAILABLE(NA, 4_0);
 
 // Called after the provided overlay views have been added and positioned in the map.
 - (void)mapView:(MKMapView *)mapView didAddOverlayViews:(NSArray *)overlayViews NS_AVAILABLE(NA, 4_0);
 
 - (void)mapView:(MKMapView *)mapView didChangeUserTrackingMode:(MKUserTrackingMode)mode animated:(BOOL)animated NS_AVAILABLE(NA, 5_0);
 */


- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation NS_AVAILABLE(NA, 4_0){
    //定义分辨率
    MKCoordinateRegion region= MKCoordinateRegionMakeWithDistance(userLocation.coordinate,3000,3000);
    //设置分辨率
    [self.myMapView setRegion:[self.myMapView regionThatFits:region] animated:YES];
    //创建图钉
    MKPointAnnotation *point =[[MKPointAnnotation alloc]init];
    //设置自己的位置
    point.coordinate=userLocation.coordinate;
    //定义图钉的标题
    point.title=@"我的位置";
    point.subtitle=@"这是您当前所在位置哦";
    //地图中添加图钉
    [self.myMapView addAnnotation:point];
}


/*******************************************************************************************/
/*******************************************************************************************/
/*************************** 位置相关 *************************/
/*******************************************************************************************/
/*******************************************************************************************/
/*******************************************************************************************/

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"Latitude=%f",newLocation.coordinate.latitude);
    NSLog(@"Longitude=%f",newLocation.coordinate.longitude);
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
    NSLog(@"获得位置失败");
}

-(void)viewDidUnload{
    [super viewDidUnload];
    self.myMapView = nil;
    [self.myLocationManager stopUpdatingLocation];
    self.myLocationManager = nil;
}

- (IBAction)backTo:(id)sender {
//     self.view.window.rootViewController=[ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"1"] ;
     self.view.window.rootViewController=[ViewController getInstance];
}
@end
