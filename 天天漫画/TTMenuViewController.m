//
//  MenuViewController.m
//  ShouGongKe
//
//  Created by qianfeng on 15/4/23.
//  Copyright (c) 2015年 ZYF. All rights reserved.
//

#import "TTMenuViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
//menu button tag值
#define BUTTON_TAG 100

//menu button 前景色
#define menuButton_bf_Color [UIColor redColor]

@interface TTMenuViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong) NSArray *titleArray;
@property(nonatomic, strong)NSArray *vcArray;

@end

@implementation TTMenuViewController
{
    UIView * _scrollbuttonBackView;
    UIScrollView * _headerScrollView;
    UICollectionView * _collectionView;
}

#pragma mark init

-(id)initWithFrame:(CGRect)frame titles:(NSArray*)titleArray vcArray:(NSArray *)vcArray
{

    
    self = [super init];
        self.view.frame = frame;
    if(self)
    {
        self.titleArray = titleArray;
        self.vcArray = vcArray;
        [self setMenuBar];
        [self setCollectionView];
    }
    return self;
}
-(id)initViewControllerWithTitleArray:(NSArray *)titleArray vcArray:(NSArray*)vcArray
{
    self = [super init];
    if(self)
    {
        self.titleArray = titleArray;
        self.vcArray = vcArray;
        [self setMenuBar];
        [self setCollectionView];
    }
    return self;
}

#pragma mark 生命周期
- (void)viewDidLoad {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.edgesForExtendedLayout=UIRectEdgeNone;
    
    self.view.frame=CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64);
    
    [super viewDidLoad];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

#pragma mark UI

-(void)setMenuBar
{
    _headerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    _headerScrollView.contentSize = _headerScrollView.frame.size;
    _headerScrollView.pagingEnabled = NO;
    _headerScrollView.bounces = NO;
    _headerScrollView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_headerScrollView];
    
    CGFloat width = self.view.frame.size.width / self.titleArray.count;
    int i = 0;
    for (NSString *title in self.titleArray) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i *width, 0, width, CGRectGetHeight(_headerScrollView.frame))];
        [button setTitle:title forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:15.0];
        
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];
        button.tag = BUTTON_TAG + i;
        [button addTarget:self action:@selector(setSelectedButton:) forControlEvents:UIControlEventTouchUpInside];
        [_headerScrollView addSubview:button];
        
        if (i==0) {
            button.selected=YES;
        }
        i++;
    }
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, _headerScrollView.frame.size.height-1, _headerScrollView.frame.size.width, _headerScrollView.frame.size.height)];
    lineView.backgroundColor=[UIColor lightGrayColor];
    
    [_headerScrollView addSubview:lineView];
    
    [self createMenuButtonForeground];
    
}

-(void)createMenuButtonForeground
{
    UIButton *button = (UIButton*)[_headerScrollView viewWithTag:BUTTON_TAG];
    
    _scrollbuttonBackView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(button.frame) - 5, CGRectGetWidth(button.frame), 4)];
    
    _scrollbuttonBackView.backgroundColor = menuButton_bf_Color;
    [_headerScrollView addSubview:_scrollbuttonBackView];
}

-(void)setupMenuButtonForeground:(UIButton*)button
{
    CGRect frame = CGRectMake(CGRectGetMinX(button.frame), CGRectGetMaxY(button.frame) - 5, CGRectGetWidth(button.frame), 4);
    _scrollbuttonBackView.frame = frame;
}

-(void)setSelectedButton:(UIButton *)button
{
    [button setSelected:YES];
    NSArray *subArray = _headerScrollView.subviews;
    for (UIButton *subbutton  in subArray) {
        if ([subbutton isKindOfClass:[UIButton class]]) {
            if (subbutton != button) {
                [subbutton setSelected:NO];
            }
        }
        
    }
    
    [self setupMenuButtonForeground:button];

    [_collectionView setContentOffset:CGPointMake((button.tag - 100)* CGRectGetWidth(self.view.frame), 0) animated:YES];
}

-(void)setCollectionView
{
    CGRect frame = CGRectMake(0, CGRectGetMaxY(_headerScrollView.frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetHeight(_headerScrollView.frame));
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    //设置滑动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //设置item size
    flowLayout.itemSize = frame.size;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
    //设置是否页面滚动效果
    _collectionView.pagingEnabled = YES;
    _collectionView.bounces = NO;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
}

#pragma mark CollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UIViewController *vc = self.vcArray[indexPath.item];
     [self addChildViewController:vc];
    vc.view.frame = cell.contentView.bounds;
    
    [cell.contentView addSubview:vc.view];
//    [vc didMoveToParentViewController:self];
   
    return cell;
}


#pragma mark scrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    NSInteger index = (NSInteger)floor((point.x / self.view.frame.size.width));
    UIButton *button = (UIButton*)[_headerScrollView viewWithTag:BUTTON_TAG + index];
    if (self.delegate != nil && [self.delegate conformsToProtocol:NSProtocolFromString(@"MenuViewControllerDelegate")]) {
        [self.delegate menuViewController:self currentPageChanged:index];
    }
    
    [self setSelectedButton:button];
}


@end
