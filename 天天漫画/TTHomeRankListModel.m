//
//  TTHomeRankListModel.m
//  天天漫画
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTHomeRankListModel.h"
#import "TTHomeRankModel.h"

@implementation TTHomeRankListModel

+ (id)homeRankListModelWithDict:(NSDictionary *)dict
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

-(void)setData:(NSArray *)data
{
    NSMutableArray *objs = [NSMutableArray array];
    for(NSDictionary *dict in data){
        TTHomeRankModel *rank = [TTHomeRankModel homeRankModelWithDict:dict];
        [objs addObject:rank];
    }
    
    _data=objs;
}

@end
