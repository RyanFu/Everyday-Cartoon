//
//  TTHomeRecommendSectionHeader.m
//  天天漫画
//
//  Created by qianfeng on 15-5-26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTHomeRecommendSectionHeader.h"
#import "TTDefinitionHeader.h"

@interface TTHomeRecommendSectionHeader ()

@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@property (weak, nonatomic) IBOutlet UIImageView *arrowImage;

//contrains

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleTop;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLeft;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleBottom;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *arrowWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *arrowRight;



@end

@implementation TTHomeRecommendSectionHeader

-(void)awakeFromNib
{
    self.titleTop.constant=self.titleTop.constant*TTScale;
    self.titleLeft.constant=self.titleLeft.constant*TTScale;
    self.titleBottom.constant=self.titleBottom.constant*TTScale;
    
    self.arrowWidth.constant=self.arrowWidth.constant*TTScale;
    self.arrowRight.constant=self.arrowRight.constant*TTScale;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headClick:)];
    
    [self addGestureRecognizer:tap];
    
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLab.text=title;
}

- (void)headClick:(UITapGestureRecognizer *)tap
{
    _block(self.comic_list_id);
}

@end
