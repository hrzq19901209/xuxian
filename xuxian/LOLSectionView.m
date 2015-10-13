//
//  LOLSectionView.m
//  xuxian
//
//  Created by BugHunter on 15/10/5.
//  Copyright © 2015年 BugHunter. All rights reserved.
//

#import "LOLSectionView.h"

@implementation LOLSectionView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = [UIFont fontWithName:@"Avenir-Book" size:16];
}

@end
