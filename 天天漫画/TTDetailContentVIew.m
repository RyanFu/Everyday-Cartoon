//
//  TTDetailContentVIew.m
//  天天漫画
//
//  Created by qianfeng on 15-5-28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTDetailContentVIew.h"
#import "TTDetailChapterCell.h"
#import "TTDetailChapter.h"
#import "TTDefinitionHeader.h"
#import "TTDetailManHuaView.h"
#import "TTDetailManHuaIntroView.h"
#import "TTDetailManHuaLastupView.h"
#import "TTDetailChapterHeader.h"

@interface TTDetailContentVIew ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,TTDetailManHuaIntroViewProtocol,TTDetailChapterHeaderProtocol>

@property(nonatomic,weak)UICollectionView *collectionView;
@property(nonatomic,weak)TTDetailManHuaView *manhuaView;
@property(nonatomic,weak)TTDetailManHuaIntroView *introView;
@property(nonatomic,weak)TTDetailManHuaLastupView *lastupView;

@property(nonatomic,weak)NSLayoutConstraint *manhuatop;
@property(nonatomic,assign)BOOL chaptersOrder;

@end

@implementation TTDetailContentVIew

+ (id)detailContentVIew
{
    return [[self alloc] initWithFrame:CGRectZero];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.chaptersOrder=YES;
        [self createSubViews];
    }
    
    return self;
}

- (void)createSubViews
{
    
    //CollectionView
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
    
    //manhuaView
    TTDetailManHuaView *manHua = [TTDetailManHuaView detailManHuaView];
    CGFloat manhuaHeight = 206*TTScale;
    self.manhuaView=manHua;
    
    //introView
    TTDetailManHuaIntroView *intro = [TTDetailManHuaIntroView detailManHuaIntroView];
    CGFloat introHeight = 80*TTScale;
    self.introView=intro;
    self.introView.delegate=self;
    intro.translatesAutoresizingMaskIntoConstraints=NO;
    
    //lastupView
    TTDetailManHuaLastupView *lastup = [TTDetailManHuaLastupView detailManHuaLastupView];
    CGFloat lastupHeight = 55*TTScale;
    self.lastupView=lastup;
    lastup.translatesAutoresizingMaskIntoConstraints=NO;
    
    
    self.collectionView.contentInset = UIEdgeInsetsMake(manhuaHeight + introHeight + lastupHeight, 0, 0, 0);
    
    //collectionSubViews
    [self.collectionView addSubview:manHua];
    manHua.translatesAutoresizingMaskIntoConstraints=NO;
    
    NSLayoutConstraint *manhuatop = [NSLayoutConstraint constraintWithItem:manHua attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.collectionView attribute:NSLayoutAttributeTop multiplier:1.0 constant:-(manhuaHeight + introHeight + lastupHeight)];
    
    self.manhuatop=manhuatop;
    
    NSLayoutConstraint *manhualeft = [NSLayoutConstraint constraintWithItem:manHua attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.collectionView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    NSLayoutConstraint *manhuaWidth = [NSLayoutConstraint constraintWithItem:manHua attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:[UIScreen mainScreen].bounds.size.width];
    
    NSLayoutConstraint *manhuaheight = [NSLayoutConstraint constraintWithItem:manHua attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:manhuaHeight];
    
    [self.collectionView addConstraints:@[manhuatop,manhualeft]];
    [manHua addConstraints:@[manhuaheight,manhuaWidth]];
    //-----------------------
    
    [self.collectionView addSubview:intro];
    
    NSLayoutConstraint *introtop = [NSLayoutConstraint constraintWithItem:intro attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:manHua attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    NSLayoutConstraint *introleft = [NSLayoutConstraint constraintWithItem:intro attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:manHua attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    NSLayoutConstraint *introright = [NSLayoutConstraint constraintWithItem:intro attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:manHua attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    
    NSLayoutConstraint *introheight = [NSLayoutConstraint constraintWithItem:intro attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:introHeight];
    
    [self.collectionView addConstraints:@[introtop,introleft,introright]];
    [intro addConstraint:introheight];
    intro.heightConstraint=introheight;
    //--------------------------
    
    [self.collectionView addSubview:lastup];
    
    NSLayoutConstraint *lastuptop = [NSLayoutConstraint constraintWithItem:lastup attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:intro attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    NSLayoutConstraint *lastupleft = [NSLayoutConstraint constraintWithItem:lastup attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:manHua attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    NSLayoutConstraint *lastupright = [NSLayoutConstraint constraintWithItem:lastup attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:manHua attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    
    NSLayoutConstraint *lastupheight = [NSLayoutConstraint constraintWithItem:lastup attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:lastupHeight];
    
    [self.collectionView addConstraints:@[lastuptop,lastupleft,lastupright]];
    [lastup addConstraint:lastupheight];
    
}

-(void)setDetailManHua:(TTDetailManHua *)detailManHua
{
    _detailManHua = detailManHua;
    
    self.manhuaView.manhua=detailManHua;
    self.introView.intro=detailManHua.brief_intrd;
    
    self.lastupView.lastupBtnStr=detailManHua.lated_seqno;
    self.lastupView.lastupDateStr=detailManHua.update_date;
    
    [self.collectionView reloadData];
}

- (void)registerCells
{
    [self.collectionView registerNib:[UINib nibWithNibName:@"TTDetailChapterCell" bundle:nil] forCellWithReuseIdentifier:@"chapterCell"];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"TTDetailChapterHeader" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"chapterHeader"];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.detailManHua.chapters.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TTDetailChapterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"chapterCell" forIndexPath:indexPath];
    
    NSInteger chapterCount = self.detailManHua.chapters.count;
    
    TTDetailChapter *chapter = nil;
    if (self.chaptersOrder==YES) {
        chapter = self.detailManHua.chapters[chapterCount - indexPath.row -1];
    }
    else
    {
        chapter = self.detailManHua.chapters[indexPath.row];
    }
    
    cell.chapter=chapter;
    
    UIView *bgView = [[UIView alloc] initWithFrame:cell.bounds];
    bgView.backgroundColor=[UIColor lightGrayColor];
    
    cell.selectedBackgroundView=bgView;
    
    return cell;
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    TTDetailChapterHeader *headerview=nil;
    if([UICollectionElementKindSectionHeader isEqualToString:kind]){
        headerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"chapterHeader" forIndexPath:indexPath];
        headerview.delegate=self;
    }
    
    return headerview;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TTDetailChapter *chapter = nil;
    
    if (self.chaptersOrder==YES) {
        chapter = self.detailManHua.chapters[self.detailManHua.chapters.count - indexPath.row -1];
    }
    else
    {
        chapter = self.detailManHua.chapters[indexPath.row];
    }
    
    [self.delegate gotoChapter:self.detailManHua.comic_id andCid:chapter.cid];
}

#pragma -mark 布局方法

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize size = CGSizeMake(75*TTScale, 35*TTScale);
    
    return size;
}

// 定义section的边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, 18*TTScale, 18*TTScale, 18*TTScale);
}

// 定义上下cell的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 20*TTScale;
}

// 定义左右cell的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 10;
}

// 定义headview的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(self.collectionView.frame.size.width, 50*TTScale);
}

#pragma updateContentView

-(void)updateContentView:(TTDetailManHuaIntroView *)introView withOffSet:(CGFloat)offset
{
    UIEdgeInsets inset = self.collectionView.contentInset;
    CGPoint contentOffset = self.collectionView.contentOffset;
    
    CGFloat curOffset = contentOffset.y + inset.top;
    
    inset.top+=offset;
    
    self.collectionView.contentInset=inset;
    
    self.collectionView.contentOffset=CGPointMake(0, -inset.top + curOffset);
    
    self.manhuatop.constant-=offset;

}

#pragma updateOrder

-(void)updateChaptersOrder:(TTDetailChapterHeader *)header andOrder:(BOOL)order
{
    self.chaptersOrder=order;
    
    [self.collectionView reloadData];
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
