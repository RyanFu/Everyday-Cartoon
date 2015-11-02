//
//  TTHomeRecommendAd.h
//  天天漫画
//
//  Created by qianfeng on 15-5-25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTHomeRecommendAd : NSObject

@property(nonatomic,copy)NSString *banner_title;
@property(nonatomic,copy)NSString *banner_url;
@property(nonatomic,assign)NSInteger banner_type;
@property(nonatomic,assign)NSInteger comic_id;
@property(nonatomic,copy)NSString *special_event_url;
@property(nonatomic,assign)NSInteger banner_id;

+ (id)homeRecommendAdWithDict:(NSDictionary *)dict;

- (id)initWithDict:(NSDictionary *)dict;

@end
