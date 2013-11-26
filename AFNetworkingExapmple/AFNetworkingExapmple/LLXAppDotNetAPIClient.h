//
//  LLXAppDotNetAPIClient.h
//  AFNetworkingExapmple
//
//  Created by 刘理想 on 13-11-26.
//  Copyright (c) 2013年 刘理想. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface LLXAppDotNetAPIClient : AFHTTPSessionManager
+(instancetype)shareClient;
@end
