//
//  TTClassifyDetailContentView.h
//  天天漫画
//
//  Created by qianfeng on 15-5-30.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTClassifyDetailContentView : UIView

@property(nonatomic,strong)NSArray *classifyData;

+ (id)classifyDetailContentView;
+ (id)classifyDetailContentViewWithComicBlock:(id)comicBlock;

@end
