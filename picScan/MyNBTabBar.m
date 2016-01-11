//
//  MyNBTabBar.m
//  NB2
//
//  Created by kohn on 13-11-16.
//  Copyright (c) 2013年 Kohn. All rights reserved.
//

#import "MyNBTabBar.h"
#import "MyNBTabButton.h"
#import "MyNBTabNotification.h"

//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

//屏幕适配，如果ios版本大于等于7.0就是IOS7以上
#define HEIGHT_MENU_VIEW ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? 45 : 65)

@interface MyNBTabBar()

@property (strong) NSMutableArray *buttons;//tabbar的按钮们
@property (strong) NSMutableArray *buttonData;//tabbar的按钮数据，即点击tab按钮后显示的信息，如控制器
@property (strong) NSMutableArray *statusLights;

- (void)setupButtons;
- (void)setupLights;

@end

//全局的单例
static MyNBTabBar *instance;


@implementation MyNBTabBar

+(MyNBTabBar *)getInstance{
    return instance;
}

@synthesize buttons = _buttons, buttonData = _buttonData, statusLights = _statusLights, delegate;

- (id)initWithItems:(NSArray *)items {
    self = [super init];
    if (self) {
        //根据设备的不同设置不同的宽高
        self.frame = CGRectMake(0, SCREEN_HEIGHT - HEIGHT_MENU_VIEW, SCREEN_WIDTH, 45);
        self.backgroundColor = [UIColor blackColor];
        
        self.buttonData = [[NSMutableArray alloc]initWithArray:items];
        self.buttons = [[NSMutableArray alloc]init];
        
        [self setupButtons];
        [self setupLights];
        
        //启动线程
        NSThread *thread1=[[NSThread alloc]initWithTarget:self selector:@selector(addNotificationAfterTime) object:nil];
        [thread1 start];
        int i=0;
        
        //遍历tabbar按钮
            for (MyNBTabButton *button in _buttonData) {
                
                //满足某个条件就通知加1
                if (i==1) {
                    [self addNotifications:1 inIndex:i];
                }
                i++;
            }
        
    }
//    if(instance==nil)
//        instance=self;
    return self;
}


-(void)addNotifications:(NSInteger)notifyNum inIndex:(NSInteger)index{
    if (notifyNum==0) {
        notifyNum=1;
    }
    //    if (index==0) {
    //        index=1;
    //    }
    MyNBTabButton *button=_buttonData[index];
    [button.light addNotifications:notifyNum];
}


//-(void)addNotifications:(NSInteger)notifyNum inIndex:(NSInteger)index{
-(void)addNotifications:(NSArray*)data{

    if (data==nil||data.count!=2) {
        return;
    }
    //nsstring字符串转nsinteger
    NSInteger notifyNum=[(NSString*)data[0] intValue];
    NSInteger index=[data[1] intValue];

    MyNBTabButton *button=_buttonData[index];
    [button.light addNotifications:notifyNum];

    
}

#pragma 定时线程调用方法
-(void)addNotificationAfterTime
{
     [NSThread sleepForTimeInterval:20];//休眠多少秒之后
    

    [self performSelectorOnMainThread:@selector(addNotifications:) withObject:[NSArray arrayWithObjects:@"1",@"2", nil] waitUntilDone:NO];
//      [self performSelectorOnMainThread:@selector(addNotifications:inIndex:) withObject:[NSArray arrayWithObjects:@"1",@"2", nil] waitUntilDone:NO];
        [NSThread sleepForTimeInterval:1.0];
    
}

- (void)setupButtons {
    
    NSInteger count = 0;
    NSInteger xExtra = 0;
    
    NSInteger buttonSize = floor(SCREEN_WIDTH / [self.buttonData count]) -1;
    
    //遍历tab按钮数组
    for (MyNBTabButton *info in self.buttonData) {
        
        NSInteger extra = 0;
        if ([self.buttonData count] % 2 == 1) {
            
            //
            if ([self.buttonData count] == 5) {
                NSInteger i = (count +1) + (floor([self.buttonData count] / 2));
                if (i == [self.buttonData count]) {
                    extra = 1;
                }else if([self.buttonData count] == 3){
                    buttonSize = floor(SCREEN_WIDTH / [self.buttonData count]);
                }
            }else{
                if (count + 1 == 2) {
                    extra = 1;
                } else if (count + 1 == 3) {
                    xExtra = 1;
                }
            }
        }
        
        NSInteger buttonX = (count * buttonSize) +count+xExtra;
        
        UIButton *tabButton = [UIButton buttonWithType:UIButtonTypeCustom];
        tabButton.frame  = CGRectMake(buttonX, 2, buttonSize + extra, 43);
        
        //设置tab按钮的背景图片
        UIImage *tabButtonBackground = [[UIImage imageNamed:@"tabButtonBackground"]stretchableImageWithLeftCapWidth:1 topCapHeight:0];
        
        UIImage *hightabButtonBackground = [[UIImage imageNamed:@"hightabButtonBackground"]stretchableImageWithLeftCapWidth:1 topCapHeight:0];
        
        UIImage * normalImage = [info icon];
        UIImage * highlightImage = [info highlightedIcon];
        
        UIImageView *btnImgView = [[UIImageView alloc] initWithImage:normalImage highlightedImage:highlightImage];
        btnImgView.frame = CGRectMake((buttonSize + extra-64)/2, 0, 64, 43);
        [tabButton addSubview:btnImgView];
        
        [tabButton setBackgroundImage:tabButtonBackground forState:UIControlStateNormal];
        [tabButton setBackgroundImage:hightabButtonBackground forState:UIControlStateSelected];
        
        [tabButton addTarget:self action:@selector(touchDownForButton:) forControlEvents:UIControlEventTouchDown];
        [tabButton addTarget:self action:@selector(touchUpForButton:) forControlEvents:UIControlEventTouchUpInside];
        
        //遍历每个button后添加到tabbar指定位置
        [self addSubview:tabButton];
        //放到按钮数组中
        [self.buttons addObject:tabButton];
        count++;
    }
}

- (void)setupLights{
    
    NSInteger count = 0;
    NSInteger xExtra = 0;
    NSInteger buttonSize = floor(320 / [self.buttonData count]) - 1;
    for (MyNBTabButton *info in self.buttonData) {
        NSInteger extra = 0;
        if ([self.buttonData count] % 2 == 1) {
            if ([self.buttonData count] == 5) {
                NSInteger i = (count + 1) + (floor([self.buttonData count] / 2));
                if (i == [self.buttonData count]) {
                    extra = 1;
                } else if (i == [self.buttonData count]+1) {
                    xExtra = 1;
                }
            } else if ([self.buttonData count] == 3) {
                buttonSize = floor(320 / [self.buttonData count]);
            }
        } else {
            if (count + 1 == 2) {
                extra = 1;
            } else if (count + 1 == 3) {
                xExtra = 1;
            }
        }
        NSInteger buttonX = (count * buttonSize) + count + xExtra;
        [[info notificationView] updateImageView];
        [[info notificationView] setAllFrames:CGRectMake(buttonX + buttonSize+extra - 29 , 0, 24, 27)];
        
        [self addSubview:[info notificationView]];
        count++;
    }
    
}

- (void)showDefauls {
    [self touchDownForButton:[self.buttons objectAtIndex:0]];
    [self touchUpForButton:[self.buttons objectAtIndex:0]];
}

#pragma 显示指定给定下标的视图
- (void)showIndex:(NSInteger) index{
    [self touchDownForButton:[self.buttons objectAtIndex:index]];
    [self touchUpForButton:[self.buttons objectAtIndex:index]];
}

#pragma tab按钮按下时调用
- (void)touchDownForButton:(UIButton *)button{
    
    button.selected = YES;
    
    //根据对象从数组中获取对应下标
    NSInteger i = [self.buttons indexOfObject:button];
    
    //根据下标获取按钮对应的数据,即对应的视图
    MyNBTabController *vc = [[self.buttonData objectAtIndex:i] viewController];
    
    [delegate switchViewController:vc];
    
    for (UIButton *b in self.buttons) {
        for (UIView *aView in [b subviews]) {
            if ([aView isKindOfClass:[UIImageView class]]) {
                UIImageView * imgView = (UIImageView *)aView;
                imgView.highlighted = NO;
            }
        }
    }
    for (UIView *aView in [button subviews]) {
        if ([aView isKindOfClass:[UIImageView class]]) {
            UIImageView * imgView = (UIImageView *)aView;
            imgView.highlighted = YES;
        }
    }
    
    for (UIButton * b in self.buttons) {
        b.selected = NO;
    }
    
}
- (void)touchUpForButton:(UIButton *)button {
    for (UIButton *b in self.buttons) {
        for (UIView *aView in [b subviews]) {
            if ([aView isKindOfClass:[UIImageView class]]) {
                UIImageView * imgView = (UIImageView *)aView;
                imgView.highlighted = NO;
            }
        }
    }
    for (UIView *aView in [button subviews]) {
        if ([aView isKindOfClass:[UIImageView class]]) {
            UIImageView * imgView = (UIImageView *)aView;
            imgView.highlighted = YES;
        }
    }
    
    for (UIButton * b in self.buttons) {
        b.selected = NO;
    }
    button.selected = YES;
}


@end
