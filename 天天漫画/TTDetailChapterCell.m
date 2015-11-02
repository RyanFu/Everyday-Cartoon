//
//  TTDetailChapterCell.m
//  天天漫画
//
//  Created by qianfeng on 15-5-29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTDetailChapterCell.h"

@interface TTDetailChapterCell ()

@property (weak, nonatomic) IBOutlet UIButton *chapterBtn;


@end

@implementation TTDetailChapterCell

-(void)awakeFromNib
{
    self.layer.borderWidth=1.0;
    self.layer.borderColor=[[UIColor lightGrayColor] CGColor];
    
    [self.chapterBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

-(void)setChapter:(TTDetailChapter *)chapter
{
    [self.chapterBtn setTitle:chapter.btn_str forState:UIControlStateNormal];
}

@end
