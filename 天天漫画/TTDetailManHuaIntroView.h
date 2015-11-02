//
//  TTDetailManHuaIntroView.h
//  天天漫画
//
//  Created by qianfeng on 15-5-29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TTDetailManHuaIntroView;

@protocol TTDetailManHuaIntroViewProtocol <NSObject>

- (void)updateContentView:(TTDetailManHuaIntroView *)introView withOffSet:(CGFloat)offset;

@end

@interface TTDetailManHuaIntroView : UIView

@property(nonatomic,copy)NSString *intro;
@property(nonatomic,weak)id<TTDetailManHuaIntroViewProtocol> delegate;
@property(nonatomic,strong)NSLayoutConstraint *heightConstraint;

+ (id)detailManHuaIntroView;

@end
