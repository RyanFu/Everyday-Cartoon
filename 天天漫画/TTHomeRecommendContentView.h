//
//  TTHomeRecommendContentView.h
//  天天漫画
//
//  Created by qianfeng on 15-5-25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTHomeRecommendContentView : UIView

@property(nonatomic,strong)NSArray *collectionData;

+ (id)homeRecommendContentView;

+ (id)homeRecommendContentViewWithComicBlock:(id)comicBlock andclassifyBlock:(id)classifyBlock;

@end
