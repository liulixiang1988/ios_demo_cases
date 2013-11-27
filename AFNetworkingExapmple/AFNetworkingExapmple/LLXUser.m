//
//  LLXUser.m
//  AFNetworkingExapmple
//
//  Created by 刘理想 on 13-11-26.
//  Copyright (c) 2013年 刘理想. All rights reserved.
//

#import "LLXUser.h"
@interface LLXUser()

@property(nonatomic, assign) NSUInteger userID;
@property(nonatomic, copy) NSString *username;
@property(nonatomic, copy) NSString *avatarImageURLString;
@end

@implementation LLXUser

-(instancetype)initWithAttributes:(NSDictionary *)attributes
{
    self =[super init];
    if(self){
        self.userID = [[attributes valueForKeyPath:@"id"] integerValue];
        self.username = [attributes valueForKeyPath:@"username"];
        self.avatarImageURLString = [attributes valueForKeyPath:@"avatar_image.url"];
    }
    return self;
}

-(NSURL*)avatarImageURL{
    return [NSURL URLWithString:self.avatarImageURLString];
}

@end
