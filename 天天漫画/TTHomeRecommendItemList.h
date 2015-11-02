//
//  TTHomeRecommendItemList.h
//  天天漫画
//
//  Created by qianfeng on 15-5-25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTHomeRecommendItemList : NSObject

@property(nonatomic,strong)NSArray *data;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,assign)NSInteger count;
@property(nonatomic,assign)NSInteger comic_list_id;

+ (id)homeRecommendItemListWithDict:(NSDictionary *)dict;

- (id)initWithDict:(NSDictionary *)dict;

@end
