//
//  ShoppingNavigationViewController.m
//  xuxian
//
//  Created by BugHunter on 15/9/22.
//  Copyright © 2015年 BugHunter. All rights reserved.
//

#import "ShoppingNavigationViewController.h"
#import "LOLTabBarItem.h"
@interface ShoppingNavigationViewController ()

@end

@implementation ShoppingNavigationViewController

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
        self.tabBarItem  = [[LOLTabBarItem alloc] initWithTitle:@"购物车" imageName:@"Shopping.png" selectedImageName:@"Shopping_s.png"];
    }
    
    return self;
}

@end
