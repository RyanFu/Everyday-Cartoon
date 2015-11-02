//
//  TTDetailChapterHeader.h
//  天天漫画
//
//  Created by qianfeng on 15-5-29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TTDetailChapterHeader;

@protocol TTDetailChapterHeaderProtocol <NSObject>

- (void)updateChaptersOrder:(TTDetailChapterHeader *)header andOrder:(BOOL)order;

@end

@interface TTDetailChapterHeader : UICollectionReusableView

@property(nonatomic,weak)id<TTDetailChapterHeaderProtocol> delegate;

@end
