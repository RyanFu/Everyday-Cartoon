//
//  TTHomeUpdateContentView.m
//  天天漫画
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTHomeUpdateContentView.h"
#import "TTHomeUpdateCell.h"
#import "TTDefinitionHeader.h"
#import "TTHomeUpdateHeadCell.h"
#import "TTDefinitionHeader.h"

enum TTHomeUpdateContentViewWeekday{
    TTHomeUpdateContentViewMonday,
    TTHomeUpdateContentViewTuesday,
    TTHomeUpdateContentViewWednesday,
    TTHomeUpdateContentViewThursday,
    TTHomeUpdateContentViewFriday,
    TTHomeUpdateContentViewSaturday,
    TTHomeUpdateContentViewSunday,
};

@interface TTHomeUpdateContentView ()<UITableViewDataSource,UITableViewDelegate,TTHomeUpdateHeadCellTouchDelegate>

@property(nonatomic,weak)UITableView *tableView;

@property(nonatomic,strong)NSArray *daysIcon;

@property(nonatomic,strong)NSArray *days;

@property(nonatomic,strong)NSMutableArray *states;

@property(nonatomic,strong)NSMutableArray *backupData;

@property(nonatomic,copy)id updateBlock;

@end

@implementation TTHomeUpdateContentView

+ (id)homeUpdateContentView
{
    return [[self alloc] initWithFrame:CGRectZero];
}

+ (id)homeUpdateContentViewWithUpdateBlock:(id)block
{
    return [[self alloc] initWithFrame:CGRectZero andUpdateBlock:block];
}

- (id)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self createSubViews];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame andUpdateBlock:(id)block
{
    if (self=[super initWithFrame:frame]) {
        
        self.updateBlock=block;
        [self createSubViews];
    }
    
    return self;
}

- (void)createSubViews
{
    
    UITableView *tableView = [[UITableView alloc] init];
    self.tableView=tableView;
    [self addSubview:tableView];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.showsVerticalScrollIndicator=NO;
    tableView.backgroundColor=[UIColor whiteColor];
    tableView.separatorStyle = NO;
    
    self.tableView.translatesAutoresizingMaskIntoConstraints=NO;
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    [self addConstraints:@[top, left, right, bottom]];
    
}

-(void)setDataArray:(NSMutableArray *)dataArray
{
    _dataArray=dataArray;
    
    NSMutableArray *backArray = [NSMutableArray array];
    
    for(NSArray *array in dataArray){
        NSMutableArray *backarr = [NSMutableArray array];
        
        for(id obj in array){
            [backarr addObject:obj];
        }
        
        [backArray addObject:backarr];
    }
    
    _backupData=backArray;
    
    [self.tableView reloadData];
    
    CGFloat offSet = 0.0;
    
    for(int i=0;i<self.current_index;i++){
        NSArray *array = self.dataArray[i];
        
        NSInteger number = array.count/3;
        
        if (array.count%3!=0) {
            number++;
        }
        
        offSet+=number*187*TTScale;
        offSet+=46*TTScale;
    }
    
    self.tableView.contentOffset=CGPointMake(0, offSet);
}

-(NSArray *)daysIcon
{
    if (_daysIcon==nil) {
        NSMutableArray *daysIcon = [NSMutableArray array];
        
        [daysIcon addObject:@"icon_monday"];
        [daysIcon addObject:@"icon_tuesday"];
        [daysIcon addObject:@"icon_wednesday"];
        [daysIcon addObject:@"icon_thursday"];
        [daysIcon addObject:@"icon_friday"];
        [daysIcon addObject:@"icon_saturday"];
        [daysIcon addObject:@"icon_sunday"];
        
        _daysIcon=daysIcon;
    }
    
    return _daysIcon;
}

-(NSArray *)days
{
    if (_days==nil) {
        NSMutableArray *days = [NSMutableArray array];
        
        [days addObject:@"星期一"];
        [days addObject:@"星期二"];
        [days addObject:@"星期三"];
        [days addObject:@"星期四"];
        [days addObject:@"星期五"];
        [days addObject:@"星期六"];
        [days addObject:@"星期日"];
        
        _days=days;
    }
    
    return _days;
}

-(NSArray *)states
{
    if (nil ==_states) {
        NSMutableArray *array = [NSMutableArray array];
        
        for(int i=0;i<7;i++){
            [array addObject:[NSNumber numberWithBool:YES]];
        }
        
        _states=array;
    }
    
    return _states;
    
}


#pragma 数据源方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = self.dataArray[section];
    
    NSInteger number = array.count/3;
    
    if (array.count%3!=0) {
        number++;
    }
    
    return number+1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    NSArray *data = self.dataArray[indexPath.section];
    
    if (indexPath.row==0) {
        TTHomeUpdateHeadCell *headerCell = [TTHomeUpdateHeadCell homeUpdateHeadCellWithTableView:tableView];
        
        headerCell.day=self.days[indexPath.section];
        headerCell.leftImageName=self.daysIcon[indexPath.section];
        
        NSNumber *state = self.states[indexPath.section];
        NSNumber *frontState = nil;
        
        if (indexPath.section==TTHomeUpdateContentViewMonday) {
            frontState = [NSNumber numberWithBool:NO];
        }else{
            frontState = self.states[indexPath.section-1];
        }
        
        if ([state boolValue]==YES) {
            headerCell.openImageName=@"icon_day_opened";
            [headerCell hidLeftTopLine:![frontState boolValue] andHidLeftBottomLine:![state boolValue] andUnderLine:[state boolValue]];
        }else{
            headerCell.openImageName=@"icon_day_closed";
            [headerCell hidLeftTopLine:![state boolValue] andHidLeftBottomLine:![state boolValue] andUnderLine:[state boolValue]];
        }
        
        headerCell.indexPath=indexPath;
        headerCell.delegate=self;
        
        cell=headerCell;
        
    }else{
        TTHomeUpdateCell *updateCell = [TTHomeUpdateCell homeUpdateCellWithTableView:tableView];
        
        NSInteger count = 3*(indexPath.row-1);
        
        updateCell.leftModel=data[count];
        
        if (count+1<=data.count-1) {
            updateCell.midModel=data[count+1];
        }else{
            updateCell.midModel=nil;
        }
        
        if (count+2<=data.count-1) {
            updateCell.rightModel=data[count+2];
        }else{
            updateCell.rightModel=nil;
        }
        
        updateCell.block=self.updateBlock;
        
        cell=updateCell;
        
    }
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}


#pragma headCell 代理方法
-(void)homeUpdateHeadCellTouchDelegateWithCell:(TTHomeUpdateHeadCell *)cell
{
    NSIndexPath *indexPath = cell.indexPath;
    
    if(indexPath.row==0){
        NSNumber *state = self.states[indexPath.section];
        if([state boolValue]==YES){
            NSNumber *newState = [NSNumber numberWithBool:NO];
            _states[indexPath.section]=newState;
            
            [_dataArray[indexPath.section] removeAllObjects];
        }else{
            NSNumber *newState = [NSNumber numberWithBool:YES];
            _states[indexPath.section]=newState;
            
            [_dataArray[indexPath.section] addObjectsFromArray:_backupData[indexPath.section]];
        }
        
        [self.tableView reloadData];
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 46*TTScale;
    }
    
    return 187*TTScale;
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
