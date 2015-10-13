//
//  Model.m
//  topstories
//
//  Created by Nathan Jones on 2/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Model.h"

#import "FetchFruitsOperation.h"
@interface Model() {
@private
    NSOperationQueue    *queue;
}
@end

@implementation Model

static Model *_instance = nil;

- (id)init {
    self = [super init];
    return self;
}

+ (Model *)sharedModel {
    if (_instance == nil) {
        _instance = [[self alloc] init];
    }
    
    return _instance;
}

#pragma mark - Queue Management
- (void)enqueueOperation:(NSOperation*)op {
    if (queue == nil) {
        queue = [[NSOperationQueue alloc] init];
        //[queue setMaxConcurrentOperationCount:5];
    }
    
    [queue addOperation:op];
}

-(void)fetchFruits{
    FetchFruitsOperation *op = [[FetchFruitsOperation alloc] init];
    op.queuePriority = NSOperationQueuePriorityVeryHigh;
    [op enqueueOperation];
}
@end