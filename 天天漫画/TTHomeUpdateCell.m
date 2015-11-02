//
//  TTHomeUpdateCell.m
//  天天漫画
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTHomeUpdateCell.h"
#import "TTDefinitionHeader.h"
#import "UIImageView+AFNetworking.h"

@interface TTHomeUpdateCell ()

@property (weak, nonatomic) IBOutlet UIImageView *leftImage;

@property (weak, nonatomic) IBOutlet UIImageView *midImage;

@property (weak, nonatomic) IBOutlet UIImageView *rightImage;

@property (weak, nonatomic) IBOutlet UILabel *leftNameLab;

@property (weak, nonatomic) IBOutlet UILabel *midNameLab;

@property (weak, nonatomic) IBOutlet UILabel *rightNameLab;


@property (weak, nonatomic) IBOutlet UILabel *leftLastupLab;

@property (weak, nonatomic) IBOutlet UILabel *midLastupLab;

@property (weak, nonatomic) IBOutlet UILabel *rightLastupLab;

//Contrains

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageTop;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightImageRight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightImageBottom;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *midImageRight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftImageLeft;


@property (strong, nonatomic) IBOutlet NSLayoutConstraint *lineLeft;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pointWidth;

@end

@implementation TTHomeUpdateCell

+ (id)homeUpdateCellWithTableView:(UITableView *)tableView
{
    static NSString *updateCellID = @"updateCell";
    
    TTHomeUpdateCell *cell = [tableView dequeueReusableCellWithIdentifier:updateCellID];
    
    if (cell==nil) {
        UINib *nib = [UINib nibWithNibName:@"TTHomeUpdateCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:updateCellID];
        cell = [[nib instantiateWithOwner:nil options:nil] lastObject];
    }
    
    return cell;
}

- (void)awakeFromNib {
    self.imageTop.constant*=TTScale;
    self.rightImageRight.constant*=TTScale;
    self.rightImageBottom.constant*=TTScale;
    self.midImageRight.constant*=TTScale;
    self.leftImageLeft.constant*=TTScale;
    self.lineLeft.constant*=TTScale;
    self.pointWidth.constant*=TTScale;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(IconClick:)];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(IconClick:)];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(IconClick:)];
    
    self.leftImage.tag=0;
    self.midImage.tag=1;
    self.rightImage.tag=2;
    
    [self.leftImage addGestureRecognizer:tap];
    [self.midImage addGestureRecognizer:tap1];
    [self.rightImage addGestureRecognizer:tap2];
    
}

- (void)IconClick:(UITapGestureRecognizer *)tap
{
    UIImageView *view = (UIImageView *)tap.view;
    
    if (view.tag==0) {
        self.block(self.leftModel.comic_id);
    }else if (view.tag==1){
        self.block(self.midModel.comic_id);
    }else{
        self.block(self.rightModel.comic_id);
    }
}

-(void)setLeftModel:(TTHomeUpdateModel *)leftModel
{
    self.leftImage.image=nil;
    self.leftNameLab.text=@"";
    self.leftLastupLab.text=@"";
    
    _leftModel=leftModel;
    
    if (nil==leftModel) {
        return;
    }
    
    [self.leftImage setImageWithURL:[NSURL URLWithString:leftModel.cover_url] placeholderImage:nil];
    self.leftNameLab.text=leftModel.title;
    self.leftLastupLab.text=leftModel.lastup;
}

-(void)setMidModel:(TTHomeUpdateModel *)midModel
{
    
    self.midImage.image=nil;
    self.midNameLab.text=@"";
    self.midLastupLab.text=@"";
    
    _midModel=midModel;
    
    if (nil==midModel) {
        return;
    }
    
    [self.midImage setImageWithURL:[NSURL URLWithString:midModel.cover_url] placeholderImage:nil];
    self.midNameLab.text=midModel.title;
    self.midLastupLab.text=midModel.lastup;
}

-(void)setRightModel:(TTHomeUpdateModel *)rightModel
{
    self.rightImage.image=nil;
    self.rightNameLab.text=@"";
    self.rightLastupLab.text=@"";
    
    _rightModel=rightModel;
    
    if (nil==rightModel) {
        return;
    }
    
    [self.rightImage setImageWithURL:[NSURL URLWithString:rightModel.cover_url] placeholderImage:nil];
    self.rightNameLab.text=rightModel.title;
    self.rightLastupLab.text=rightModel.lastup;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
