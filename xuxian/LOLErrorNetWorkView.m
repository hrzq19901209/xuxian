//
//  LOLErrorNetWorkView.m
//  xuxian
//
//  Created by BugHunter on 15/10/15.
//  Copyright © 2015年 BugHunter. All rights reserved.
//

#import "LOLErrorNetWorkView.h"

@implementation LOLErrorNetWorkView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = 100;
        CGFloat height = 40;
        CGFloat x = self.frame.size.width - 10 - width;
        CGFloat y = 10;
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
        [button setTitle:@"详情" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor grayColor];
        [self addSubview:button];
        self.backgroundColor = [UIColor redColor];
        self.tag = tag;
    }
    return self;
}
@end
