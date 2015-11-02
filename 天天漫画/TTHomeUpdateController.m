//
//  TTHomeUpdateController.m
//  天天漫画
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTHomeUpdateController.h"
#import "TTHomeUpdateContentView.h"
#import "TTDefinitionHeader.h"
#import "LHNetWorking.h"
#import "TTHomeUpdateModel.h"
#import "TTDetailController.h"

@interface TTHomeUpdateController ()

@property(nonatomic,weak)TTHomeUpdateContentView *contentView;

@end

@implementation TTHomeUpdateController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TTHomeUpdateContentView *contentView = [TTHomeUpdateContentView homeUpdateContentViewWithUpdateBlock:^(NSString *comic_id){
        
        TTDetailController *comicDetail = [[TTDetailController alloc] init];
        comicDetail.comic_id=comic_id;
        
        UIViewController *menuController = self.menuController;
        [menuController.navigationController pushViewController:comicDetail animated:NO];
        
    }];
    
    self.contentView=contentView;
    [self.view addSubview:contentView];
    
    [self sendRequest];
}

- (void)sendRequest
{
    LHNetWorking *net = [[LHNetWorking alloc] init];
    NSURL *url = [NSURL URLWithString:UpdateUrl];
    [net requestWithBaseURL:url AndMethod:LHNetWorkingMethodGET AndParams:nil AndSuccessBlock:
     ^(NSData *data) {
         
         NSError *error=nil;
         
         NSDictionary *datadict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
         
         NSArray *array =  datadict[@"data"];
         NSMutableArray *allObjs = [NSMutableArray array];
         
         for(NSArray *arr in array){
             
             NSMutableArray *objs = [NSMutableArray array];
             for(NSDictionary *dict in arr){
                 TTHomeUpdateModel *model = [TTHomeUpdateModel homeUpdateModelWithDict:dict];
                 [objs addObject:model];
             }
             
             [allObjs addObject:objs];
         }
         
         self.contentView.current_index=[datadict[@"current_index"] longValue];
         self.contentView.dataArray=allObjs;
         
         
     } AndFailBolck:^(NSError *error) {
         
     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
