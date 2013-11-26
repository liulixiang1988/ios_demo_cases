//
//  LLXAppDotNetAPIClient.m
//  AFNetworkingExapmple
//
//  Created by 刘理想 on 13-11-26.
//  Copyright (c) 2013年 刘理想. All rights reserved.
//

#import "LLXAppDotNetAPIClient.h"

static NSString * const LLXAppDotNetAPIBaseURLString = @"https://alpha-api.app.net/";

@implementation LLXAppDotNetAPIClient
+(instancetype)shareClient
{
    static LLXAppDotNetAPIClient *_shareClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareClient = [[LLXAppDotNetAPIClient alloc]
                        initWithBaseURL:[NSURL URLWithString:LLXAppDotNetAPIBaseURLString]];
    });
    return _shareClient;
}
@end
