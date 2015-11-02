//
//  TTHomeRecommendCell.m
//  天天漫画
//
//  Created by qianfeng on 15-5-25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTHomeRecommendCell.h"
#import "UIImageView+AFNetworking.h"

@interface TTHomeRecommendCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *nameLab;

@property (weak, nonatomic) IBOutlet UILabel *lastupLab;


@end

@implementation TTHomeRecommendCell

-(void)awakeFromNib
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(iconClick:)];
    
    [self.iconImage addGestureRecognizer:tap];
}

-(void)setItem:(TTHomeRecommendItem *)item
{
    _item = item;
    
    [self.iconImage setImageWithURL:[NSURL URLWithString:item.cover_url] placeholderImage:nil];
    
    self.nameLab.text=item.title;
    self.lastupLab.text=item.lastup;
}

-(void)iconClick:(UITapGestureRecognizer *)tap
{
    self.block(self.item.comic_id);
}

@end
