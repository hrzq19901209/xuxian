//
//  Constant.h
//  xuxian
//
//  Created by BugHunter on 15/9/27.
//  Copyright © 2015年 BugHunter. All rights reserved.
//
#ifndef Constant_h
#define Constant_h
#import "UIColor+HexColors.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


#define GetColor(hexColor) [UIColor colorWithHexString:hexColor];
#define navigationBarColor GetColor(@"27ae60")
#define titleColor GetColor(@"27ae60")

// 4.屏幕大小尺寸
#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height


@interface Constant : NSObject

@end

#endif /* Constant_h */
