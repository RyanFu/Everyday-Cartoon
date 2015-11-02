//
//  TTHomeRecommendSectionHeader.h
//  天天漫画
//
//  Created by qianfeng on 15-5-26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RecommendBlock)(NSString *comic_list_id);

@interface TTHomeRecommendSectionHeader : UICollectionReusableView

@property(nonatomic,copy)NSString *title;

@property(nonatomic,copy)NSString *comic_list_id;

@property(nonatomic,copy)RecommendBlock block;

@end
