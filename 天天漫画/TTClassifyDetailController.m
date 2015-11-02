//
//  TTClassifyDetailController.m
//  天天漫画
//
//  Created by qianfeng on 15-5-30.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTClassifyDetailController.h"
#import "TTClassifyDetailContentView.h"
#import "LHNetWorking.h"
#import "TTDefinitionHeader.h"
#import "TTClassifyDetail.h"
#import "TTDetailController.h"

@interface TTClassifyDetailController ()

@property(nonatomic,weak)TTClassifyDetailContentView *contentView;

@end

@implementation TTClassifyDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=self.title;
    UIImageView *backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back_arrow"]];
    backImage.userInteractionEnabled=YES;
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:backImage];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backClick)];
    
    [backImage addGestureRecognizer:tap];
    
    
    
    TTClassifyDetailContentView *contentView = [TTClassifyDetailContentView classifyDetailContentViewWithComicBlock:^(NSString *comic_id){
        
        TTDetailController *comicDetail = [[TTDetailController alloc] init];
        comicDetail.comic_id=comic_id;
        
        [self.navigationController pushViewController:comicDetail animated:NO];
        
    }];
    
    self.contentView=contentView;
    
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
    NSString *urlStr = [NSString stringWithFormat:ClassifyDetailUrl, self.classify_id];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    [net requestWithBaseURL:url AndMethod:LHNetWorkingMethodGET AndParams:nil AndSuccessBlock:
     ^(NSData *data) {
         
         NSError *error=nil;
         
         NSDictionary *datadict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
         
         NSArray *array =  datadict[@"data"];
         NSMutableArray *dataArray = [NSMutableArray array];
         
         for(NSDictionary *dict in array){
             TTClassifyDetail *model = [TTClassifyDetail classifyDetailWithDict:dict];
             [dataArray addObject:model];
         }
         
         self.contentView.classifyData = dataArray;
             
         
     } AndFailBolck:^(NSError *error) {
         
     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
