//
//  TTHomeClassifyCell.h
//  天天漫画
//
//  Created by qianfeng on 15-5-26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTHomeClassifyModel.h"
@class TTHomeClassifyCell;

typedef void(^ClassifyBlock)(id cell);

@interface TTHomeClassifyCell : UICollectionViewCell

@property(nonatomic,strong)TTHomeClassifyModel *classify;

@property(nonatomic,copy)ClassifyBlock block;

@end
