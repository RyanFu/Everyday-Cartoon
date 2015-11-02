//
//  TTHomeRankContentView.h
//  天天漫画
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTHomeRankContentView : UIView

@property(nonatomic,strong)NSArray *rankData;

+ (id)homeRankContentView;

+ (id)homeRankContentViewWithComicBlock:(id)comicBlock;

@end
