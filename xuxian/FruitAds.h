//
//  FruitAds.h
//  xuxian
//
//  Created by BugHunter on 15/10/12.
//  Copyright © 2015年 BugHunter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface FruitAds : NSObject

@property (nonatomic,strong) NSString *url;
@property (nonatomic,strong) NSString *name;

- (NSDictionary*)dictionaryRepresentation;

@end
