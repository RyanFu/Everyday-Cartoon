//
//  TTHomeRecommendAdList.m
//  天天漫画
//
//  Created by qianfeng on 15-5-25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTHomeRecommendAdList.h"
#import "TTHomeRecommendAd.h"

@implementation TTHomeRecommendAdList

+ (id)homeRecommendAdListWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (id)initWithDict:(NSDictionary *)dict
{
    if (self= [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

- (void)setData:(NSArray *)data
{
    NSMutableArray *objs = [NSMutableArray array];
    for(NSDictionary *dic in data){
        TTHomeRecommendAd *item = [TTHomeRecommendAd homeRecommendAdWithDict:dic];
        [objs addObject:item];
    }
    
    _data=objs;
}

@end
