//
//  TTClassifyDetailCell.h
//  天天漫画
//
//  Created by qianfeng on 15-5-30.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTClassifyDetail.h"

typedef void(^ComicBlock)(NSString *comic_id);

@interface TTClassifyDetailCell : UITableViewCell

@property(nonatomic,strong)TTClassifyDetail *classifyDetail;

+ (id)classifyDetailCellWithTableView:(UITableView *)tableView;

@property(nonatomic,copy)ComicBlock block;

@end
