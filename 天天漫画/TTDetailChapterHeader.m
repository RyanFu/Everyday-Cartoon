//
//  TTDetailChapterHeader.m
//  天天漫画
//
//  Created by qianfeng on 15-5-29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTDetailChapterHeader.h"

@interface TTDetailChapterHeader ()

//Contrains

//Viwes
@property (strong, nonatomic) IBOutlet UILabel *orderLab;

@property (strong, nonatomic) IBOutlet UIImageView *arrowImage;

@end

@implementation TTDetailChapterHeader

-(void)awakeFromNib
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(orderClick)];
    
    [self.orderLab addGestureRecognizer:tap];
}

- (void)orderClick
{
    
    //NO代表倒序， YES代表正序
    static BOOL order = YES;
    
    if(order==YES){
        self.orderLab.text=@"倒序";
        self.arrowImage.image=[UIImage imageNamed:@"sort_negative"];
        order=NO;
    }else{
        
        self.arrowImage.image=[UIImage imageNamed:@"sort_positive"];
        self.orderLab.text=@"正序";
        order=YES;
    }
    
    [self.delegate updateChaptersOrder:self andOrder:order];
}

@end
