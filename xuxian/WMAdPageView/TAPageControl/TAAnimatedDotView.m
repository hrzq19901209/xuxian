//
//  TAAnimatedDotView.m
//  TAPageControl
//
//  Created by Tanguy Aladenise on 2015-01-22.
//  Copyright (c) 2015 Tanguy Aladenise. All rights reserved.
//
/**
 画圆点
 */
#import "TAAnimatedDotView.h"

static CGFloat const kAnimateDuration = 1;//动画持续一秒钟

@implementation TAAnimatedDotView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialization];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialization];
    }
    
    return self;
}

- (void)initialization
{
    self.backgroundColor    = [UIColor clearColor];
    self.layer.cornerRadius = CGRectGetWidth(self.frame) / 2;//取宽的一半作为半径画圆角，对于正方形就是画圆。
    self.layer.borderColor  = [UIColor whiteColor].CGColor;
    self.layer.borderWidth  = 2;
}

- (void)changeActivityState:(BOOL)active
{
    if (active) {
        [self animateToActiveState];
    } else {
        [self animateToDeactiveState];
    }
}

- (void)animateToActiveState
{
    [UIView animateWithDuration:kAnimateDuration delay:0 usingSpringWithDamping:.5 initialSpringVelocity:-20 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = [UIColor whiteColor];
        self.transform = CGAffineTransformMakeScale(1.4, 1.4);
    } completion:nil];
}

- (void)animateToDeactiveState
{
    [UIView animateWithDuration:kAnimateDuration delay:0 usingSpringWithDamping:.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = [UIColor clearColor];
        self.transform = CGAffineTransformIdentity;
    } completion:nil];
}

@end
