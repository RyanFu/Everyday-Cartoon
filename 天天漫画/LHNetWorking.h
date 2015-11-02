//
//  QFNetWorking.h
//  QFNetWorking
//
//  Created by qianfeng on 15/5/12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, LHNetWorkingMethodType) {
    LHNetWorkingMethodGET,
    LHNetWorkingMethodPOST,
    LHNetWorkingMethodPUT,
    LHNetWorkingMethodDELETE,
};
typedef void (^SuccessBlock)(NSData *);
typedef void (^FailBlock)(NSError *);

@interface LHNetWorking : NSObject<NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
    SuccessBlock _successBlock;
    FailBlock    _failBlock;
    NSMutableData *_data;
}
-(void)requestWithBaseURL:(NSURL *)url  AndMethod:(LHNetWorkingMethodType)type AndParams:(NSDictionary *)params AndSuccessBlock:(SuccessBlock)sBlock AndFailBolck:(FailBlock)fBlock;
@end
