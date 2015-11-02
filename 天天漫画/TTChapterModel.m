//
//  TTChapterModel.m
//  天天漫画
//
//  Created by slihe on 15/5/31.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTChapterModel.h"

@implementation TTChapterModel

+ (id)chapterModelWithDict:(NSDictionary *)dict
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
