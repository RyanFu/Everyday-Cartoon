//
//  TTChaptersCacheView.m
//  天天漫画
//
//  Created by slihe on 15/5/31.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTChaptersCacheView.h"
#import "TTDefinitionHeader.h"

@interface TTChaptersCacheView ()

//Contrains
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *iconTop;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *iconWidth;


@property (strong, nonatomic) IBOutlet NSLayoutConstraint *progressWidth;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *progressTop;


@property (strong, nonatomic) IBOutlet NSLayoutConstraint *textLabTop;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *textLabWidth;

//Views

@property (strong, nonatomic) IBOutlet UIImageView *iconImage;


@end

@implementation TTChaptersCacheView

+ (id)chaptersCacheView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"TTChaptersCacheView" owner:nil options:nil] lastObject];
}

-(void)awakeFromNib
{
    self.iconTop.constant*=TTScale;
    self.iconWidth.constant*=TTScale;
    self.progressWidth.constant*=TTScale;
    self.progressTop.constant*=TTScale;
    self.textLabTop.constant*=TTScale;
    self.textLabWidth.constant*=TTScale;
    
    [self imagesXiaoLu];
    
}

- (void)imagesXiaoLu{
    self.iconImage.animationImages=@[[UIImage imageNamed:@"loading_gif_xiaolu_1"],
                                     [UIImage imageNamed:@"loading_gif_xiaolu_2"],
                                     [UIImage imageNamed:@"loading_gif_xiaolu_3"],
                                     [UIImage imageNamed:@"loading_gif_xiaolu_4"]];
    
    self.iconImage.animationDuration=0.5;
    self.iconImage.animationRepeatCount=1000;
    
    [self.iconImage startAnimating];
    
}

-(void)willMoveToSuperview:(UIView *)newSuperview
{
    self.frame=newSuperview.bounds;

}

@end
