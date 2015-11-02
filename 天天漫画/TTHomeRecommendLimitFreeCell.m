//
//  TTHomeRecommendLimitFreeCell.m
//  天天漫画
//
//  Created by qianfeng on 15-5-25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTHomeRecommendLimitFreeCell.h"
#import "TTDefinitionHeader.h"
#import "UIImageView+AFNetworking.h"

@interface TTHomeRecommendLimitFreeCell ()

//Contrains
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconBottomCon;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconLeftCon;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconTopCon;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameLeftCon;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameTopCon;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameWidthCon;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *starWithCon;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *starValueCon;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *authorWidthCon;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *introWidthCon;


//views
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *nameLab;

@property (weak, nonatomic) IBOutlet UILabel *gradeLab;

@property (weak, nonatomic) IBOutlet UILabel *authorLab;

@property (weak, nonatomic) IBOutlet UILabel *introLab;

@property (weak, nonatomic) IBOutlet UIView *starView;

@end

@implementation TTHomeRecommendLimitFreeCell

-(void)awakeFromNib
{
    _iconBottomCon.constant = _iconBottomCon.constant*TTScale;
    _iconLeftCon.constant = _iconLeftCon.constant*TTScale;
    _iconTopCon.constant = _iconTopCon.constant*TTScale;
    
    _nameLeftCon.constant = _nameLeftCon.constant*TTScale;
    _nameTopCon.constant = _nameTopCon.constant*TTScale;
    _nameWidthCon.constant = _nameWidthCon.constant*TTScale;
    
    _starWithCon.constant = _starWithCon.constant*TTScale;
    _starValueCon.constant = _starValueCon.constant*TTScale;
    
    _authorWidthCon.constant = _authorWidthCon.constant*TTScale;
    _introWidthCon.constant = _introWidthCon.constant*TTScale;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(iconClick:)];
    
    [self.iconImage addGestureRecognizer:tap];
    
}

-(void)setFree:(TTHomeRecommendLimitFree *)free
{
    _free=free;
    
    [self.iconImage setImageWithURL:[NSURL URLWithString:free.cover_url] placeholderImage:nil];
    
    self.nameLab.text=free.title;
    self.gradeLab.text=free.grade_ave;
    self.authorLab.text=free.artist_name;
    self.introLab.text=free.brief_intrd;
    
    [self fillStar];
}

- (void)fillStar
{
    float stars =  [self.free.grade_ave floatValue];
    
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

-(void)iconClick:(UITapGestureRecognizer *)tap
{
    self.block([NSString stringWithFormat:@"%ld", self.free.comic_id]);
}

@end
