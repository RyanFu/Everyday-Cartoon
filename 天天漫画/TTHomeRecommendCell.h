//
//  TTHomeRecommendCell.h
//  天天漫画
//
//  Created by qianfeng on 15-5-25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTHomeRecommendItem.h"

typedef void(^RecommendBlock)(NSString *comic_id);

@interface TTHomeRecommendCell : UICollectionViewCell

@property(nonatomic,strong)TTHomeRecommendItem *item;

@property(nonatomic,copy)RecommendBlock block;

@end
