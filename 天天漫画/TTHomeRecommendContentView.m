//
//  TTHomeRecommendContentView.m
//  天天漫画
//
//  Created by qianfeng on 15-5-25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTHomeRecommendContentView.h"
#import "TTHomeRecommendLimitFreeCell.h"
#import "TTHomeRecommendCell.h"
#import "TTDefinitionHeader.h"
#import "TTHomeRecommendItemList.h"
#import "TTHomeRecommendLimitFreeList.h"
#import "TTGeneralAdsView.h"
#import "TTHomeRecommendAdList.h"
#import "TTHomeRecommendAd.h"
#import "UIImageView+AFNetworking.h"
#import "TTHomeRecommendAdsCell.h"
#import "TTHomeRecommendJapanCell.h"
#import "TTHomeRecommendSectionHeader.h"

enum TTHomeRecommendType{
    TTHomeRecommendTypeAds,  //广告轮播
    THomeRecommendTypeFree,   //限免
    TTHomeRecommendTypeRecommend, //推荐
    TTHomeRecommendTypeNew,   //新作
    THomeRecommendTypeUpdate, //更新
    THomeRecommendTypeBoy,    //少年
    THomeRecommendTypeGirl,   //少女
    THomeRecommendTypeJapan,  //日漫
    THomeRecommendTypeTerror, //恐怖
    THomeRecommendTypeMagic,  //魔幻
    THomeRecommendTypeHumor,  //搞笑
    THomeRecommendTypeHot     //热血
};

@interface TTHomeRecommendContentView ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,weak)TTGeneralAdsView *adsView;
@property(nonatomic,weak)UICollectionView *collectionView;
@property(nonatomic,strong)NSArray *adsData;
@property(nonatomic,strong)NSArray *ads_comic_id_array;

@property(nonatomic,copy)id comicBlock;
@property(nonatomic,copy)id classifyBlock;

@end

@implementation TTHomeRecommendContentView

+ (id)homeRecommendContentView
{
    return [[self alloc] initWithFrame:CGRectZero];
}

+ (id)homeRecommendContentViewWithComicBlock:(id)comicBlock andclassifyBlock:(id)classifyBlock
{
    return [[self alloc] initWithFrame:CGRectZero andComicBlock:comicBlock andclassifyBlock:classifyBlock];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame andComicBlock:nil andclassifyBlock:nil];
}

-(instancetype)initWithFrame:(CGRect)frame andComicBlock:(id)comicBlock andclassifyBlock:(id)classifyBlock
{
    if (self = [super initWithFrame:frame]) {
        
        self.comicBlock=comicBlock;
        self.classifyBlock=classifyBlock;
        
        [self createSubViews];
        
    }
    
    return self;
}

- (void)createSubViews
{
    //collectionVIew
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
    
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    [self addConstraints:@[top, left, right, bottom]];
    
    [self registerCells];
    
    
}

- (void)registerCells
{
    [self.collectionView registerNib:[UINib nibWithNibName:@"TTHomeRecommendLimitFreeCell" bundle:nil]  forCellWithReuseIdentifier:@"limitFreeCell"];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"TTHomeRecommendCell" bundle:nil] forCellWithReuseIdentifier:@"recommendCell"];
    
    [self.collectionView registerClass:[TTHomeRecommendAdsCell class] forCellWithReuseIdentifier:@"adsCell"];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"TTHomeRecommendJapanCell" bundle:nil] forCellWithReuseIdentifier:@"japanCell"];
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"TTHomeRecommendSectionHeader" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionheader"];
    
}

-(void)setCollectionData:(NSArray *)collectionData
{
    _collectionData=collectionData;
    
    TTHomeRecommendAdList *adList = collectionData[TTHomeRecommendTypeAds];
    
    [self setAdsData: [adList data]];
    
    [self.collectionView reloadData];
}

-(void)setAdsData:(NSArray *)adsData
{
    _adsData=adsData;
    NSMutableArray *array = [NSMutableArray array];
    NSMutableArray *comic_id_array = [NSMutableArray array];
    for(int i=0;i<adsData.count;i++){
        TTHomeRecommendAd *ad = adsData[i];
        
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView setImageWithURL:[NSURL URLWithString:ad.banner_url] placeholderImage:nil];
        imageView.userInteractionEnabled=YES;
        
        [array addObject:imageView];
        [comic_id_array addObject:[NSString stringWithFormat:@"%ld", ad.comic_id]];
    }
    
    _ads_comic_id_array = comic_id_array;
    _adsData = array;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
}

#pragma collection数据源方法

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.collectionData.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    if (section==THomeRecommendTypeFree || section==TTHomeRecommendTypeAds) {
        return 1;
    }
    
    TTHomeRecommendItemList *list = _collectionData[section];
    return list.data.count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = nil;

    if (indexPath.section==THomeRecommendTypeFree) {
        
        TTHomeRecommendLimitFreeCell *freeCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"limitFreeCell" forIndexPath:indexPath];
        
        TTHomeRecommendLimitFreeList * list = self.collectionData[indexPath.section];
        
        freeCell.free=list.data;
        freeCell.block=self.comicBlock;
        
        cell = freeCell;
        
    }
    else if(indexPath.section==TTHomeRecommendTypeAds){
        
        TTHomeRecommendAdsCell *adsCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"adsCell" forIndexPath:indexPath];
        
        adsCell.imageViews=self.adsData;
        adsCell.comic_id_array=_ads_comic_id_array;
        adsCell.block=self.comicBlock;
        
        cell=adsCell;
        
    }
    else if (indexPath.section==THomeRecommendTypeJapan){
        TTHomeRecommendJapanCell *japanCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"japanCell" forIndexPath:indexPath];
        
        TTHomeRecommendItemList *list = self.collectionData[indexPath.section];
        japanCell.item=list.data[indexPath.row];
        japanCell.block = self.comicBlock;
        
        cell = japanCell;
        
    }
    else
    {
        TTHomeRecommendCell *recommendCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"recommendCell" forIndexPath:indexPath];
        
        TTHomeRecommendItemList *list = self.collectionData[indexPath.section];
        recommendCell.item=list.data[indexPath.row];
        recommendCell.block=self.comicBlock;
        cell = recommendCell;
    }
    
    return cell;
}

#pragma -mark 布局方法

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize size;
    if (indexPath.section==THomeRecommendTypeFree) {
        
        size = CGSizeMake(345*TTScale, 165*TTScale);
        
    }
    else if (indexPath.section==TTHomeRecommendTypeAds){
        size = CGSizeMake(self.frame.size.width, 150*TTScale);
    }
    else if (indexPath.section==THomeRecommendTypeJapan){
        size = CGSizeMake(70*TTScale, 120*TTScale);
    }
    else{
        size = CGSizeMake(165*TTScale, 125*TTScale);
    }
    
    return size;
}

// 定义section的边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section==TTHomeRecommendTypeAds) {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }else if(section==THomeRecommendTypeFree){
        return UIEdgeInsetsMake(15*TTScale, 0, 0, 0);
    }
    
    return UIEdgeInsetsMake(0, 15*TTScale, 0, 15*TTScale);
}

// 定义上下cell的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 17*TTScale;
}

// 定义左右cell的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    if (section==THomeRecommendTypeJapan) {
        return 15;
    }
    
    return 10;
}

// 定义headview的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if(section==TTHomeRecommendTypeAds || section==THomeRecommendTypeFree){
        return CGSizeMake(0, 0);
    }
    
    return CGSizeMake(self.frame.size.width, 50*TTScale);
}

//设置section头部
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *headView = nil;
    
    if([UICollectionElementKindSectionHeader isEqualToString:kind]){
        
        TTHomeRecommendSectionHeader *sectionHead = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionheader" forIndexPath:indexPath];
        
        headView=sectionHead;
        
        if (indexPath.section!=TTHomeRecommendTypeAds) {
            TTHomeRecommendItemList *list = self.collectionData[indexPath.section];
            sectionHead.title=list.title;
            sectionHead.block=self.classifyBlock;
        }
    }
    
    return headView;
    
}

-(void)didMoveToSuperview
{
    if (self.superview!=nil) {
        self.translatesAutoresizingMaskIntoConstraints=NO;
        
        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
        
        NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
        
        NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
        
        NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
        
        [self.superview addConstraints:@[top, left, right, bottom]];
    }
    
}

@end
