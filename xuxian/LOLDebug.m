//
//  LOLDebug.m
//  xuxian
//
//  Created by BugHunter on 15/9/23.
//  Copyright © 2015年 BugHunter. All rights reserved.
//

#import "LOLDebug.h"
#import <CocoaLumberjack/CocoaLumberjack.h>
#import "DDTTYLogger.h"
@implementation LOLDebug
static const int ddLogLevel = DDLogLevelVerbose;

-(void)LogErrorContent:(NSString *)content flag:(NSString *)flag line:(int)line{
    DDLogError(@"[Error]:%@__%@__Line:%d",content,flag,line);
}

-(void)LogInfoContent:(NSString *)content flag:(NSString *)flag line:(int)line{
    DDLogInfo(@"[Info]:%@__%@__Line:%d",content,flag,line);
}

-(void)LogWarnContent:(NSString *)content flag:(NSString *)flag line:(int)line{
    DDLogWarn(@"[Warn]:%@__%@__Line:%d",content,flag,line);
}

-(void)LogDebugContent:(NSString *)content flag:(NSString *)flag line:(int)line{
    DDLogDebug(@"[Debug]:%@__%@__Line:%d",content,flag,line);
}

-(void)LogVerboseContent:(NSString *)content flag:(NSString *)flag line:(int)line{
    DDLogVerbose(@"[Verbose]:%@__%@__Line:%d",content,flag,line);
}

+(instancetype)sharedDebug{
    static LOLDebug *sharedDebug = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken,^{
        [DDLog addLogger:[DDTTYLogger sharedInstance]];        
        [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
        [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor greenColor] backgroundColor:nil forFlag:DDLogFlagInfo];
        [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor blueColor] backgroundColor:nil forFlag:DDLogFlagDebug];
        sharedDebug = [[LOLDebug alloc] init];
    });
    return sharedDebug;
}
@end
