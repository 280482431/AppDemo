//
//  HQTabBarRootViewController.m
//  B2C_iPhone_V4
//
//  Created by JimBo on 15/6/27.
//  Copyright (c) 2015年 edu24ol. All rights reserved.
//

#import "ARTabBarRootViewController.h"
#import "HQHomeViewController.h"
#import "HQVideoViewController.h"
#import "HQMeViewController.h"

@interface ARTabBarRootViewController ()

@end

@implementation ARTabBarRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupViewControllers];
}

- (void)setupViewControllers
{
    HQHomeViewController *homeVC = [[HQHomeViewController alloc] init];
    [self p_addChildViewController:homeVC title:@"首页" normalImgName:@"" selectedImgName:@""];

    HQVideoViewController *videoVC = [[HQVideoViewController alloc] init];
    [self p_addChildViewController:videoVC title:@"考试" normalImgName:@"" selectedImgName:@""];
    
    HQMeViewController *meVC = [[HQMeViewController alloc] init];
    [self p_addChildViewController:meVC title:@"我的" normalImgName:@"" selectedImgName:@""];
    
    self.selectedIndex = 0;
    
    self.tabBar.barTintColor = UIColor.whiteColor;
    self.tabBar.tintColor = UIColor.blackColor;
}

@end

