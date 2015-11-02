//
//  TTHomeUpdateModel.h
//  天天漫画
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTHomeUpdateModel : NSObject

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *comic_id;
@property(nonatomic,copy)NSString *cover_url;
@property(nonatomic,copy)NSString *lastup;

+ (id)homeUpdateModelWithDict:(NSDictionary *)dict;

- (id)initWithDict:(NSDictionary *)dict;

@end
