//
//  TTHomeRecommendLimitFreeList.h
//  天天漫画
//
//  Created by qianfeng on 15-5-25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTHomeRecommendLimitFree.h"

@interface TTHomeRecommendLimitFreeList : NSObject

@property(nonatomic,strong)TTHomeRecommendLimitFree *data;
@property(nonatomic,copy)NSString *title;

+ (id)homeRecommendLimitFreeListWithDict:(NSDictionary *)dict;

- (id)initWithDict:(NSDictionary *)dict;

@end
