//
//  TTHomeClassifyCell.m
//  天天漫画
//
//  Created by qianfeng on 15-5-26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTHomeClassifyCell.h"
#import "UIImageView+AFNetworking.h"
#import "TTDefinitionHeader.h"

@interface TTHomeClassifyCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *nameLab;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameIconWidth;


@end

@implementation TTHomeClassifyCell

-(void)awakeFromNib
{
    self.nameIconWidth.constant=self.nameIconWidth.constant*TTScale;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(classifyIconClick:)];
    
    [self.iconImage addGestureRecognizer:tap];
}

-(void)setClassify:(TTHomeClassifyModel *)classify
{
    _classify = classify;
    
    self.nameLab.text=classify.classify_title;
    [self.iconImage setImageWithURL:[NSURL URLWithString:classify.classify_url] placeholderImage:nil];
}

- (void)classifyIconClick:(UITapGestureRecognizer *)tap
{
    _block(self);
}

@end
