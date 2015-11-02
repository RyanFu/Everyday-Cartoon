//
//  TTHomeRecommendAd.m
//  天天漫画
//
//  Created by qianfeng on 15-5-25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTHomeRecommendAd.h"

@implementation TTHomeRecommendAd

+ (id)homeRecommendAdWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (id)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

@end
