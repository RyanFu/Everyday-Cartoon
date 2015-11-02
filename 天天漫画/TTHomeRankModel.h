//
//  TTHomeRankModel.h
//  天天漫画
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTHomeRankModel : NSObject

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *cover_url;
@property(nonatomic,assign)NSInteger comic_id;
@property(nonatomic,assign)NSInteger grade;
@property(nonatomic,copy)NSString *grade_ave;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *lastup;
@property(nonatomic,assign)NSInteger trend;

+ (id)homeRankModelWithDict:(NSDictionary *)dict;

- (id)initWithDict:(NSDictionary *)dict;

@end
