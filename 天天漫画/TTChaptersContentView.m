//
//  TTChaptersContentView.m
//  天天漫画
//
//  Created by slihe on 15/5/31.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTChaptersContentView.h"

@interface TTChaptersContentView ()

@property(nonatomic,weak)UIScrollView *scrollView;

@end

@implementation TTChaptersContentView

+ (id)chaptersContentView
{
    return [[self alloc] initWithFrame:CGRectZero];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self createSubViews];
    }
    
    return self;
}

- (void)createSubViews
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    self.scrollView=scrollView;
    [self addSubview:scrollView];
    self.scrollView.pagingEnabled=YES;
    self.scrollView.showsHorizontalScrollIndicator=NO;
}

-(void)setImages:(NSArray *)images
{
    _images = images;
    
    for(int i=0;i<images.count;i++){
        UIImageView *imageView = [[UIImageView alloc] initWithImage:images[i]];
        imageView.contentMode=UIViewContentModeScaleAspectFit;
        
        [self.scrollView addSubview:imageView];
    }
    
    
    [self setNeedsLayout];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.scrollView.frame=self.bounds;
    
    NSArray *images = self.scrollView.subviews;
    
    self.scrollView.contentSize=CGSizeMake(self.frame.size.width*images.count, self.frame.size.height);
    self.scrollView.contentOffset=CGPointMake(self.frame.size.width, 0);
    
    for(int i=0;i<images.count;i++){
        UIImageView *view = images[i];
        
        CGFloat imageW = self.scrollView.frame.size.width;
        CGFloat imageH = self.scrollView.frame.size.height;
        
        view.frame=CGRectMake(imageW*i , 0, imageW, imageH);
    }
}

-(void)willMoveToSuperview:(UIView *)newSuperview
{
    self.frame=newSuperview.bounds;
}

@end
