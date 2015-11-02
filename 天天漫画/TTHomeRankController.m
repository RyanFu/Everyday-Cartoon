//
//  TTHomeRankController.m
//  天天漫画
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTHomeRankController.h"
#import "TTHomeRankContentView.h"
#import "LHNetWorking.h"
#import "TTDefinitionHeader.h"
#import "TTHomeRankListModel.h"
#import "TTDetailController.h"

@interface TTHomeRankController ()

@property(nonatomic,weak)TTHomeRankContentView *contentView;

@property(nonatomic,strong)NSArray *dataArray;

@end

@implementation TTHomeRankController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TTHomeRankContentView *contentView = [TTHomeRankContentView homeRankContentViewWithComicBlock:^(NSString *comic_id){
        
        TTDetailController *detailController = [[TTDetailController alloc] init];
        detailController.comic_id=comic_id;
        
        UIViewController *menuController = self.menuController;
        [menuController.navigationController pushViewController:detailController animated:NO];
        
    }];
    self.contentView=contentView;
    [self.view addSubview:contentView];
    
    [self sendRequest];
    
}

- (void)sendRequest
{
    LHNetWorking *net = [[LHNetWorking alloc] init];
    NSURL *url = [NSURL URLWithString:RankUrl];
    [net requestWithBaseURL:url AndMethod:LHNetWorkingMethodGET AndParams:nil AndSuccessBlock:
     ^(NSData *data) {
         
         NSError *error=nil;
         
         NSDictionary *datadict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
         
         NSArray *array =  datadict[@"data"];
         NSMutableArray *dataArray = [NSMutableArray array];
         
         for(NSDictionary *dict in array){
             TTHomeRankListModel *listModel = [TTHomeRankListModel homeRankListModelWithDict:dict];
             
             [dataArray addObject:listModel];
         }
         
         _dataArray = dataArray;
         
         self.contentView.rankData = dataArray;
         
     } AndFailBolck:^(NSError *error) {
         
     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
