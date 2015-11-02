//
//  TTDetailContentVIew.h
//  天天漫画
//
//  Created by qianfeng on 15-5-28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTDetailManHua.h"
@class TTDetailContentVIew;

@protocol TTDetailContentVIewProtocol <NSObject>

- (void)gotoChapter:(NSString *)comic_id andCid:(NSString *)cid;

@end

@interface TTDetailContentVIew : UIView

@property(nonatomic,strong)TTDetailManHua *detailManHua;

@property(nonatomic,weak)id<TTDetailContentVIewProtocol> delegate;

+ (id)detailContentVIew;

@end
