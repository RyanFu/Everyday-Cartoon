//
//  TTHomeUpdateCell.h
//  天天漫画
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTHomeUpdateModel.h"

typedef void(^UpdateBlock)(NSString *comic_id);

@interface TTHomeUpdateCell : UITableViewCell

@property(nonatomic,strong)TTHomeUpdateModel *leftModel;
@property(nonatomic,strong)TTHomeUpdateModel *midModel;
@property(nonatomic,strong)TTHomeUpdateModel *rightModel;

@property(nonatomic,copy)UpdateBlock block;

+ (id)homeUpdateCellWithTableView:(UITableView *)tableView;

@end
