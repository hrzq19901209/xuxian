//
//  Model.h
//  topstories
//
//  Created by Nathan Jones on 2/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fruit.h"

#define kFruitsStartNotification            @"FruitsStartNotification"
#define kFruitsSuccessNotification          @"FruitsSuccessNotification"
#define kFruitsErrorNotification            @"FruitsErrorNotification"


@interface Model : NSObject

@property (nonatomic,strong) NSMutableArray *fruits;
@property (nonatomic,strong) NSMutableArray *ads;
@property (nonatomic,strong) NSMutableArray *sections;

+ (Model *)sharedModel;

- (void)enqueueOperation:(NSOperation*)op;

- (void)fetchFruits;
@end
