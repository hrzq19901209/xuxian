//
//  CollectionViewCell.m
//  xuxian
//
//  Created by BugHunter on 15/9/22.
//  Copyright © 2015年 BugHunter. All rights reserved.
//

#import "CollectionViewCell.h"
#import "Constant.h"
@implementation CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.font = [UIFont fontWithName:@"Avenir-Book" size:14];
    
    self.titleLabel.textColor = [UIColor colorWithWhite:0.45 alpha:1.0];
    self.titleLabel.font = [UIFont fontWithName:@"Avenir-Book" size:11];
    
    self.coverImageView.layer.borderColor = [UIColor colorWithWhite:0.2 alpha:1.0].CGColor;
    self.coverImageView.layer.borderWidth = 0.5;
}

@end
