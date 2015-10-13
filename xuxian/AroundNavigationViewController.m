//
//  AroundNavigationViewController.m
//  xuxian
//
//  Created by BugHunter on 15/9/22.
//  Copyright © 2015年 BugHunter. All rights reserved.
//

#import "AroundNavigationViewController.h"
#import "LOLTabBarItem.h"
#import "Constant.h"
@interface AroundNavigationViewController ()

@end

@implementation AroundNavigationViewController

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
        self.tabBarItem = [[LOLTabBarItem alloc] initWithTitle:@"附近" imageName:@"Share.png" selectedImageName:@"Share_s.png"];
        self.navigationBar.barTintColor = navigationBarColor;

    }
    
    return self;
}

@end
