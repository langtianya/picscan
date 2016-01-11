//
//  ViewControllerManager.m
//  picScan
//
//  Created by ocq on 14/9/21.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "ViewControllerManager.h"

@interface ViewControllerManager ()

@end

@implementation ViewControllerManager



+(UIViewController *)getViewControllerFromStoryboard:(NSString *)MyStoryboard withIdentifier:(NSString *)myIdentifier{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:MyStoryboard  bundle:nil];
    
    //      self.view.window.rootViewController = [storyboard instantiateInitialViewController];
    //    [self presentModalViewController:[storyboard instantiateInitialViewController] animated:YES];
    
    return [storyboard instantiateViewControllerWithIdentifier:myIdentifier];
}

+(UIViewController *)getMainStoryboardViewControllerWithIdentifier:(NSString *)myIdentifier{
    return [ViewControllerManager getViewControllerFromStoryboard:@"MainStoryboard" withIdentifier:myIdentifier];
}




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
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
