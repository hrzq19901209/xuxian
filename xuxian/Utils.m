//
//  Utils.m
//  topstories
//
//  Created by Nathan Jones on 5/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (NSString*)urlEncode:(NSString*)rawString {
	NSMutableString *encoded = [[rawString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] mutableCopy];   
	[encoded replaceOccurrencesOfString:@"$" withString:@"%24" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
	[encoded replaceOccurrencesOfString:@"&" withString:@"%26" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
	[encoded replaceOccurrencesOfString:@"+" withString:@"%2B" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
	[encoded replaceOccurrencesOfString:@"," withString:@"%2C" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
	[encoded replaceOccurrencesOfString:@"/" withString:@"%2F" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
	[encoded replaceOccurrencesOfString:@":" withString:@"%3A" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
	[encoded replaceOccurrencesOfString:@";" withString:@"%3B" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
	[encoded replaceOccurrencesOfString:@"=" withString:@"%3D" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
	[encoded replaceOccurrencesOfString:@"?" withString:@"%3F" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
	[encoded replaceOccurrencesOfString:@" " withString:@"%20" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
    [encoded replaceOccurrencesOfString:@"@" withString:@"%40" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
	[encoded replaceOccurrencesOfString:@"\t" withString:@"%09" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
	[encoded replaceOccurrencesOfString:@"#" withString:@"%23" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
	[encoded replaceOccurrencesOfString:@"<" withString:@"%3C" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
	[encoded replaceOccurrencesOfString:@">" withString:@"%3E" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
	[encoded replaceOccurrencesOfString:@"\"" withString:@"%22" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
	[encoded replaceOccurrencesOfString:@"\n" withString:@"%0A" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
	
	return encoded;
}


@end