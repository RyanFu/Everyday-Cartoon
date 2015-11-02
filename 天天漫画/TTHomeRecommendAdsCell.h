//
//  TTHomeRecommendAdsCell.h
//  天天漫画
//
//  Created by qianfeng on 15-5-26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RecommendBlock)(NSString *comic_id);

@interface TTHomeRecommendAdsCell : UICollectionViewCell

@property(nonatomic,strong)NSArray *imageViews;
@property(nonatomic,strong)NSArray *comic_id_array;

@property(nonatomic,copy)RecommendBlock block;

@end
