//
//  LHGeneralAdsView.m
//
//
//  Created by qianfeng on 15-4-27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//
/*
    通用广告视图
 */
#import "TTGeneralAdsView.h"
#import "UIView+ViewFrameExt.h"

@interface TTGeneralAdsView ()<UIScrollViewDelegate>

@property(nonatomic,weak)UIScrollView *scrollView;     //广告滚动视图
@property(nonatomic,weak)UIPageControl *pageControl;   //pageControl
@property(nonatomic,strong)NSTimer *timer;             //定时器

@end

@implementation TTGeneralAdsView

+ (id)generalAdsView
{
    return [[self alloc] initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self createSubViews];
    }
    
    return self;
}

-(void)setImageViews:(NSArray *)imageViews
{
    _imageViews=imageViews;
    
    [self setNeedsLayout];
    
    self.timer=[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}

- (void)createSubViews
{
    //创建滚动条
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    self.scrollView = scrollView;
    [self addSubview:scrollView];
    
    scrollView.pagingEnabled=YES;
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.delegate=self;
    
    scrollView.translatesAutoresizingMaskIntoConstraints=NO;
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    [self addConstraints:@[top,left,right,bottom]];
    
    
    //创建pageControl
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    self.pageControl=pageControl;
    [self addSubview:pageControl];
    
    pageControl.pageIndicatorTintColor=[UIColor whiteColor];
    pageControl.currentPageIndicatorTintColor=[UIColor redColor];
    
    pageControl.translatesAutoresizingMaskIntoConstraints=NO;
    
    NSLayoutConstraint *pageCenter = [NSLayoutConstraint constraintWithItem:self.pageControl attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    NSLayoutConstraint *pagebottom = [NSLayoutConstraint constraintWithItem:self.pageControl attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    [self addConstraints:@[pageCenter,pagebottom]];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.scrollView.contentSize=CGSizeMake((self.imageViews.count+2)*self.scrollView.width, self.scrollView.height);
    self.scrollView.contentOffset=CGPointMake(self.scrollView.width, 0);
    
    CGFloat imageW=self.scrollView.width;
    CGFloat imageH=self.scrollView.height;
    
    //为了手动无限轮播,将最后一张图片添加到最开始的位置
    UIImageView *firstView = [[UIImageView alloc] init];
    UIImage *firstImage = [[self.imageViews lastObject] image];
    firstView.image=firstImage;
    
    //设置图片位置
    [self.scrollView addSubview:firstView];
    firstView.frame=CGRectMake(0, 0, imageW, imageH);
    firstView.image=[[self.imageViews lastObject] image];
    
    //将每个UIImageVIew依次添加到scrollView中,
    for(int i=0;i<self.imageViews.count;i++){
        UIImageView *view = self.imageViews[i];
        [self.scrollView addSubview:view];
        view.frame=CGRectMake((i+1)*imageW, 0, imageW, imageH);
    }
    
    //为了手动无限轮播,将第一张图片的视图添加到最后的位置
    UIImageView *lastView = [[UIImageView alloc] init];
    UIImage *lastImage = [[self.imageViews firstObject] image];
    lastView.image=lastImage;
    
    [self.scrollView addSubview:lastView];
    lastView.frame=CGRectMake((self.imageViews.count+1)*imageW, 0, imageW, imageH);
    lastView.image=[[self.imageViews firstObject] image];
    
    
    
    //设置pageControls位置
    self.pageControl.numberOfPages=self.imageViews.count;
    self.pageControl.currentPage=0;
    
}

-(void)didMoveToSuperview
{
    self.translatesAutoresizingMaskIntoConstraints=NO;
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    [self.superview addConstraints:@[top,left,right,bottom]];
}

- (void)autoScroll
{
    NSInteger page = self.pageControl.currentPage;
    
    if(page==self.imageViews.count-1){
        page=0;
    }else{
        page++;
    }
    
    self.pageControl.currentPage=page;
    self.scrollView.contentOffset = CGPointMake((page+1)*self.scrollView.width, 0);
    
}

#pragma mark scrollView

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offSet = scrollView.contentOffset.x;
    CGFloat scrollW = scrollView.width;
    NSInteger page = (offSet-scrollW + 0.5*scrollW)/scrollW;
    
    if(offSet<=0.5*scrollW){
        page=self.imageViews.count-1;
    }else if(offSet>=(self.imageViews.count+0.5)*scrollW){
        page=0;
    }
    
    self.pageControl.currentPage=page;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.timer invalidate];
    self.timer=nil;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat offSet = scrollView.contentOffset.x;
    if(offSet==0){
        scrollView.contentOffset=CGPointMake(self.imageViews.count*scrollView.width, 0);
    }else if (offSet==(self.imageViews.count+1)*scrollView.width){
        scrollView.contentOffset=CGPointMake(scrollView.width, 0);
    }
}

@end
