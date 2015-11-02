//
//  TTHomeRecommendLimitFreeList.m
//  天天漫画
//
//  Created by qianfeng on 15-5-25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTHomeRecommendLimitFreeList.h"

@implementation TTHomeRecommendLimitFreeList

+ (id)homeRecommendLimitFreeListWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (id)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        TTHomeRecommendLimitFree *free = [TTHomeRecommendLimitFree homeRecommendLimitFreeWithDict:(NSDictionary *)self.data];
        
        self.data=free;
        
    }
    
    return self;
}

@end
