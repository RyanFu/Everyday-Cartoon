//
//  TTClassifyDetailContentView.m
//  天天漫画
//
//  Created by qianfeng on 15-5-30.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTClassifyDetailContentView.h"
#import "TTClassifyDetailCell.h"
#import "TTDefinitionHeader.h"

@interface TTClassifyDetailContentView ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,weak)UITableView *tableView;

@property(nonatomic,copy)id comicBlock;

@end

@implementation TTClassifyDetailContentView

+ (id)classifyDetailContentView
{
    return [[self alloc] initWithFrame:CGRectZero];
}

+ (id)classifyDetailContentViewWithComicBlock:(id)comicBlock
{
    return [[self alloc] initWithFrame:CGRectZero withComicBlock:comicBlock];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self createSubViews];
    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame withComicBlock:(id)block
{
    if (self=[super initWithFrame:frame]) {
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
    tableView.rowHeight=124*TTScale;
    
    self.tableView.translatesAutoresizingMaskIntoConstraints=NO;
    
    NSLayoutConstraint *tableTop = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    NSLayoutConstraint *tableLeft = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    NSLayoutConstraint *tableRight = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.tableView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    
    NSLayoutConstraint *tableBottom = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.tableView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    [self addConstraints:@[tableTop,tableRight,tableLeft,tableBottom]];
}

-(void)setClassifyData:(NSArray *)classifyData
{
    _classifyData=classifyData;
    
    [self.tableView reloadData];
}

#pragma 数据源方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.classifyData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = nil;
    
    TTClassifyDetailCell *detailCell = [TTClassifyDetailCell classifyDetailCellWithTableView:tableView];
    
    detailCell.classifyDetail = self.classifyData[indexPath.row];
    detailCell.block=self.comicBlock;
    
    cell= detailCell;
    
    return cell;
    
}

-(void)didMoveToSuperview
{
    if(self.superview!=nil){
        self.translatesAutoresizingMaskIntoConstraints=NO;
        
        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:1];
        
        NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:1];
        
        NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.superview attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:1];
        
        NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.superview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:1];
        
        [self.superview addConstraints:@[top,right,left,bottom]];
    }
    
}

@end
