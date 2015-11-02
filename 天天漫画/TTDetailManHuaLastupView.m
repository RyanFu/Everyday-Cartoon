//
//  TTDetailManHuaLastupView.m
//  天天漫画
//
//  Created by qianfeng on 15-5-29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTDetailManHuaLastupView.h"
#import "TTDefinitionHeader.h"

@interface TTDetailManHuaLastupView ()

//Contrains

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lastupLeft;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lastupWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lastupHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *BtnWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dateRight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dateWidth;

//views

@property (weak, nonatomic) IBOutlet UIButton *lastupBtn;

@property (weak, nonatomic) IBOutlet UILabel *lastupDate;

@end

@implementation TTDetailManHuaLastupView

+ (id)detailManHuaLastupView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"TTDetailManHuaLastupView" owner:nil options:nil] lastObject];
}

-(void)awakeFromNib
{
    self.lastupLeft.constant*=TTScale;
    self.lastupWidth.constant*=TTScale;
    self.lastupHeight.constant*=TTScale;
    self.BtnWidth.constant*=TTScale;
    self.dateRight.constant*=TTScale;
    self.dateWidth.constant*=TTScale;
    
    self.lastupBtn.layer.borderColor=[[UIColor lightGrayColor] CGColor];
    self.lastupBtn.layer.borderWidth=1.0;
    [self.lastupBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
}

-(void)setLastupBtnStr:(NSString *)lastupBtnStr
{
    [self.lastupBtn setTitle:lastupBtnStr forState:UIControlStateNormal];
    
}

-(void)setLastupDateStr:(NSString *)lastupDateStr
{
    NSString *dateStr = [lastupDateStr substringToIndex:10];
    
    self.lastupDate.text=[NSString stringWithFormat:@"更新时间:%@", dateStr];
}

@end
