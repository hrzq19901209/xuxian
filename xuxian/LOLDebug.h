//
//  LOLDebug.h
//  xuxian
//
//  Created by BugHunter on 15/9/23.
//  Copyright © 2015年 BugHunter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LOLDebug : NSObject
-(void)LogErrorContent:(NSString *)content flag:(NSString *)flag line:(int)line;
-(void)LogInfoContent:(NSString *)content flag:(NSString *)flag line:(int)line;
-(void)LogWarnContent:(NSString *)content flag:(NSString *)flag line:(int)line;
-(void)LogDebugContent:(NSString *)content flag:(NSString *)flag line:(int)line;
-(void)LogVerboseContent:(NSString *)content flag:(NSString *)flag line:(int)line;

+(instancetype)sharedDebug;
@end
