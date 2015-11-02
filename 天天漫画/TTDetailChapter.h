//
//  TTDetailChapter.h
//  天天漫画
//
//  Created by qianfeng on 15-5-28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTDetailChapter : NSObject

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *cid;
@property(nonatomic,copy)NSString *seq_no;
@property(nonatomic,copy)NSString *btn_str;
@property(nonatomic,copy)NSString *limit_free_state;
@property(nonatomic,copy)NSString *chapter_price;
@property(nonatomic,copy)NSString *buy_state;
@property(nonatomic,assign)NSInteger size;
@property(nonatomic,copy)NSString *vip_state;
@property(nonatomic,copy)NSString *chapter_epub_url;
@property(nonatomic,copy)NSString *epub_size;

+ (id)detailChapterWithDict:(NSDictionary *)dict;

- (id)initWithDict:(NSDictionary *)dict;

@end
