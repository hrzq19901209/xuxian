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

#define kURL @"http://192.168.11.3/xuxian/feed/feeddd.json"

@implementation FetchFruitsOperation

-(void)main{
    [self postNotification:kFruitsStartNotification];
    
    NSURL *url = [NSURL URLWithString:kURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.timeoutInterval = 5;
    
    NSHTTPURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    if (error) {
        switch (error.code) {
            case kCFURLErrorCannotConnectToHost:
                NSLog(@"无法路由到主机");
                break;
            case kCFURLErrorTimedOut:
                NSLog(@"请求超时");
                break;
            default:
                NSLog(@"其他错去%@",error.localizedDescription);
                break;
        }
        [self postNotification:kFruitsErrorNotification];
    }else{
        NSDictionary *directionary = [NSJSONSerialization JSONObjectWithData:data
                                                                     options:NSJSONReadingMutableLeaves
                                                                error:nil];
        [[Model sharedModel] initModels:directionary];
        [[Model sharedModel] updateCache:directionary];
        [self postNotification:kFruitsSuccessNotification];
    }
}

@end
