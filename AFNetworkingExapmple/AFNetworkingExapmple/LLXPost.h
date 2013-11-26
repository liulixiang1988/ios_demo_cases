//
//  LLXPost.h
//  AFNetworkingExapmple
//
//  Created by 刘理想 on 13-11-26.
//  Copyright (c) 2013年 刘理想. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LLXUser;

@interface LLXPost : NSObject

@property(nonatomic,assign) NSUInteger postID;
@property(nonatomic,strong) NSString *text;
@property(nonatomic, strong) LLXUser *user;

-(instancetype)initWithAttributes:(NSDictionary*)attributes;

+(NSURLSessionDataTask*)globalTimelinePostsWithBlock:(void (^)(NSArray *posts, NSError*))block;

@end
