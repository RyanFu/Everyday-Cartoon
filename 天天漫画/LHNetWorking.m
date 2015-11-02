//
//  QFNetWorking.m
//  QFNetWorking
//
//  Created by qianfeng on 15/5/12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "LHNetWorking.h"


@implementation LHNetWorking
-(void)requestWithBaseURL:(NSURL *)url  AndMethod:(LHNetWorkingMethodType)type AndParams:(NSDictionary *)params AndSuccessBlock:(SuccessBlock)sBlock AndFailBolck:(FailBlock)fBlock
{
    _successBlock = [sBlock copy];
    _failBlock    = [fBlock copy];
    _data         = [[NSMutableData alloc] init];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    if (LHNetWorkingMethodGET == type) {
        [request setHTTPMethod:@"GET"];
    }
    else if (LHNetWorkingMethodPOST == type) {
        [request setHTTPMethod:@"POST"];
        NSMutableString *bodyStr = [[NSMutableString alloc] init];
        for (NSString *key in [params allKeys]) {
            [bodyStr appendFormat:@"%@=%@&",key,[params objectForKey:key]];
        }
        NSData *bodyData = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:bodyData];
    }
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    _failBlock(error);
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_data appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    _successBlock(_data);
}
@end
