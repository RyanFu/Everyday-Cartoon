//
//  TTChaptersController.m
//  天天漫画
//
//  Created by slihe on 15/5/31.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "TTChaptersController.h"
#import "TTChaptersCacheView.h"
#import "TTDefinitionHeader.h"
#import "LHNetWorking.h"
#import "TTChapterModel.h"
#import "TTChaptersContentView.h"

@interface TTChaptersController ()

@property(nonatomic,weak)TTChaptersCacheView *cacheView;
@property(nonatomic,weak)TTChaptersContentView *chapterView;
@property(strong)NSMutableArray *imageArray;

@end

@implementation TTChaptersController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageArray = [NSMutableArray array];
    
    UIImageView *backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back_arrow"]];
    backImage.userInteractionEnabled=YES;
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:backImage];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backClick)];
    
    [backImage addGestureRecognizer:tap];
    
    
    TTChaptersContentView *contentView = [TTChaptersContentView chaptersContentView];
    self.chapterView=contentView;
    [self.view addSubview:contentView];
    
    TTChaptersCacheView *cacheView = [TTChaptersCacheView chaptersCacheView];
    self.cacheView = cacheView;
    [self.view addSubview:cacheView];
    
    [self sendRequest];
    
}

- (void)backClick
{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)sendRequest
{
    LHNetWorking *net = [[LHNetWorking alloc] init];
    
    NSString *urlstr= [NSString stringWithFormat:ChapterUrl, self.cid,self.comic_id];
    
    NSURL *url = [NSURL URLWithString:urlstr];
    [net requestWithBaseURL:url AndMethod:LHNetWorkingMethodGET AndParams:nil AndSuccessBlock:
     ^(NSData *data) {
         
         NSError *error=nil;
         
         NSDictionary *datadict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
         
         NSDictionary *dict =  datadict[@"data"];
         NSArray *image_infos = dict[@"img_infos"];
         
         NSMutableArray *array = [NSMutableArray array];
         for(NSDictionary *dic in image_infos){
             NSString *jpgUrl = dic[@"current_img_url"];
             [array addObject:jpgUrl];
         }
         
         dispatch_group_t group = dispatch_group_create();
         
         dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
         
         for(int i=0;i<array.count;i++){
             dispatch_group_async(group, queue, ^{
                 
                 NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:array[i]]];
                 
                 UIImage *image = [UIImage imageWithData:data];
                 if(image!=nil){
                     [self.imageArray addObject:image];
                 }
                 
                 dispatch_async(dispatch_get_main_queue(), ^{
                     self.cacheView.progress.progress+=1.0/array.count;
                     
                 });
                 
             });
         }
         
         dispatch_group_notify(group, queue, ^{
             
             dispatch_async(dispatch_get_main_queue(), ^{
                 
                 [self.cacheView removeFromSuperview];
                 
                 self.cacheView.progress.progress=1.0;
                 
                 self.chapterView.images=self.imageArray;
                 
             });
         });
         
     } AndFailBolck:^(NSError *error) {
         
     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
