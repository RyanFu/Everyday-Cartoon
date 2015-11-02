//
//  TTHomeRecommendController.m
//  天天漫画
//
//  Created by qianfeng on 15-5-25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTHomeRecommendController.h"
#import "LHNetWorking.h"
#import "TTHomeRecommendItemList.h"
#import "TTHomeRecommendLimitFreeList.h"
#import "TTHomeRecommendAdList.h"
#import "TTHomeRecommendContentView.h"
#import "TTDefinitionHeader.h"
#import "TTHomeRecommendSectionHeader.h"
#import "TTHomeRecommendCell.h"
#import "TTClassifyDetailController.h"
#import "TTDetailController.h"


@interface TTHomeRecommendController ()

@property(nonatomic,weak)TTHomeRecommendContentView *recommendView;

@property(nonatomic,strong)NSArray *datas;
@property(nonatomic,strong)NSArray *ads;

@end

@implementation TTHomeRecommendController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TTHomeRecommendContentView *recommendView = [TTHomeRecommendContentView homeRecommendContentViewWithComicBlock:^(NSString *comic_id){
        
        TTDetailController *comicDetail = [[TTDetailController alloc] init];
        comicDetail.comic_id=comic_id;
        
        UIViewController *menuController = self.menuController;
        [menuController.navigationController pushViewController:comicDetail animated:NO];
        
    } andclassifyBlock:^(NSString *comic_list_id){
        
        TTClassifyDetailController *classifyDetail = [[TTClassifyDetailController alloc] init];
        classifyDetail.classify_id=comic_list_id;
        
        UIViewController *menuController = self.menuController;
        [menuController.navigationController pushViewController:classifyDetail animated:NO];
        
    }];
    self.recommendView=recommendView;
    [self.view addSubview:recommendView];
    
    [self sendRequest];
}

-(NSArray *)datas
{
    if (nil == _datas) {
        NSMutableArray *objs = [NSMutableArray array];
        _datas=objs;
    }
    
    return _datas;
}

-(NSArray *)ads
{
    if (nil == _ads) {
        NSMutableArray *objs = [NSMutableArray array];
        _ads=objs;
    }
    
    return _ads;
}

- (void)sendRequest
{
    LHNetWorking *net = [[LHNetWorking alloc] init];
    NSURL *url = [NSURL URLWithString:RecommendUrl];
    [net requestWithBaseURL:url AndMethod:LHNetWorkingMethodGET AndParams:nil AndSuccessBlock:
     ^(NSData *data) {
         
         NSError *error=nil;
         
         NSDictionary *datadict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
         
         NSDictionary *dict =  datadict[@"data"];
         
         NSMutableArray *dataArray = [NSMutableArray array];
         
         [dataArray addObject:[TTHomeRecommendAdList homeRecommendAdListWithDict:dict[@"banner"]]];
         
         [dataArray addObject:[TTHomeRecommendLimitFreeList homeRecommendLimitFreeListWithDict:dict[@"limitFree"]]];
         [dataArray addObject:[TTHomeRecommendItemList homeRecommendItemListWithDict:dict[@"comicList1"]]];
         [dataArray addObject:[TTHomeRecommendItemList homeRecommendItemListWithDict:dict[@"comicList2"]]];
         [dataArray addObject:[TTHomeRecommendItemList homeRecommendItemListWithDict:dict[@"comicList3"]]];
         [dataArray addObject:[TTHomeRecommendItemList homeRecommendItemListWithDict:dict[@"comicList4"]]];
         [dataArray addObject:[TTHomeRecommendItemList homeRecommendItemListWithDict:dict[@"comicList5"]]];
         [dataArray addObject:[TTHomeRecommendItemList homeRecommendItemListWithDict:dict[@"manga"]]];
         [dataArray addObject:[TTHomeRecommendItemList homeRecommendItemListWithDict:dict[@"comicList6"]]];
         [dataArray addObject:[TTHomeRecommendItemList homeRecommendItemListWithDict:dict[@"comicList7"]]];
         [dataArray addObject:[TTHomeRecommendItemList homeRecommendItemListWithDict:dict[@"comicList8"]]];
         [dataArray addObject:[TTHomeRecommendItemList homeRecommendItemListWithDict:dict[@"comicList9"]]];
         
         self.recommendView.collectionData=dataArray;
         
         
     } AndFailBolck:^(NSError *error) {
         
     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
