//
//  FruitAds.m
//  xuxian
//
//  Created by BugHunter on 15/10/12.
//  Copyright © 2015年 BugHunter. All rights reserved.
//

#import "FruitAds.h"
#import "Utils.h"

@implementation FruitAds
- (NSDictionary*)dictionaryRepresentation {
    return [NSDictionary dictionaryWithObjectsAndKeys:
            [Utils urlEncode:self.url], @"url",
            [Utils urlEncode:self.name], @"name", nil];
}
@end
