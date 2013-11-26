//
//  LLXUser.h
//  AFNetworkingExapmple
//
//  Created by 刘理想 on 13-11-26.
//  Copyright (c) 2013年 刘理想. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLXUser : NSObject

@property(readonly, nonatomic, assign) NSUInteger userID;
@property(readonly, nonatomic, copy) NSString *username;
@property(readonly, nonatomic, weak) NSURL *avatarImageURL;

- (instancetype)initWithAttributes:(NSDictionary*)attributes;

@end
