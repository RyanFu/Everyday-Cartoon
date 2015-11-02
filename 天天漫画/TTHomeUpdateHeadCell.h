//
//  TTHomeUpdateHeadCell.h
//  天天漫画
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TTHomeUpdateHeadCell;

@protocol TTHomeUpdateHeadCellTouchDelegate <NSObject>

- (void)homeUpdateHeadCellTouchDelegateWithCell:(TTHomeUpdateHeadCell *)cell;

@end

@interface TTHomeUpdateHeadCell : UITableViewCell

@property(nonatomic,copy)NSString *leftImageName;
@property(nonatomic,copy)NSString *day;
@property(nonatomic,copy)NSString *openImageName;
@property(nonatomic,strong)NSIndexPath *indexPath;
@property(nonatomic,weak)id<TTHomeUpdateHeadCellTouchDelegate> delegate;

+ (id)homeUpdateHeadCellWithTableView:(UITableView *)tableView;

- (void)hidLeftTopLine:(BOOL)topLine andHidLeftBottomLine:(BOOL)bottomLine andUnderLine:(BOOL)underLine;

@end
