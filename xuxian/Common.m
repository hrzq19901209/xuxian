//
//  Common.m
//  xuxian
//
//  Created by BugHunter on 15/9/23.
//  Copyright © 2015年 BugHunter. All rights reserved.
//

#import "Common.h"
@implementation Common

+(UIImage *)getOrginalModelImage:(NSString *)image{
    UIImage *i = [UIImage imageNamed:image];
    i = [i imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return i;
}
@end
