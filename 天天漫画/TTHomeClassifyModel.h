//
//  TTHomeClassifyModel.h
//  天天漫画
//
//  Created by qianfeng on 15-5-26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTHomeClassifyModel : NSObject

@property(nonatomic,copy)NSString *classify_id;
@property(nonatomic,copy)NSString *classify_url;
@property(nonatomic,copy)NSString *classify_title;

+ (id)homeClassifyModelWithDict:(NSDictionary *)dict;

- (id)initWithDict:(NSDictionary *)dict;

@end
