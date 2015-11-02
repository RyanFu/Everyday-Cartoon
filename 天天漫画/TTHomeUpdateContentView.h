//
//  TTHomeUpdateContentView.h
//  天天漫画
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTHomeUpdateContentView : UIView

@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,assign)NSInteger current_index;

+ (id)homeUpdateContentView;

+ (id)homeUpdateContentViewWithUpdateBlock:(id)block;

@end
