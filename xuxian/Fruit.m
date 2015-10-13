//
//  Fruit.m
//  xuxian
//
//  Created by BugHunter on 15/10/12.
//  Copyright © 2015年 BugHunter. All rights reserved.
//

#import "Fruit.h"
#import "Utils.h"
@implementation Fruit

-(NSDictionary *)dictionaryRepresentation{
    return [NSDictionary dictionaryWithObjectsAndKeys:
            [Utils urlEncode:self.name],@"name",
            [Utils urlEncode:self.imageUrl],@"imageUrl",
            [Utils urlEncode:self.introduction],@"introduction",nil];
}
@end
