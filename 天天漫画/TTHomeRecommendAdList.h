//
//  TTHomeRecommendAdList.h
//  天天漫画
//
//  Created by qianfeng on 15-5-25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTHomeRecommendAdList : NSObject

@property(nonatomic,strong)NSArray *data;
@property(nonatomic,assign)NSInteger count;

+ (id)homeRecommendAdListWithDict:(NSDictionary *)dict;

- (id)initWithDict:(NSDictionary *)dict;

@end
