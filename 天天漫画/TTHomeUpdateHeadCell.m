//
//  TTHomeUpdateHeadCell.m
//  天天漫画
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTHomeUpdateHeadCell.h"
#import "TTDefinitionHeader.h"

@interface TTHomeUpdateHeadCell ()

//Contrains


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineLeft;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftImageWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dayLabLeft;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dayLabWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightImageRight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightImageWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *underLineWidth;



//Views
@property (weak, nonatomic) IBOutlet UIImageView *leftImage;

@property (weak, nonatomic) IBOutlet UILabel *typeLab;

@property (weak, nonatomic) IBOutlet UIImageView *rightImage;

@property (weak, nonatomic) IBOutlet UIView *underLine;

@property (weak, nonatomic) IBOutlet UIView *leftTopLine;

@property (weak, nonatomic) IBOutlet UIView *leftBottomLine;



@end

@implementation TTHomeUpdateHeadCell

+ (id)homeUpdateHeadCellWithTableView:(UITableView *)tableView
{
    static NSString *headCellID = @"updateHeadCell";
    
    TTHomeUpdateHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:headCellID];
    
    if (cell==nil) {
        UINib *nib = [UINib nibWithNibName:@"TTHomeUpdateHeadCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:headCellID];
        cell=[[nib instantiateWithOwner:nil options:nil] lastObject];
    }
    
    return cell;
}

- (void)awakeFromNib {
    
    self.lineLeft.constant*=TTScale;
    self.leftImageWidth.constant*=TTScale;
    self.dayLabLeft.constant*=TTScale;
    self.dayLabWidth.constant*=TTScale;
    self.rightImageRight.constant*=TTScale;
    self.rightImageWidth.constant*=TTScale;
    self.underLineWidth.constant*=TTScale;
}

-(void)setLeftImageName:(NSString *)leftImageName
{
    _leftImageName=leftImageName;
    
    self.leftImage.image=[UIImage imageNamed:leftImageName];
}

-(void)setDay:(NSString *)day
{
    _day=day;
    
    self.typeLab.text=day;
}

-(void)setOpenImageName:(NSString *)openImageName
{
    _openImageName=openImageName;
    
    self.rightImage.image=[UIImage imageNamed:openImageName];
}

- (void)hidLeftTopLine:(BOOL)topLine andHidLeftBottomLine:(BOOL)bottomLine andUnderLine:(BOOL)underLine
{
    self.leftTopLine.hidden=topLine;
    self.leftBottomLine.hidden=bottomLine;
    self.underLine.hidden=underLine;
}

//事件方法
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.contentView.backgroundColor=[UIColor groupTableViewBackgroundColor];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.contentView.backgroundColor=[UIColor whiteColor];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.contentView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    
    [[self delegate] homeUpdateHeadCellTouchDelegateWithCell:self];
    
    self.contentView.backgroundColor=[UIColor whiteColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
