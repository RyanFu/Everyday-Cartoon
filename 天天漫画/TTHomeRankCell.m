//
//  TTHomeRankCell.m
//  天天漫画
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTHomeRankCell.h"
#import "TTDefinitionHeader.h"
#import "UIImageView+AFNetworking.h"

@interface TTHomeRankCell ()

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

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *stateImageRight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *stateImageWidth;



@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *nameLab;

@property (weak, nonatomic) IBOutlet UILabel *starLab;

@property (weak, nonatomic) IBOutlet UILabel *typeLab;

@property (weak, nonatomic) IBOutlet UILabel *lastupLab;

@property (weak, nonatomic) IBOutlet UIImageView *stateImage;

@property (weak, nonatomic) IBOutlet UIView *starView;



@end

@implementation TTHomeRankCell

+ (id)homeRankCellWithTableView:(UITableView *)tableView
{
    static NSString *RankCellID = @"rankCell";
    
    TTHomeRankCell *cell = [tableView dequeueReusableCellWithIdentifier:RankCellID];
    
    if (cell==nil) {
        UINib *nib = [UINib nibWithNibName:@"TTHomeRankCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:RankCellID];
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
    
    self.stateImageRight.constant=self.stateImageRight.constant*TTScale;
    self.stateImageWidth.constant=self.stateImageWidth.constant*TTScale;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(iconClick:)];
    
    [self.iconImage addGestureRecognizer:tap];
    
}

-(void)iconClick:(UITapGestureRecognizer *)tap
{
    self.block([NSString stringWithFormat:@"%ld", self.rank.comic_id]);
}

-(void)setRank:(TTHomeRankModel *)rank
{
    _rank=rank;
    
    [self.iconImage setImageWithURL:[NSURL URLWithString:rank.cover_url] placeholderImage:nil];
    self.nameLab.text=rank.title;
    self.starLab.text=rank.grade_ave;
    self.typeLab.text=[NSString stringWithFormat:@"类型:%@", rank.type];
    self.lastupLab.text=[NSString stringWithFormat:@"更新至:%@", rank.lastup];
    
    switch (rank.trend) {
        case 1:
            self.stateImage.image=[UIImage imageNamed:@"top_rocket_up"];
            break;
            
        case 2:
            self.stateImage.image=[UIImage imageNamed:@"top_flat"];
            break;
            
        case 3:
            self.stateImage.image=[UIImage imageNamed:@"top_rocket_down"];
            break;
            
        default:
            break;
    }

    [self fillStar];
}


- (void)fillStar
{
    float stars =  [self.rank.grade_ave floatValue];
    
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
