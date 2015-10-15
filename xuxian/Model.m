//
//  Model.m
//  topstories
//
//  Created by Nathan Jones on 2/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Model.h"

#import "FetchFruitsOperation.h"
#import "Fruit.h"
#import "FruitAds.h"
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
//cache
-(NSString *)dicArchivePath{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent:@"dic.archive"];
}
-(BOOL)updateCache:(NSDictionary *)directionary{
    NSString *path = [self dicArchivePath];
    return [NSKeyedArchiver archiveRootObject:directionary
                                       toFile:path];
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

-(void)initModels:(NSDictionary *)directionary{
    NSArray *dAds = [directionary objectForKey:@"advertisement"];
    NSDictionary *dFruits = [directionary objectForKey:@"fruits"];
    
    NSMutableArray *fruits = [NSMutableArray array];
    NSMutableArray *ads = [NSMutableArray array];
    NSMutableArray *sections = [NSMutableArray array];
    
    NSArray *categories = [dFruits allKeys];
    for (id category in categories) {
        [sections addObject:category];
        NSArray *items = [dFruits objectForKey:category];
        NSMutableArray *fruitsInCategory = [NSMutableArray array];
        for (NSDictionary *item in items) {
            Fruit *fruit = [[Fruit alloc] init];
            [fruit setName:[item objectForKey:@"name"]];
            [fruit setIntroduction:[item objectForKey:@"introduction"]];
            [fruit setImageUrl:[item objectForKey:@"imageUrl"]];
            [fruitsInCategory addObject:fruit];
        }
        [fruits addObject:fruitsInCategory];
    }
    for (NSDictionary *ad in dAds) {
        FruitAds *fa = [[FruitAds alloc] init];
        [fa setName:[ad objectForKey:@"name"]];
        [fa setUrl:[ad objectForKey:@"url"]];
        [ads addObject:fa];
    }
    [Model sharedModel].fruits = fruits;
    [Model sharedModel].ads = ads;
    [Model sharedModel].sections = sections;
}

-(void)initModelsWithCacheDic{
    
    NSString *path = [self dicArchivePath];
    NSDictionary *cacheDic = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (cacheDic) {
        [self initModels:cacheDic];
    }
}
@end