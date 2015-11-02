//
//  TTHomeRecommendItemList.m
//  天天漫画
//
//  Created by qianfeng on 15-5-25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTHomeRecommendItemList.h"
#import "TTHomeRecommendItem.h"

@implementation TTHomeRecommendItemList

- (void)setData:(NSArray *)data
{
    NSMutableArray *objs = [NSMutableArray array];
    for(NSDictionary *dic in data){
        TTHomeRecommendItem *item = [TTHomeRecommendItem homeRecommendItemWithDict:dic];
        [objs addObject:item];
    }
    
    _data=objs;
}

+ (id)homeRecommendItemListWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

@end
