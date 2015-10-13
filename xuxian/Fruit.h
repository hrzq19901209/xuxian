//
//  Fruit.h
//  xuxian
//
//  Created by BugHunter on 15/10/12.
//  Copyright © 2015年 BugHunter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Fruit : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *introduction;
@property (nonatomic,strong) NSString *imageUrl;

-(NSDictionary *)dictionaryRepresentation;

@end
