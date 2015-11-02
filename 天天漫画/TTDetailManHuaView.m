//
//  TTDetailManHuaView.m
//  天天漫画
//
//  Created by qianfeng on 15-5-28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTDetailManHuaView.h"
#import "TTDefinitionHeader.h"
#import "UIImageView+AFNetworking.h"

@interface TTDetailManHuaView ()

//Contrains
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconTop;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconLeft;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconWidth;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameLeft;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameTop;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *authorWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *authotLabWidth;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *typeWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *typeLabWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scoreWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *starViewWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scoreValueWidth;

//views
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnTop;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnBottom;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftBtnLeft;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *midBtnLeft;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightBtnLeft;


//
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *nameLab;

@property (weak, nonatomic) IBOutlet UILabel *authorLab;

@property (weak, nonatomic) IBOutlet UILabel *scoreLab;

@property (weak, nonatomic) IBOutlet UILabel *typeLab;

@property (weak, nonatomic) IBOutlet UIView *startView;



@end

@implementation TTDetailManHuaView

+ (id)detailManHuaView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"TTDetailManHuaView" owner:nil options:nil] lastObject];
}

-(void)awakeFromNib
{
    self.iconTop.constant*=TTScale;
    self.iconLeft.constant*=TTScale;
    self.iconWidth.constant*=TTScale;
    
    self.nameLeft.constant*=TTScale;
    self.nameTop.constant*=TTScale;
    self.authorWidth.constant*=TTScale;
    self.authotLabWidth.constant*=TTScale;
    
    self.typeWidth.constant*=TTScale;
    self.typeLabWidth.constant*=TTScale;
    self.scoreWidth.constant*=TTScale;
    self.starViewWidth.constant*=TTScale;
    self.scoreValueWidth.constant*=TTScale;
    
    self.btnTop.constant*=TTScale;
    self.btnBottom.constant*=TTScale;
    self.leftBtnLeft.constant*=TTScale;
    self.midBtnLeft.constant*=TTScale;
    self.rightBtnLeft.constant*=TTScale;
}

-(void)setManhua:(TTDetailManHua *)manhua
{
    _manhua=manhua;
    
    [self.iconImage setImageWithURL:[NSURL URLWithString:manhua.cover_url] placeholderImage:nil];
    self.nameLab.text=manhua.title;
    self.authorLab.text=manhua.artist_name;
    self.scoreLab.text=manhua.grade_ave;
    self.typeLab.text=manhua.type;
    
    [self fillStar];
}

- (void)fillStar
{
    float stars =  [self.manhua.grade_ave floatValue];
    
    int star = stars/2;
    int half = (int)stars%2;
    
    if(star>5){
        return;
    }else{
        NSArray *starViews = [self.startView subviews];
        
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

@end
