//
//  TTHomeRankCellHeader.h
//  天天漫画
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTHomeRankCellHeader : UITableViewCell

@property(nonatomic,copy)NSString *iconUrl;
@property(nonatomic,copy)NSString *title;

+ (id)homeRankCellHeaderWithTableView:(UITableView *)tableView;

@end
