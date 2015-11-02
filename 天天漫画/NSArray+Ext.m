//
//  NSArray+Ext.m
//  英雄战士
//
//  Created by qianfeng on 15-4-22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "NSArray+Ext.h"

@implementation NSArray (Ext)

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString * strM = [NSMutableString string];
    
    [strM appendString:@"(\n"];
    
    for(id obj in self){
        [strM appendFormat:@"\t%@\n", obj];
    }
    
    [strM appendString:@"\n)"];
    
    return strM;
}

@end
