//
//  TTDetailManHuaIntroView.m
//  天天漫画
//
//  Created by qianfeng on 15-5-29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTDetailManHuaIntroView.h"
#import "TTDefinitionHeader.h"
#import "UIView+ViewFrameExt.h"

@interface TTDetailManHuaIntroView ()

//Contrains

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *IntroTop;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *IntroHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *introWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *expandRight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *expandWidth;


//views
@property (weak, nonatomic) IBOutlet UILabel *IntroLab;

@property (weak, nonatomic) IBOutlet UIImageView *expandImage;


@end

@implementation TTDetailManHuaIntroView

+ (id)detailManHuaIntroView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"TTDetailManHuaIntroView" owner:nil options:nil] lastObject];
}

-(void)awakeFromNib
{
    self.IntroTop.constant*=TTScale;
    self.introWidth.constant*=TTScale;
    self.IntroHeight.constant*=TTScale;
    
    self.expandRight.constant*=TTScale;
    self.expandWidth.constant*=TTScale;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(introClick)];
    
    [self addGestureRecognizer:tap];
    
}

-(void)setIntro:(NSString *)intro
{
    _intro=intro;
    self.IntroLab.text=intro;
    
    CGFloat introHeight = [self introLabHeight];

    if (self.IntroHeight.constant>introHeight) {
    
        CGFloat offSet = introHeight - self.IntroHeight.constant;
        
        self.IntroHeight.constant=introHeight;
        
        self.heightConstraint.constant +=offSet ;
        
        [self.delegate updateContentView:self withOffSet:offSet];
        
    }
    
}

- (CGFloat)introLabHeight
{
    
    NSDictionary *dict = @{NSFontAttributeName: [UIFont systemFontOfSize:12]};
    
    CGRect labelsize = [self.intro boundingRectWithSize:CGSizeMake(self.introWidth.constant, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    return labelsize.size.height;
}

- (void)introClick
{
        static BOOL isOpen = NO;
    
        CGFloat height = 0;
    
        if (isOpen==YES) {
    
            height=35*TTScale;
            isOpen = NO;
            self.expandImage.image=[UIImage imageNamed:@"detail_intro_expand"];
    
        }else{
    
            height = [self introLabHeight];
            isOpen=YES;
    
            self.expandImage.image=[UIImage imageNamed:@"detail_intro_close"];
        }
    
    
            CGFloat offSet = height - self.IntroHeight.constant;
    
            self.IntroHeight.constant=height;
    
            self.heightConstraint.constant +=offSet ;
    
            [self.delegate updateContentView:self withOffSet:offSet];
}

@end
