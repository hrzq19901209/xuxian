//
//  BaseOperation.m
//  topstories
//
//  Created by Nathan Jones on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BaseOperation.h"

@implementation BaseOperation

- (void)enqueueOperation {
    [[Model sharedModel] enqueueOperation:self];
}

- (void)postNotification:(NSString*)notificationName {
    // post the notification to the main thread
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:notificationName
                                                            object:nil
                                                          userInfo:nil];
    });
}

- (void)postNotification:(NSString*)notificationName userInfo:(NSDictionary *)userInfo{
    // post the notification to the main thread
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:notificationName
                                                            object:nil
                                                          userInfo:userInfo];
    });
}

@end