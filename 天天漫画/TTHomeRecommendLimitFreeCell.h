//
//  TTHomeRecommendLimitFreeCell.h
//  天天漫画
//
//  Created by qianfeng on 15-5-25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTHomeRecommendLimitFree.h"

typedef void(^RecommendBlock)(NSString *comic_id);

@interface TTHomeRecommendLimitFreeCell : UICollectionViewCell

@property(nonatomic,strong)TTHomeRecommendLimitFree * free;

@property(nonatomic,copy)RecommendBlock block;

@end
