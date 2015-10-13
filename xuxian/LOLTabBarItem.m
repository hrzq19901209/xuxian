//
//  LOLTabBarItem.m
//  xuxian
//
//  Created by BugHunter on 15/9/22.
//  Copyright © 2015年 BugHunter. All rights reserved.
//

#import "LOLTabBarItem.h"

@implementation LOLTabBarItem

-(instancetype)initWithTitle:(nullable NSString *)title imageName:(nullable NSString *)image selectedImageName:(nullable NSString *)selectedImage{
    UIImage *i_s = [UIImage imageNamed:selectedImage];
    UIImage *i = [UIImage imageNamed:image];
    i_s = [i_s imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self = [super initWithTitle:title image:i selectedImage:i_s];
    
    return self;
}
@end
