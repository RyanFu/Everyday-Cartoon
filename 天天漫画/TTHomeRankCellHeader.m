//
//  TTHomeRankCellHeader.m
//  天天漫画
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTHomeRankCellHeader.h"
#import "UIImageView+AFNetworking.h"
#import "TTDefinitionHeader.h"

@interface TTHomeRankCellHeader ()
//Contrains

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageTop;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageLeft;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageBottom;

//titleLab
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabLeft;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabWidth;

//arrowRight
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *arrowRight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *arrowWidth;

//更多
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *moreLabWidth;



@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *titleLab;


@end

@implementation TTHomeRankCellHeader

+ (id)homeRankCellHeaderWithTableView:(UITableView *)tableView
{
    static NSString *headCellID = @"rankheaderCell";
    
    TTHomeRankCellHeader *cell = [tableView dequeueReusableCellWithIdentifier:headCellID];
    
    if (cell==nil) {
        UINib *nib = [UINib nibWithNibName:@"TTHomeRankCellHeader" bundle:nil];
        
        [tableView registerNib:nib forCellReuseIdentifier:headCellID];
        
        cell = [[nib instantiateWithOwner:nil options:nil] lastObject];
        
    }
    
    return cell;
}

-(void)awakeFromNib
{
    self.imageTop.constant*=TTScale;
    self.imageLeft.constant*=TTScale;
    self.imageBottom.constant*=TTScale;
    
    self.titleLabLeft.constant*=TTScale;
    self.titleLabWidth.constant*=TTScale;
    
    self.arrowRight.constant*=TTScale;
    self.arrowWidth.constant*=TTScale;
    
    self.moreLabWidth.constant*=TTScale;
}

-(void)setTitle:(NSString *)title
{
    _title=title;
    
    self.titleLab.text=title;
}

-(void)setIconUrl:(NSString *)iconUrl
{
    _iconUrl=iconUrl;
    
    [self.iconImage setImageWithURL:[NSURL URLWithString:iconUrl] placeholderImage:nil];
}

@end
