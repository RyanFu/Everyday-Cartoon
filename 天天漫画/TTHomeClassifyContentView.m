//
//  TTHomeClassifyContentView.m
//  天天漫画
//
//  Created by qianfeng on 15-5-26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTHomeClassifyContentView.h"
#import "TTHomeClassifyCell.h"
#import "TTDefinitionHeader.h"

@interface TTHomeClassifyContentView ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,weak)UICollectionView *collectionView;
@property(nonatomic,copy)id classifyBlock;

@end

@implementation TTHomeClassifyContentView

+ (id)homeClassifyContentView
{
    return [[self alloc] initWithFrame:CGRectZero];
}

+ (id)homeClassifyContentViewWithClassifyBlock:(id)block
{
    
    return [[self alloc] initWithFrame:CGRectZero andClassifyBlock:block];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    
    return [self initWithFrame:frame andClassifyBlock:nil];
    
}

- (instancetype)initWithFrame:(CGRect)frame andClassifyBlock:(id)block
{
    
    if (self = [super initWithFrame:frame]) {
        
        self.classifyBlock=block;
        [self createSubViews];
    }
    
    return self;
    
}

- (void)createSubViews
{
    UICollectionViewFlowLayout *layout= [[UICollectionViewFlowLayout alloc] init];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView=collectionView;
    [self addSubview:collectionView];
    collectionView.delegate=self;
    collectionView.dataSource=self;
    collectionView.showsVerticalScrollIndicator=NO;
    collectionView.backgroundColor=[UIColor whiteColor];
    
    self.collectionView.translatesAutoresizingMaskIntoConstraints=NO;
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.collectionView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.collectionView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    [self addConstraints:@[top, left, right, bottom]];
    [self registerCells];
}

- (void)registerCells
{
    [self.collectionView registerNib:[UINib nibWithNibName:@"TTHomeClassifyCell" bundle:nil] forCellWithReuseIdentifier:@"classifyCell"];
    
}

-(void)setClassifyData:(NSArray *)classifyData
{
    _classifyData=classifyData;
    
    [self.collectionView reloadData];
}

#pragma collection数据源方法

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.classifyData.count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = nil;
    TTHomeClassifyCell *classifyCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"classifyCell" forIndexPath:indexPath];
    
    classifyCell.classify=self.classifyData[indexPath.row];
    
    classifyCell.block=self.classifyBlock;
    
    cell=classifyCell;
    
    return cell;
}

#pragma -mark 布局方法

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize size = CGSizeMake(100*TTScale, 107*TTScale);
    
    return size;
}

// 定义section的边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(30*TTScale, 15*TTScale, 0, 15*TTScale);
}

// 定义上下cell的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 40*TTScale;
}

// 定义左右cell的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 15;
}

-(void)didMoveToSuperview
{
    if (self.superview!=nil) {
        
        self.translatesAutoresizingMaskIntoConstraints=NO;
        
        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
        
        NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
        
        NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.superview attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
        
        NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.superview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
        
        [self.superview addConstraints:@[top, left, right, bottom]];
    }
    
}

#pragma scrollView 代理

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    if (scrollView.contentOffset.y<=0) {
        
        scrollView.contentOffset = CGPointMake(0, 0);
        
    }else if(scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.bounds.size.height)){
        
        scrollView.contentOffset = CGPointMake(0, (scrollView.contentSize.height - scrollView.bounds.size.height));
    }
}

@end
