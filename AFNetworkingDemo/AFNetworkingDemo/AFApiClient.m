//
//  OAApiClient.m
//  OA
//
//  Created by 刘理想 on 13-11-30.
//  Copyright (c) 2013年 刘理想. All rights reserved.
//

#import "AFApiClient.h"

static NSString *api_base_url = @"http://httpbin.org/";

@implementation AFApiClient

+(instancetype)sharedClient{
    static AFApiClient *_sharedClient = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        _sharedClient = [[AFApiClient alloc]
                         initWithBaseURL:[NSURL URLWithString:api_base_url]];
    });
    
    return _sharedClient;
}

-(id)initWithBaseURL:(NSURL *)url{
    self =[super initWithBaseURL:url];
    if(!self)
        return nil;
    //self.requestSerializer =[AFJSONRequestSerializer serializer];
    self.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    return self;
}

-(void)setUsername:(NSString*)username andPassword:(NSString*)password{
    [self.requestSerializer clearAuthorizationHeader];
    [self.requestSerializer setAuthorizationHeaderFieldWithUsername:username password:password];
}

-(void)setUsername:(NSString *)username andPassword:(NSString *)password andPhoneMac:(NSString *)phoneMac{
    [self.requestSerializer clearAuthorizationHeader];
    NSString *token = [NSString stringWithFormat:@"%@#%@#%@", username, password, phoneMac];
    [self.requestSerializer setAuthorizationHeaderFieldWithToken:token];
}

-(void)setToken:(NSString *)token
{
    [self.requestSerializer setValue:token forHTTPHeaderField:@"token"];
}

@end
