//
//  GuestNavigationViewController.m
//  xuxian
//
//  Created by BugHunter on 15/9/22.
//  Copyright © 2015年 BugHunter. All rights reserved.
//

#import "GuestNavigationViewController.h"
#import "LOLTabBarItem.h"
@interface GuestNavigationViewController ()

@end

@implementation GuestNavigationViewController

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
        self.tabBarItem = [[LOLTabBarItem alloc] initWithTitle:@"我的" imageName:@"Guest.png" selectedImageName:@"Guest_s.png"];
    }
    
    return self;
}

@end
