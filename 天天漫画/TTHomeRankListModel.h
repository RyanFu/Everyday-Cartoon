//
//  TTHomeRankListModel.h
//  天天漫画
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTHomeRankListModel : NSObject

@property(nonatomic,strong)NSArray *data;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *rank_icon_url;
@property(nonatomic,assign)NSInteger rank_id;

+ (id)homeRankListModelWithDict:(NSDictionary *)dict;

- (id)initWithDict:(NSDictionary *)dict;

@end
