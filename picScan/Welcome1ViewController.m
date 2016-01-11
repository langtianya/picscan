//
//  Welcome1ViewController.m
//  picScan
//
//  Created by ocq on 14/11/4.
//  Copyright (c) 2014年 ocq. All rights reserved.
//
#define kDuration 0.4

#import "Welcome1ViewController.h"
#import "ViewControllerManager.h"
#import "ViewController.h"

@interface Welcome1ViewController ()

@end

@implementation Welcome1ViewController

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
    //    Tap（点击）、Pinch（捏合）、Rotation（旋转）、Swipe（滑动，快速移动，是用于监测滑动的方向的）、Pan （拖移，慢速移动，是用于监测偏移的量的）以及 LongPress（长按）
    //    UITapGestureRecognizer
    //    UIPinchGestureRecognizer
    //    UIRotationGestureRecognizer
    //    UISwipeGestureRecognizer
    //    UIPanGestureRecognizer
    //    UILongPressGestureRecognizer
    [super viewDidLoad];
    //    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanFrom:)];
    //    [self.view addGestureRecognizer:panRecognizer];//关键语句，给self.view添加一个手势监测；
    //    panRecognizer.maximumNumberOfTouches = 1;
    //    panRecognizer.delegate = self;
    
    //x，y轴都可以拖动的panGestureRecognizer手势
    //    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]
    //                                                    initWithTarget:self
    //                                                    action:@selector(handlePan:)];
    //    [self.view  addGestureRecognizer:panGestureRecognizer];
    //    panGestureRecognizer.maximumNumberOfTouches = 1;
    //    panGestureRecognizer.delegate = self;
    //
    
    UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc]
                                                        initWithTarget:self
                                                        action:@selector(handleSwipe:)];
    [self.view  addGestureRecognizer:swipeGestureRecognizer];
    swipeGestureRecognizer.direction=UISwipeGestureRecognizerDirectionLeft;
    swipeGestureRecognizer.numberOfTouchesRequired = 1;//default is one finger
    swipeGestureRecognizer.delegate = self;
    
    
    
    UISwipeGestureRecognizer *swipeGestureRecognizerRight = [[UISwipeGestureRecognizer alloc]
                                                             initWithTarget:self
                                                             action:@selector(handleSwipe:)];
    [self.view  addGestureRecognizer:swipeGestureRecognizerRight];
    swipeGestureRecognizerRight.direction=UISwipeGestureRecognizerDirectionRight;
    swipeGestureRecognizerRight.numberOfTouchesRequired = 1;//default is one finger
    swipeGestureRecognizerRight.delegate = self;
    //    [panRecognizer release];
    //    _rightEnd=YES;
    _viewNum=3;
}

- (void) handlePan:(UIPanGestureRecognizer*) recognizer
{
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointZero inView:self.view];
}

- (void) handleSwipe:(UISwipeGestureRecognizer*) recognizer
{
    if(recognizer.direction==UISwipeGestureRecognizerDirectionLeft&&_viewNum>2){
        
        
        
        //1、 原生动画
        
        //        [self.navigationController pushViewController:[ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"31"] animated:YES];
        
        
        
        
        //        2、翻转动画
        
        //        [UIView  beginAnimations:nil context:NULL];
        //        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        //        [UIView setAnimationDuration:0.75];
        //        [self.navigationController pushViewController:[ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"31"] animated:NO];
        //
        //        //翻转的动画
        //     [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
        //
        //        [UIView commitAnimations];
        ////        [nextView release];
        //
        
        
        
        //3、可实现左右滑动动画，可设置滑动方向。
        //        CATransition* transition = [CATransition animation];
        //        transition.duration = 0.5;
        //        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        //        transition.type = kCATransitionFromTop;// kCATransitionFade; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
        //        //transition.subtype = kCATransitionFromTop; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
        //        [self.navigationController.view.layer addAnimation:transition forKey:nil];
        ////        [[self navigationController] popViewControllerAnimated:NO];
        //             [self.navigationController pushViewController:[ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"31"] animated:NO];
        //        [UIView commitAnimations];
        
        
        
        
        
        CATransition *animation = [CATransition animation];
        animation.delegate = self;
        animation.duration = kDuration;
        animation.timingFunction = UIViewAnimationCurveEaseInOut;
        //        shadowView.hidden = YES;
        
        
        NSInteger tag = 102;
        switch (tag) {
            case 101:
                animation.type = kCATransitionFade;
                break;
            case 102:
                animation.type = kCATransitionPush;
                break;
            case 103:
                animation.type = kCATransitionReveal;
                break;
            case 104:
                animation.type = kCATransitionMoveIn;
                break;
            case 201:
                animation.type = @"cube";
                break;
            case 202:
                animation.type = @"suckEffect";
                break;
            case 203:
                animation.type = @"oglFlip";
                break;
            case 204:
                animation.type = @"rippleEffect";
                break;
            case 205:
                animation.type = @"pageCurl";
                break;
            case 206:
                animation.type = @"pageUnCurl";
                break;
            case 207:
                animation.type = @"cameraIrisHollowOpen";
                break;
            case 208:
                animation.type = @"cameraIrisHollowClose";
                break;
            default:
                break;
        }
        
        self.typeID=2;
        
        switch (self.typeID) {
            case 0:
                animation.subtype = kCATransitionFromLeft;
                break;
            case 1:
                animation.subtype = kCATransitionFromBottom;
                break;
            case 2:
                animation.subtype = kCATransitionFromRight;
                break;
            case 3:
                animation.subtype = kCATransitionFromTop;
                break;
            default:
                break;
        }
        
        self.typeID += 1;
        if (self.typeID > 3) {
            self.typeID = 0;
        }
        self.typeID=0;
        
        NSUInteger green = [[self.view subviews] indexOfObject:self.firstView];
        NSUInteger blue = [[self.view subviews] indexOfObject:self.twoView];
        [self.view exchangeSubviewAtIndex:green withSubviewAtIndex:blue];
        
        [[self.view layer] addAnimation:animation forKey:@"animation"];
        //        _rightEnd=NO;
        //        _leftEnd=YES;
        _viewNum--;
        
    }else if(recognizer.direction==UISwipeGestureRecognizerDirectionRight&&_viewNum<3){//&&!_rightEnd
        
        CATransition *animation = [CATransition animation];
        animation.delegate = self;
        animation.duration = kDuration;
        animation.timingFunction = UIViewAnimationCurveEaseInOut;
        animation.type = kCATransitionPush;
        animation.subtype = kCATransitionFromLeft;
        NSUInteger green = [[self.view subviews] indexOfObject:self.firstView];
        
        NSUInteger blue = [[self.view subviews] indexOfObject:self.twoView];
        if (_viewNum==1) {
            blue = [[self.view subviews] indexOfObject:self.endView];
        }
        [self.view exchangeSubviewAtIndex:green withSubviewAtIndex:blue];
        [[self.view layer] addAnimation:animation forKey:@"animation"];
        
        //当达到最左边的view时就禁用手势，如果不禁用会不断的循环view
        
        //    _leftEnd=NO;
        //       _rightEnd=YES;
        _viewNum++;
        
    }else if(recognizer.direction==UISwipeGestureRecognizerDirectionLeft&&_viewNum==2){
        
        
        CATransition *animation = [CATransition animation];
        animation.delegate = self;
        animation.duration = kDuration;
        animation.timingFunction = UIViewAnimationCurveEaseInOut;
        animation.type = kCATransitionPush;
        animation.subtype = kCATransitionFromRight;
        NSUInteger green = [[self.view subviews] indexOfObject:self.endView];
        NSUInteger blue = [[self.view subviews] indexOfObject:self.firstView];
        [self.view exchangeSubviewAtIndex:green withSubviewAtIndex:blue];
        [[self.view layer] addAnimation:animation forKey:@"animation"];
        
        _viewNum--;
    }
    
}


- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    [super viewWillAppear:animated];
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

- (IBAction)gotoMainTable:(id)sender {
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = @"pageUnCurl";// kCATransitionFade; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    //transition.subtype = kCATransitionFromTop; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
   
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    //        [[self navigationController] popViewControllerAnimated:NO];
//   [self.navigationController pushViewController:[ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"1"] animated:NO];
    
    //故事版形式
//    self.view.window.rootViewController=[ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"1"] ;
    
    self.view.window.rootViewController = [[ViewController alloc]init];
    [UIView commitAnimations];
    
}
@end
