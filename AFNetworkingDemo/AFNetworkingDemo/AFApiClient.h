//
//  OAApiClient.h
//  OA
//
//  Created by 刘理想 on 13-11-30.
//  Copyright (c) 2013年 刘理想. All rights reserved.
//

@interface AFApiClient : AFHTTPSessionManager
-(void)setUsername:(NSString*)username andPassword:(NSString*)password;
+ (instancetype)sharedClient;
-(void)setUsername:(NSString*)username andPassword:(NSString*)password andPhoneMac:(NSString*)phoneMac;
-(void)setToken:(NSString*)token;
@end
