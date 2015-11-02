//
//  TTHomeClassifyController.m
//  天天漫画
//
//  Created by qianfeng on 15-5-26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTHomeClassifyController.h"
#import "TTDefinitionHeader.h"
#import "TTHomeClassifyContentView.h"
#import "LHNetWorking.h"
#import "TTHomeClassifyModel.h"
#import "TTHomeClassifyCell.h"
#import "TTClassifyDetailController.h"

@interface TTHomeClassifyController ()

@property(nonatomic,weak)TTHomeClassifyContentView *contentView;

@end

@implementation TTHomeClassifyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TTHomeClassifyContentView *contentView = [TTHomeClassifyContentView homeClassifyContentViewWithClassifyBlock:^(TTHomeClassifyCell *cell){
        
        TTHomeClassifyModel *model = cell.classify;
        
        TTClassifyDetailController *detailController = [[TTClassifyDetailController alloc] init];
        detailController.classify_id = model.classify_id;
        detailController.title=model.classify_title;
        
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
    NSURL *url = [NSURL URLWithString:ClassifyUrl];
    [net requestWithBaseURL:url AndMethod:LHNetWorkingMethodGET AndParams:nil AndSuccessBlock:
     ^(NSData *data) {
         
         NSError *error=nil;
         
         NSDictionary *datadict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
         
         NSArray *array =  datadict[@"data"];
         NSMutableArray *objs = [NSMutableArray array];
         
         for(NSDictionary *dict in array){
             TTHomeClassifyModel *model = [TTHomeClassifyModel homeClassifyModelWithDict:dict];
             [objs addObject:model];
         }
         
         self.contentView.classifyData=objs;
         
     } AndFailBolck:^(NSError *error) {
         
     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
