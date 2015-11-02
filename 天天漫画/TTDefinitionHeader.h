//
//  TTDefinitionHeader.h
//  天天漫画
//
//  Created by qianfeng on 15-5-25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#ifndef _____TTDefinitionHeader_h
#define _____TTDefinitionHeader_h

//屏幕尺寸比例
#define TTScale ([UIScreen mainScreen].bounds.size.width/375.0)

/*
 *网络数据接口
 */
//推荐页面
#define RecommendUrl @"http://mobilev3.ac.qq.com/Home/homePageDetail/timestamp/1/user_imei/357073050639588/user_qq/null/user_local_version/4.6.3/user_channel/2015"

//分类页面
#define ClassifyUrl @"http://mobilev3.ac.qq.com/Classify/comicClassifyListV2/timestamp/1/user_imei/357073050639588/user_qq/null/user_local_version/4.6.3/user_channel/2015"

//排行页面
#define RankUrl @"http://mobilev3.ac.qq.com/Rank/rankList/timestamp/1/user_imei/357073050639588/user_qq/null/user_local_version/4.6.3/user_channel/2015"

//追更页面
#define UpdateUrl @"http://mobilev3.ac.qq.com/Update/updateTimeLine/timestamp/1/user_imei/357073050639588/user_qq/null/user_local_version/4.6.3/user_channel/2015"

//详情页面
#define DetailUrl @"http://mobilev3.ac.qq.com/Comic/comicDetail/comic_id/%@/page/1/listcnt/10000/user_imei/357073050639588/user_qq/null/user_local_version/4.6.3/user_channel/2015"

//分类具体
#define ClassifyDetailUrl @"http://mobilev3.ac.qq.com/Classify/comicClassifyDetail/classify_id/%@/sort_type/2/page/1/listcnt/15/user_imei/357073050639588/user_qq/null/user_local_version/4.6.3/user_channel/2015"

//漫画页面
#define ChapterUrl @"http://mobilev3.ac.qq.com/Comic/chapterPictureList/cid/%@/comic_id/%@/user_imei/357073050639588/user_qq/null/user_local_version/4.6.3/user_channel/2015"

#endif
