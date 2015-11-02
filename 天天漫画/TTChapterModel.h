//
//  TTChapterModel.h
//  天天漫画
//
//  Created by slihe on 15/5/31.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTChapterModel : NSObject

@property(nonatomic,copy)NSString *current_img_url;
@property(nonatomic,copy)NSString *width;
@property(nonatomic,copy)NSString *height;
@property(nonatomic,copy)NSString *step_cnt;
@property(nonatomic,copy)NSString *storyline;

+ (id)chapterModelWithDict:(NSDictionary *)dict;

- (id)initWithDict:(NSDictionary *)dict;

@end
