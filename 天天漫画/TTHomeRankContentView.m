//
//  TTHomeRankContentView.m
//  天天漫画
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTHomeRankContentView.h"
#import "TTHomeRankListModel.h"
#import "TTHomeRankCell.h"
#include "TTHomeRankListModel.h"
#import "TTDefinitionHeader.h"
#import "TTHomeRankCellHeader.h"

@interface TTHomeRankContentView ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,weak)UITableView *tableView;

@property(nonatomic,copy)id comicBlock;

@end

@implementation TTHomeRankContentView

+ (id)homeRankContentView
{
    return [[self alloc] initWithFrame:CGRectZero];
}

+ (id)homeRankContentViewWithComicBlock:(id)comicBlock
{
    return [[self alloc] initWithFrame:CGRectZero andRankBlock:comicBlock];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self createSubViews];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame andRankBlock:(id)block
{
    
    if (self = [super initWithFrame:frame]) {
        
        self.comicBlock=block;
        [self createSubViews];
    }
    
    return self;
    
}

- (void)createSubViews
{
    UITableView *tableView = [[UITableView alloc] init];
    self.tableView=tableView;
    [self addSubview:tableView];
    
    tableView.dataSource=self;
    tableView.delegate=self;
    tableView.separatorStyle = NO;
    
    self.tableView.translatesAutoresizingMaskIntoConstraints=NO;
    
    NSLayoutConstraint *tableTop = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    NSLayoutConstraint *tableLeft = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    NSLayoutConstraint *tableRight = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    
    NSLayoutConstraint *tableBottom = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    [self addConstraints:@[tableTop,tableRight,tableLeft,tableBottom]];
}

-(void)setRankData:(NSArray *)rankData
{
    _rankData=rankData;
    
    [self.tableView reloadData];
}

#pragma 数据源方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.rankData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    TTHomeRankListModel *listModel = self.rankData[section];
    
    return listModel.data.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = nil;
    TTHomeRankListModel *list = self.rankData[indexPath.section];
    
    if (indexPath.row==0) {
        TTHomeRankCellHeader *headerCell = [TTHomeRankCellHeader homeRankCellHeaderWithTableView:tableView];
        
        headerCell.title=list.title;
        headerCell.iconUrl=list.rank_icon_url;
        
        cell=headerCell;
    }
    else
    {
        TTHomeRankCell *rankCell = [TTHomeRankCell homeRankCellWithTableView:tableView];
        
        rankCell.rank = list.data[indexPath.row-1];
        rankCell.block = self.comicBlock;
        
        cell=rankCell;
    }
    
    return cell;
    
}

#pragma 代理方法

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 60*TTScale;
    }
    else
    {
        return 124*TTScale;
    }
}

-(void)didMoveToSuperview
{
    if (self.superview!=nil) {
        self.translatesAutoresizingMaskIntoConstraints=NO;
        
        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
        
        NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
        
        NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
        
        NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
        
        [self.superview addConstraints:@[top,right,left,bottom]];
    }
    
}

@end
