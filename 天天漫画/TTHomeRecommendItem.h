//
//  TTHomeRecommendItem.h
//  天天漫画
//
//  Created by qianfeng on 15-5-25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTHomeRecommendItem : NSObject

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *cover_url;
@property(nonatomic,copy)NSString *src_cover_url;
@property(nonatomic,copy)NSString *comic_id;
@property(nonatomic,copy)NSString *lastup;

+ (id)homeRecommendItemWithDict:(NSDictionary *)dict;

- (id)initWithDict:(NSDictionary *)dict;

@end
