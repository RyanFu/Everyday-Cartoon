//
//  TTClassifyDetailCell.m
//  天天漫画
//
//  Created by qianfeng on 15-5-30.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTClassifyDetailCell.h"
#import "TTDefinitionHeader.h"
#import "UIImageView+AFNetworking.h"

@interface TTClassifyDetailCell ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageTop;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageBottom;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageLeft;

//nameLab
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameLabLeft;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameLabTop;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameLabWidth;

//starView
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *starViewWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *statLabWidth;

//starLab
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *typeLabWidth;

//lastupLab
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lastupLabWidth;

//stateImage
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineRight;


//Views
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *nameLab;

@property (weak, nonatomic) IBOutlet UILabel *starLab;

@property (weak, nonatomic) IBOutlet UILabel *typeLab;

@property (weak, nonatomic) IBOutlet UILabel *lastupLab;

@property (weak, nonatomic) IBOutlet UIView *starView;


@end

@implementation TTClassifyDetailCell

+ (id)classifyDetailCellWithTableView:(UITableView *)tableView
{
    static NSString *classifyDetailCellID = @"classifyDetailCell";
    
    TTClassifyDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:classifyDetailCellID];
    
    if (cell==nil) {
        UINib *nib = [UINib nibWithNibName:@"TTClassifyDetailCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:classifyDetailCellID];
        cell = [[nib instantiateWithOwner:nil options:nil] lastObject];
    }
    
    return cell;
}

- (void)awakeFromNib {
    self.imageTop.constant=self.imageTop.constant*TTScale;
    self.imageBottom.constant=self.imageBottom.constant*TTScale;
    self.imageLeft.constant=self.imageLeft.constant*TTScale;
    
    self.nameLabLeft.constant=self.nameLabLeft.constant*TTScale;
    self.nameLabTop.constant=self.nameLabTop.constant*TTScale;
    self.nameLabWidth.constant=self.nameLabWidth.constant*TTScale;
    
    self.starViewWidth.constant=self.starViewWidth.constant*TTScale;
    self.statLabWidth.constant=self.statLabWidth.constant*TTScale;
    
    self.typeLabWidth.constant=self.typeLabWidth.constant*TTScale;
    self.lastupLabWidth.constant=self.lastupLabWidth.constant*TTScale;
    self.lineRight.constant=self.lineRight.constant*TTScale;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(IconClick:)];
    
    [self.iconImage addGestureRecognizer:tap];
}

- (void)IconClick:(UITapGestureRecognizer *)tap
{
    _block(_classifyDetail.comic_id);
}

-(void)setClassifyDetail:(TTClassifyDetail *)classifyDetail
{
    _classifyDetail=classifyDetail;
    
    [self.iconImage setImageWithURL:[NSURL URLWithString:classifyDetail.cover_url] placeholderImage:nil];
    self.nameLab.text=classifyDetail.title;
    self.starLab.text=classifyDetail.grade_ave;
    self.typeLab.text=[NSString stringWithFormat:@"类型:%@", classifyDetail.type];
    self.lastupLab.text=[NSString stringWithFormat:@"更新至:%@", classifyDetail.lastup];
    
    [self fillStar];
}

- (void)fillStar
{
    float stars =  [self.classifyDetail.grade_ave floatValue];
    
    int star = stars/2;
    int half = (int)stars%2;
    
    if(star>5){
        return;
    }else{
        NSArray *starViews = [self.starView subviews];
        
        for(int i=0;i<star;i++){
            UIImageView *starView = starViews[i];
            starView.image=[UIImage imageNamed:@"star_light"];
        }
        
        if (half>=1) {
            UIImageView *starView = starViews[star];
            starView.image=[UIImage imageNamed:@"star_half"];
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
