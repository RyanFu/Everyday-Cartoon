//
//  TTHomeClassifyContentView.h
//  天天漫画
//
//  Created by qianfeng on 15-5-26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTHomeClassifyContentView : UIView

@property(nonatomic,strong)NSArray *classifyData;

+ (id)homeClassifyContentView;

+ (id)homeClassifyContentViewWithClassifyBlock:(id)block;

@end
