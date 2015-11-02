//
//  TTDetailManHua.m
//  天天漫画
//
//  Created by qianfeng on 15-5-28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTDetailManHua.h"
#import "TTDetailChapter.h"

@implementation TTDetailManHua

+ (id)detailManHuaWithDict:(NSDictionary *)dict
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
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

-(void)setChapters:(NSArray *)chapters
{
    NSMutableArray *objs = [NSMutableArray array];
    for(NSDictionary *dict in chapters){
        TTDetailChapter *chapter = [TTDetailChapter detailChapterWithDict:dict];
        [objs addObject:chapter];
    }
    
    _chapters=objs;
}

@end
