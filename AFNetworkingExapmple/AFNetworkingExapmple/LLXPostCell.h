//
//  LLXPostCell.h
//  AFNetworkingExapmple
//
//  Created by 刘理想 on 13-11-27.
//  Copyright (c) 2013年 刘理想. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LLXPost;

@interface LLXPostCell : UITableViewCell

@property(nonatomic, strong) LLXPost *post;

+(CGFloat)heightForCellWithPost:(LLXPost *)post;

@end
