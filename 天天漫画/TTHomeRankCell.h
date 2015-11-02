//
//  TTHomeRankCell.h
//  天天漫画
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTHomeRankModel.h"

typedef void(^RankBlock)(NSString *comic_id);

@interface TTHomeRankCell : UITableViewCell

@property(nonatomic,strong)TTHomeRankModel *rank;

+ (id)homeRankCellWithTableView:(UITableView *)tableView;

@property(nonatomic,copy)RankBlock block;

@end
