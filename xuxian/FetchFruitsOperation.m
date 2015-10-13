//
//  FetchFruitsOperation.m
//  xuxian
//
//  Created by BugHunter on 15/10/12.
//  Copyright © 2015年 BugHunter. All rights reserved.
//

#import "FetchFruitsOperation.h"
#import "Fruit.h"
#import "FruitAds.h"

#define kURL @"http://192.168.11.4/xuxian/feed/feed.json"

@implementation FetchFruitsOperation

-(void)main{
    [self postNotification:kFruitsStartNotification];
    
    NSURL *url = [NSURL URLWithString:kURL];
    NSError *error = nil;
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:nil
                                                     error:nil];
    NSDictionary *directionary = [NSJSONSerialization JSONObjectWithData:data
                                                            options:NSJSONReadingMutableLeaves
                                                              error:&error];
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
    [self postNotification:kFruitsSuccessNotification];
}

@end
