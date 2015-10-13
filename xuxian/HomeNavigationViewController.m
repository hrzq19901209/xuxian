//
//  HomeNavigationViewController.m
//  xuxian
//
//  Created by BugHunter on 15/9/22.
//  Copyright © 2015年 BugHunter. All rights reserved.
//

#import "HomeNavigationViewController.h"
#import "LOLTabBarItem.h"
#import "Constant.h"
#import "UIColor+HexColors.h"
@interface HomeNavigationViewController ()

@end

@implementation HomeNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];    
    if (self) {
        self.tabBarItem = [[LOLTabBarItem alloc] initWithTitle:@"首页" imageName:@"Home" selectedImageName:@"Home_s"];
        self.navigationBar.barTintColor = navigationBarColor;
    }
    
    return self;
}

@end
