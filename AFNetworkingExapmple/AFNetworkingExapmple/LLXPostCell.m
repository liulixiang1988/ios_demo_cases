//
//  LLXPostCell.m
//  AFNetworkingExapmple
//
//  Created by 刘理想 on 13-11-27.
//  Copyright (c) 2013年 刘理想. All rights reserved.
//

#import "LLXPostCell.h"
#import "LLXUser.h"
#import "LLXPost.h"
#import "UIImageView+AFNetworking.h"

@implementation LLXPostCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.textLabel.adjustsFontSizeToFitWidth = YES;
        self.textLabel.textColor = [UIColor darkGrayColor];
        self.detailTextLabel.font = [UIFont systemFontOfSize:12.0f];
        self.detailTextLabel.numberOfLines = 0;
        self.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    return self;
}

-(void)setPost:(LLXPost *)post{
    _post = post;
    
    self.textLabel.text = _post.user.username;
    self.detailTextLabel.text = _post.text;
    [self.imageView setImageWithURL:_post.user.avatarImageURL
                   placeholderImage:[UIImage imageNamed:@"profile-image-placeholder"]];
    [self setNeedsLayout];
    
}

+(CGFloat)heightForCellWithPost:(LLXPost *)post
{
    CGSize sizeToFit = [post.text sizeWithFont:[UIFont systemFontOfSize:12.0f]
                             constrainedToSize:CGSizeMake(220.f, CGFLOAT_MAX)
                                 lineBreakMode:NSLineBreakByCharWrapping];
    return fmaxf(70.0f, sizeToFit.height + 45.0f);
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(10.0f, 10.0f, 50.0f, 50.0f);
    self.textLabel.frame = CGRectMake(70.0f, 10.0f, 240.0f, 20.0f);
    
    CGRect detailTextLabelFrame = CGRectOffset(self.textLabel.frame, 0.0f, 25.0f);
    detailTextLabelFrame.size.height = [[self class] heightForCellWithPost:self.post] - 45.0f;
    self.detailTextLabel.frame = detailTextLabelFrame;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
