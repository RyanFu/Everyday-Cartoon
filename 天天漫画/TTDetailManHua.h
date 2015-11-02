//
//  TTDetailManHua.h
//  天天漫画
//
//  Created by qianfeng on 15-5-28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTDetailManHua.h"

@interface TTDetailManHua : NSObject

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *comic_id;
@property(nonatomic,copy)NSString *cover_url;
@property(nonatomic,copy)NSString *artist_name;
@property(nonatomic,copy)NSString *grade;
@property(nonatomic,copy)NSString *grade_ave;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *lated_seqno;
@property(nonatomic,copy)NSString *pgv_count;
@property(nonatomic,copy)NSString *lastup;
@property(nonatomic,copy)NSString *brief_intrd;
@property(nonatomic,copy)NSString *book_status;
@property(nonatomic,copy)NSString *update_date;
@property(nonatomic,copy)NSString *nation_state;
@property(nonatomic,copy)NSString *vip_state;
@property(nonatomic,copy)NSString *vip_free_state;
@property(nonatomic,copy)NSString *comic_price;
@property(nonatomic,copy)NSString *chapter_cnt;
@property(nonatomic,copy)NSString *user_vip_state;
@property(nonatomic,copy)NSString *vip_discount;
@property(nonatomic,copy)NSString *auto_buy_flag;
@property(nonatomic,copy)NSString *month_ticket;
@property(nonatomic,copy)NSString *shueisha_flag;
@property(nonatomic,copy)NSString *shelf_state;
@property(nonatomic,strong)NSArray *chapters;

+ (id)detailManHuaWithDict:(NSDictionary *)dict;
- (id)initWithDict:(NSDictionary *)dict;

@end
