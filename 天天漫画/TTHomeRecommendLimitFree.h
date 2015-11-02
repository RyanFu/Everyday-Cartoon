//
//  TTHomeRecommendLimitFree.h
//  天天漫画
//
//  Created by qianfeng on 15-5-25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTHomeRecommendLimitFree : NSObject

@property(nonatomic,assign)NSInteger comic_id;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *artist_name;
@property(nonatomic,copy)NSString *grade_ave;
@property(nonatomic,copy)NSString *cover_url;
@property(nonatomic,assign)NSInteger grade;
@property(nonatomic,copy)NSString *brief_intrd;

+ (id)homeRecommendLimitFreeWithDict:(NSDictionary *)dict;

- (id)initWithDict:(NSDictionary *)dict;

@end
