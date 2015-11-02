//
//  TTHomeRecommendAdsCell.m
//  天天漫画
//
//  Created by qianfeng on 15-5-26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTHomeRecommendAdsCell.h"
#import "TTGeneralAdsView.h"

@interface TTHomeRecommendAdsCell ()

@property(nonatomic,weak)TTGeneralAdsView *adsView;

@end

@implementation TTHomeRecommendAdsCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor=[UIColor redColor];
        [self createSubViews];
    }
    
    return self;
}

- (void)createSubViews
{
    TTGeneralAdsView *adsView = [TTGeneralAdsView generalAdsView];
    self.adsView=adsView;
    [self addSubview:adsView];
}

-(void)setImageViews:(NSArray *)imageViews
{
    _imageViews = imageViews;
    
    for(int i=0;i<_imageViews.count;i++){
        UIImageView *imageView = self.imageViews[i];
        imageView.tag=i;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(iconClick:)];
        
        [imageView addGestureRecognizer:tap];
    }
    
    self.adsView.imageViews=imageViews;
}

-(void)iconClick:(UITapGestureRecognizer *)tap
{
    UIImageView *view = (UIImageView *)tap.view;
    
    self.block(self.comic_id_array[view.tag]);
}

@end
