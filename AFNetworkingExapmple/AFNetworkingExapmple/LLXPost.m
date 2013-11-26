//
//  LLXPost.m
//  AFNetworkingExapmple
//
//  Created by 刘理想 on 13-11-26.
//  Copyright (c) 2013年 刘理想. All rights reserved.
//

#import "LLXPost.h"
#import "LLXUser.h"
#import "LLXAppDotNetAPIClient.h"

@implementation LLXPost

-(instancetype)initWithAttributes:(NSDictionary *)attributes{
    self = [super init];
    if (self) {
        self.postID = [[attributes valueForKeyPath:@"id"] integerValue];
        self.text = [attributes valueForKeyPath:@"text"];
        
        self.user = [[LLXUser alloc] initWithAttributes:[attributes valueForKeyPath:@"user"]];

    }
    return self;
}

+(NSURLSessionTask*)globalTimelinePostsWithBlock:(void (^)(NSArray *posts, NSError*))block
{
    return [[LLXAppDotNetAPIClient shareClient]
            GET:@"stream/0/posts/stream/global"
            parameters:nil
            success:^(NSURLSessionDataTask *task, id json){
                NSArray *postsFromResponse = [json valueForKey:@"data"];
                NSMutableArray *mutablePosts = [NSMutableArray arrayWithCapacity:[postsFromResponse count]];
                for (NSDictionary *attributes in postsFromResponse) {
                    LLXPost *post = [[LLXPost alloc] initWithAttributes:attributes];
                    [mutablePosts addObject:post];
                }
                
                if (block) {
                    block([NSArray arrayWithArray:mutablePosts], nil);
                }
            }
            failure:^(NSURLSessionDataTask *task, NSError *error){
                if (block) {
                    block([NSArray array], error);
                }
            }];
}
@end
