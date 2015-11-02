//
//  TTDetailController.m
//  天天漫画
//
//  Created by qianfeng on 15-5-29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTDetailController.h"
#import "LHNetWorking.h"
#import "TTDefinitionHeader.h"
#import "TTDetailContentVIew.h"
#import "TTDetailManHua.h"
#import "TTChaptersController.h"

@interface TTDetailController ()<TTDetailContentVIewProtocol>

@property(nonatomic,weak)TTDetailContentVIew *contentView;

@end

@implementation TTDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"详情页";
    
    UIImageView *backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back_arrow"]];
    backImage.userInteractionEnabled=YES;
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:backImage];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backClick)];
    
    [backImage addGestureRecognizer:tap];
    
    
    TTDetailContentVIew *contentView = [TTDetailContentVIew detailContentVIew];
    self.contentView=contentView;
    self.contentView.delegate=self;
    [self.view addSubview:contentView];
    
    [self sendRequest];
}

- (void)backClick
{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)sendRequest
{
    LHNetWorking *net = [[LHNetWorking alloc] init];
    NSString *urlstr= [NSString stringWithFormat:DetailUrl, self.comic_id];
    
    NSURL *url = [NSURL URLWithString:urlstr];
    [net requestWithBaseURL:url AndMethod:LHNetWorkingMethodGET AndParams:nil AndSuccessBlock:
     ^(NSData *data) {
         
         NSError *error=nil;
         
         NSDictionary *datadict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
         
         NSDictionary *dict =  datadict[@"data"];
         TTDetailManHua *model = [TTDetailManHua detailManHuaWithDict:dict];
         
         self.contentView.detailManHua=model;
         
     } AndFailBolck:^(NSError *error) {
         
     }];
}

-(void)gotoChapter:(NSString *)comic_id andCid:(NSString *)cid
{
    TTChaptersController *controller = [[TTChaptersController alloc] init];
    controller.comic_id=comic_id;
    controller.cid=cid;
    
    [self.navigationController pushViewController:controller animated:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
